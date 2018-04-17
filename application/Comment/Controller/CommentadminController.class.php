<?php
namespace Comment\Controller;

use Common\Controller\AdminbaseController;

class CommentadminController extends AdminbaseController{
	
	protected $comments_model;
	protected $user_model;

	public function _initialize(){
		parent::_initialize();
		$this->comments_model=D("Common/Comments");
		$this->user_model = D("Common/Users");
	}

	// 评论列表
	public function index($table=""){
		$where=array();
		if(!empty($table)){
			$where['post_table']=$table;
		}
		
		$user_id = sp_get_current_admin_id();
		$user_type=$this->user_model->where("id=$user_id")->getField("user_type");

		$post_id=I("get.post_id");
		if(!empty($post_id) && $user_type == 1){
			$where['post_id']=$post_id;
		}
		if($user_type != 1){
			$where['uid|to_uid']=$user_id;
		}
		//}

		$count=$this->comments_model->where($where)->count();
		$page = $this->page($count, 20);
		
		$comments=$this->comments_model
		->where($where)
		->limit($page->firstRow . ',' . $page->listRows)
		->order("createtime DESC")
		->select();

		$this->assign("comments",$comments);
		$this->assign("user_type",$user_type);
		$this->assign("page", $page->show('Admin'));
		$this->display(":index");
	}
	
	public function plindex($table=""){
		$where=array();
		if(!empty($table)){
			$where['post_table']=$table;
		}
		
		$user_id = sp_get_current_admin_id();
		$user_type=$this->user_model->where("id=$user_id")->getField("user_type");

		$post_id=I("get.post_id");
		if(!empty($post_id) && $user_type == 1){
			$where['post_id']=$post_id;
		}
		if($user_type != 1){
			$where['uid|to_uid']=$user_id;
		}
		//}

		$count=$this->comments_model->where($where)->count();
		$page = $this->page($count, 20);
		
		$comments=$this->comments_model
		->where($where)
		->limit($page->firstRow . ',' . $page->listRows)
		->order("createtime DESC")
		->select();

		$this->assign("comments",$comments);
		$this->assign("user_type",$user_type);
		$this->assign("page", $page->show('Admin'));
		$this->display(":index");
	}
	
	// 后台评论删除
	public function delete(){
		if(isset($_GET['id'])){
			$id = intval(I("get.id"));
			$score=$this->comments_model->where("id=$id")->getField("score");
			$post_id=$this->comments_model->where("id=$id")->getField("post_id");
			if ($this->comments_model->where("id=$id")->delete()!==false) {
				if($score == 5){
					$this->user_model->where(array('id'=>$post_id))->setDec('user_love',1);
				}
				$this->user_model->where(array('id'=>$post_id))->setDec('comment_count',1);
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
		if(isset($_POST['ids'])){
			$ids=join(",",$_POST['ids']);
			$scores=$this->comments_model->where("id in ($ids)")->getField("score",true);
			$post_ids=$this->comments_model->where("id in ($ids)")->getField("post_id",true);
			for($i=0;$i<count($post_ids);$i++){
			$this->user_model->where(array('id'=>$post_ids[$i]))->setDec('comment_count',1);
			if($scores[$i] == 5){
			$this->user_model->where(array('id'=>$post_ids[$i]))->setDec('user_love',1);
			}
			}
			if ($this->comments_model->where("id in ($ids)")->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}
	
	// 后台评论审核
	public function check(){
		if(isset($_POST['ids']) && $_GET["check"]){
			$data["status"]=1;
				
			$ids=join(",",$_POST['ids']);
			
			if ( $this->comments_model->where("id in ($ids)")->save($data)!==false) {
				$this->success("审核成功！");
			} else {
				$this->error("审核失败！");
			}
		}
		if(isset($_POST['ids']) && $_GET["uncheck"]){
				
			$data["status"]=0;
			$ids=join(",",$_POST['ids']);
			if ( $this->comments_model->where("id in ($ids)")->save($data)!==false) {
				$this->success("取消审核成功！");
			} else {
				$this->error("取消审核失败！");
			}
		}
	}
	
}