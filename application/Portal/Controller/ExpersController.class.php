<?php
namespace Portal\Controller;
use Common\Controller\HomebaseController;

class ExpersController extends HomebaseController {
	protected $posts_model;
	protected $term_relationships_model;
	protected $terms_model;
	protected $user_model;
	
	function _initialize() {
		parent::_initialize();
		$this->posts_model = D("Portal/Posts");
		$this->terms_model = D("Portal/Terms");
		$this->term_relationships_model = D("Portal/TermRelationships");
		$this->user_model = D("Common/Users");
	}
    
    // 前台用户添加经验
    public function add(){
        $this->check_login();
        $this->_getTermTree();
        $this->display();
    }
    
    // 前台用户添加经验提交
    public function add_post(){
        if(IS_POST){
            $this->check_login();

            if(empty($_POST['term'])){
                $this->error("请至少选择一个分类！");
            }
            $posts_model=M('Posts');
            $term_relationships_model=M('TermRelationships');
            
            $_POST['smeta']['thumb'] = sp_asset_relative_url($_POST['smeta']['thumb']);
            
            $_POST['post']['post_date']=date("Y-m-d H:i:s",time());
            $_POST['post']['post_modified']=date("Y-m-d H:i:s",time());
            $_POST['post']['post_author']=sp_get_current_userid();
            $article=I("post.post");
            $article['smeta']=json_encode($_POST['smeta']);
            $article['post_content']=safe_html(htmlspecialchars_decode($article['post_content']));
            if ($posts_model->field('post_type,post_date,post_author,post_keywords,post_excerpt,post_content,post_title,post_modified,smeta')->create($article)!==false) {
                $result=$posts_model->add();
                if ($result) {
					foreach ($_POST['term'] as $mterm_id){
						$term_relationships_model->add(array("term_id"=>intval($mterm_id),"posts_id"=>$result));
					}
                    $this->success("经验添加成功！");
                } else {
                    $this->error("经验添加失败！");
                }
            }else{
                $this->error($posts_model->getError());
            }
            
            
        }
    
    }
    
    // 前台用户经验编辑
    public function edit(){
        $this->check_login();
        $id=I("get.id",0,'intval');
        $terms_model=M('Terms');
        $posts_model=M('Posts');
        
        $term_relationship = M('TermRelationships')->where(array("posts_id"=>$id,"status"=>1))->getField("term_id",true);
		$this->_getTermTree($term_relationship);
        $post=$posts_model->where(array('id'=>$id,'post_author'=>sp_get_current_userid()))->find();
        if(!empty($post)){
            $this->assign("post",$post);
            $this->assign("smeta",json_decode($post['smeta'],true));
            $this->display();
        }else{
            $this->error('您编辑的经验不存在！');
        }
        
    }
    
    // 前台用户经验编辑提交
    public function edit_post(){
        if(IS_POST){
            $this->check_login();

            $posts_model=M('Posts');
            
			if(empty($_POST['term'])){
				$this->error("请至少选择一个分类！");
			}
			$post_id=intval($_POST['post']['id']);
			
			$this->term_relationships_model->where(array("posts_id"=>$post_id,"term_id"=>array("not in",implode(",", $_POST['term']))))->delete();
			foreach ($_POST['term'] as $mterm_id){
				$find_term_relationship=$this->term_relationships_model->where(array("posts_id"=>$post_id,"term_id"=>$mterm_id))->count();
				if(empty($find_term_relationship)){
					$this->term_relationships_model->add(array("term_id"=>intval($mterm_id),"posts_id"=>$post_id));
				}else{
					$this->term_relationships_model->where(array("posts_id"=>$post_id,"term_id"=>$mterm_id))->save(array("status"=>1));
				}
			}
				
            $_POST['smeta']['thumb'] = sp_asset_relative_url($_POST['smeta']['thumb']);
            $_POST['post']['post_modified']=date("Y-m-d H:i:s",time());
            $article=I("post.post");
            $article['smeta']=json_encode($_POST['smeta']);
            $article['post_content']=safe_html(htmlspecialchars_decode($article['post_content']));
            if ($posts_model->field('id,post_type,post_author,post_keywords,post_excerpt,post_content,post_title,post_modified,smeta')->create($article)!==false) {
                $result=$posts_model->where(array('id'=>$article['id'],'post_author'=>sp_get_current_userid()))->save($article);
                if ($result!==false) {
                    $this->success("经验编辑成功！");
                } else {
                    $this->error("经验编辑失败！");
                }
            }else{
                $this->error($posts_model->getError());
            }
            
        }
    }
    
    // 获取经验分类树结构
   private function _getTermTree($term=array()){
		$result = $this->terms_model->order(array("listorder"=>"asc"))->select();
		
		$tree = new \Tree();
		$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
		$tree->nbsp = '&nbsp;&nbsp;&nbsp;';
		foreach ($result as $r) {
			$r['str_manage'] = '<a href="' . U("AdminTerm/add", array("parent" => $r['term_id'])) . '">添加子类</a> | <a href="' . U("AdminTerm/edit", array("id" => $r['term_id'])) . '">修改</a> | <a class="js-ajax-delete" href="' . U("AdminTerm/delete", array("id" => $r['term_id'])) . '">删除</a> ';
			$r['visit'] = "<a href='#'>访问</a>";
			$r['taxonomys'] = $this->taxonomys[$r['taxonomy']];
			$r['id']=$r['term_id'];
			$r['parentid']=$r['parent'];
			$r['selected']=in_array($r['term_id'], $term)?"selected":"";
			$r['checked'] =in_array($r['term_id'], $term)?"checked":"";
			$array[] = $r;
		}
		
		$tree->init($array);
		$str="<option value='\$id' \$selected>\$spacer\$name</option>";
		$taxonomys = $tree->get_tree(0, $str);
		$this->assign("taxonomys", $taxonomys);
	}
}