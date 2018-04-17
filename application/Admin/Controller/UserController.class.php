<?php
namespace Admin\Controller;

use Common\Controller\AdminbaseController;

class UserController extends AdminbaseController{

	protected $users_model,$role_model;
	protected $term_relationships_model;
	protected $terms_model;

	public function _initialize() {
		parent::_initialize();
		$this->users_model = D("Common/Users");
		$this->role_model = D("Common/Role");
		$this->terms_model = D("Portal/Terms");
		$this->term_relationships_model = D("Portal/TermRelationships");
	}

	// 普通会员列表
	public function index(){
		$where = array("user_type"=>2);
		/**搜索条件**/
		$user_login = I('request.user_login');
		$user_email = trim(I('request.user_email'));
		if($user_login){
			$where['user_login'] = array('like',"%$user_login%");
		}
		
		if($user_email){
			$where['user_email'] = array('like',"%$user_email%");;
		}
		
		$count=$this->users_model->where($where)->count();
		$page = $this->page($count, 20);
        $users = $this->users_model
            ->where($where)
            ->order("create_time DESC")
            ->limit($page->firstRow, $page->listRows)
            ->select();
		$roles_src=$this->role_model->select();
		$roles=array();
		foreach ($roles_src as $r){
			$roleid=$r['id'];
			$roles["$roleid"]=$r;
		}
		$this->assign("page", $page->show('Admin'));
		$this->assign("roles",$roles);
		$this->assign("users",$users);
		$this->assign("names",'普通会员');
		$this->display();
	}

	// 装修师傅列表
	public function zxsf(){
		$where = array("user_type"=>3);
		/**搜索条件**/
		$user_login = I('request.user_login');
		$user_email = trim(I('request.user_email'));
		if($user_login){
			$where['user_login'] = array('like',"%$user_login%");
		}
		
		if($user_email){
			$where['user_email'] = array('like',"%$user_email%");;
		}
		
		$count=$this->users_model->where($where)->count();
		$page = $this->page($count, 20);
        $users = $this->users_model
            ->where($where)
            ->order("create_time DESC")
            ->limit($page->firstRow, $page->listRows)
            ->select();
		$roles_src=$this->role_model->select();
		$roles=array();
		foreach ($roles_src as $r){
			$roleid=$r['id'];
			$roles["$roleid"]=$r;
		}
		$this->assign("page", $page->show('Admin'));
		$this->assign("roles",$roles);
		$this->assign("users",$users);
		$this->assign("names",'装修师傅');
		$this->display("User:index");
	}

	// 装修师傅列表
	public function superadmin(){
		$where = array("user_type"=>1);
		/**搜索条件**/
		$user_login = I('request.user_login');
		$user_email = trim(I('request.user_email'));
		if($user_login){
			$where['user_login'] = array('like',"%$user_login%");
		}
		
		if($user_email){
			$where['user_email'] = array('like',"%$user_email%");;
		}
		
		$count=$this->users_model->where($where)->count();
		$page = $this->page($count, 20);
        $users = $this->users_model
            ->where($where)
            ->order("create_time DESC")
            ->limit($page->firstRow, $page->listRows)
            ->select();
		$roles_src=$this->role_model->select();
		$roles=array();
		foreach ($roles_src as $r){
			$roleid=$r['id'];
			$roles["$roleid"]=$r;
		}
		$this->assign("page", $page->show('Admin'));
		$this->assign("roles",$roles);
		$this->assign("users",$users);
		$this->assign("names",'超级管理员');
		$this->display("User:index");
	}

	// 管理员添加
	public function add(){
		$roles=$this->role_model->where(array('status' => 1))->order("id DESC")->select();
		$this->assign("roles",$roles);
		$this->display();
	}

	// 管理员添加提交
	public function add_post(){
		if(IS_POST){
			if(!empty($_POST['role_id'])){
				$role_ids=$_POST['role_id'];
				unset($_POST['role_id']);
				if ($this->users_model->create()!==false) {
					$this->users_model->user_type=$role_ids;
					$result=$this->users_model->add();
					if ($result!==false) {
						$role_user_model=M("RoleUser");
						if(sp_get_current_admin_id() != 1 && $role_ids == 1){
							$this->error("为了网站的安全，非网站创建者不可创建超级管理员！");
						}
						$role_user_model->add(array("role_id"=>$role_ids,"user_id"=>$result));
						if($role_ids == 1){
							$this->success("添加成功！", U("user/superadmin"));
						}elseif($role_ids ==2){
							$this->success("添加成功！", U("user/index"));
						}else{
							$this->success("添加成功！", U("user/zxsf"));
						}
					} else {
						$this->error("添加失败！");
					}
				} else {
					$this->error($this->users_model->getError());
				}
			}else{
				$this->error("请为此用户指定角色！");
			}

		}
	}

	// 管理员编辑
	public function edit(){
	    $id = I('get.id',0,'intval');
		$roles=$this->role_model->where(array('status' => 1))->order("id DESC")->select();
		$this->assign("roles",$roles);
		$role_user_model=M("RoleUser");
		$role_ids=$role_user_model->where(array("user_id"=>$id))->getField("role_id");
		$this->assign("role_ids",$role_ids);

		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign($user);
		$this->display();
	}

	// 管理员编辑提交
	public function edit_post(){
		if (IS_POST) {
			if(!empty($_POST['role_id'])){
				if(empty($_POST['user_pass'])){
					unset($_POST['user_pass']);
				}
				$role_ids = I('post.role_id');
				unset($_POST['role_id']);
				if ($this->users_model->create()!==false) {
					$this->users_model->user_type=$role_ids;
					$result=$this->users_model->save();
					if ($result!==false) {
						$uid = I('post.id',0,'intval');
						$role_user_model=M("RoleUser");
						$role_user_model->where(array("user_id"=>$uid))->delete();
						if(sp_get_current_admin_id() != 1 && $role_ids == 1){
							$this->error("为了网站的安全，非网站创建者不可创建超级管理员！");
						}
						$role_user_model->add(array("role_id"=>$role_ids,"user_id"=>$uid));
						if($role_ids == 1){
							$this->success("保存成功！", U("user/superadmin"));
						}elseif($role_ids ==2){
							$this->success("保存成功！", U("user/index"));
						}else{
							$this->success("保存成功！", U("user/zxsf"));
						}
					} else {
						$this->error("保存失败！");
					}
				} else {
					$this->error($this->users_model->getError());
				}
			}else{
				$this->error("请为此用户指定角色！");
			}

		}
	}

	// 管理员删除
	public function delete(){
	    $id = I('get.id',0,'intval');
		if($id==1){
			$this->error("最高管理员不能删除！");
		}

		if ($this->users_model->delete($id)!==false) {
			M("RoleUser")->where(array("user_id"=>$id))->delete();
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}

	// 修改个人信息修改
	public function userinfo(){
		$id=sp_get_current_admin_id();
		$this->terms_model = D("Portal/Terms");
		$term_relationship = M('TermRelationships')->where(array("object_id"=>$id,"status"=>1))->getField("term_id",true);
		$this->_getTermTree($term_relationship);
		$terms=$this->terms_model->select();
		
		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign("terms",$terms);
		$this->assign("term",$term_relationship);
		$this->assign($user);
		$this->display();
	}

	// 管理员修改会员信息
	public function adminuserinfo(){
		$id = I('get.id',0,'intval');
		$this->terms_model = D("Portal/Terms");
		$term_relationship = M('TermRelationships')->where(array("object_id"=>$id,"status"=>1))->getField("term_id",true);
		$this->_getTermTree($term_relationship);
		$terms=$this->terms_model->select();
		
		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign("terms",$terms);
		$this->assign("term",$term_relationship);
		$this->assign($user);
		$this->display();
	}

	public function adminuserinfo_post(){
		if (IS_POST) {
			if($_POST['user_type']==3){
				if(empty($_POST['term'])){
					$this->error("请至少选择一个分类！");
				}
				$this->term_relationships_model->where(array("object_id"=>$_POST['id'],"term_id"=>array("not in",implode(",", $_POST['term']))))->delete();
				foreach ($_POST['term'] as $mterm_id){
					$find_term_relationship=$this->term_relationships_model->where(array("object_id"=>$_POST['id'],"term_id"=>$mterm_id))->count();
					if(empty($find_term_relationship)){
						$this->term_relationships_model->add(array("term_id"=>intval($mterm_id),"object_id"=>$_POST['id']));
					}else{
						$this->term_relationships_model->where(array("object_id"=>$_POST['id'],"term_id"=>$mterm_id))->save(array("status"=>1));
					}
				}
			}
			
			$services = implode(",", $_POST['services']);
			$create_result=$this->users_model
			->field("id,user_nicename,sex,birthday,signature,mobile,work_time,work_content,service_area,recommend,zdy_hits")
			->create();

			if(empty($_POST['userlistorder'])){
				$this->users_model->userlistorder=999999;
				}else{
					$this->users_model->userlistorder=$_POST['userlistorder'];
					}
			if ($create_result!==false) {
				$this->users_model->services = $services;
				if ($this->users_model->save()!==false) {
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}
		}
	}

	// 获取文章分类树结构 select 形式
	private function _getTree(){
		$term_id=empty($_REQUEST['term'])?0:intval($_REQUEST['term']);
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
			$r['selected']=$term_id==$r['term_id']?"selected":"";
			$array[] = $r;
		}
		
		$tree->init($array);
		$str="<option value='\$id' \$selected>\$spacer\$name</option>";
		$taxonomys = $tree->get_tree(0, $str);
		$this->assign("taxonomys", $taxonomys);
	}

	// 获取文章分类树结构 
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

	// 管理员个人信息修改提交
	public function userinfo_post(){
		if (IS_POST) {

			if($_POST['user_type']==3){
				if(empty($_POST['term'])){
					$this->error("请至少选择一个分类！");
				}
				$_POST['id']=sp_get_current_admin_id();
				$this->term_relationships_model->where(array("object_id"=>$_POST['id'],"term_id"=>array("not in",implode(",", $_POST['term']))))->delete();
				foreach ($_POST['term'] as $mterm_id){
					$find_term_relationship=$this->term_relationships_model->where(array("object_id"=>$_POST['id'],"term_id"=>$mterm_id))->count();
					if(empty($find_term_relationship)){
						$this->term_relationships_model->add(array("term_id"=>intval($mterm_id),"object_id"=>$_POST['id']));
					}else{
						$this->term_relationships_model->where(array("object_id"=>$_POST['id'],"term_id"=>$mterm_id))->save(array("status"=>1));
					}
				}
			}
			
			$services = implode(",", $_POST['services']);
			$create_result=$this->users_model
			->field("id,user_nicename,sex,birthday,mobile,signature,work_time,work_content,service_area")
			->create();

			if ($create_result!==false) {
				$this->users_model->services = $services;
				if ($this->users_model->save()!==false) {
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}
		}
	}

	// 停用管理员
    public function ban(){
        $id = I('get.id',0,'intval');
    	if (!empty($id)) {
    		$result = $this->users_model->where(array("id"=>$id))->setField('user_status','0');
    		if ($result!==false) {
    			$this->success("会员停用成功！");
    		} else {
    			$this->error('会员停用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }

    // 启用管理员
    public function cancelban(){
    	$id = I('get.id',0,'intval');
    	if (!empty($id)) {
    		$result = $this->users_model->where(array("id"=>$id))->setField('user_status','1');
    		if ($result!==false) {
    			$this->success("会员启用成功！");
    		} else {
    			$this->error('会员启用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }



}