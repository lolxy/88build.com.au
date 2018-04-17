<?php
namespace Common\Controller;

use Common\Controller\HomebaseController;

class MemberbaseController extends HomebaseController{
    
	protected $user_model;
	protected $user;
	protected $userid;
	
	function _initialize() {
		parent::_initialize();
		
		$this->check_login();
		$this->check_user();
		if(sp_is_user_login()){
			$this->userid=sp_get_current_userid();
			$this->users_model=D("Common/Users");
			$this->user=$this->users_model->where(array("id"=>$this->userid))->find();
			$this->assign("user_type",$this->user['user_type']);
		}
	}

	function _empty(){

	  header("HTTP/1.0 404 Not Found");

      $this->display(':404');

    }
	
}