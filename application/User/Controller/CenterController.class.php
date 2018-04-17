<?php
namespace User\Controller;

use Common\Controller\MemberbaseController;

class CenterController extends MemberbaseController {
	
	function _initialize(){
		parent::_initialize();
	}
	
    // 会员中心首页
	public function index() {
		$this->assign($this->user);
		$userid=sp_get_current_userid();
		$UserModel = M("Users");
		$username = $UserModel->where("id=$userid")->getField("user_login");
    	if(!empty($userid)){//已经登录
			if(!empty($username)){
				$relationships=M("term_relationships");
				$cat_id=$relationships->where(array("object_id"=>$userid))->getField("term_id",true);
				$catids=implode(",",$cat_id);
				$tag='ids:'.$catids.';field:term_id,name;';
				$this->term=sp_get_terms($tag);
				$this->display(':center');
			}else{
				redirect(U("user/register/perfect"));
			}
    	}else{
			$this->display(":login");
		}
    }
}
