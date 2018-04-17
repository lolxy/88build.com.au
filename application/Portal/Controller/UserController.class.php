<?php
namespace Portal\Controller;
use Common\Controller\MemberbaseController;

class UserController extends MemberbaseController {

	// 前台经验列表
	public function experiences(){
		$this->display();
	}
	
	// 前台图集列表
	public function photos(){
		$this->display();
	}
}
