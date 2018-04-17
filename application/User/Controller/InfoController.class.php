<?php
namespace User\Controller;

use Common\Controller\HomebaseController;

class InfoController extends HomebaseController {
	
	function _initialize(){
		parent::_initialize();
	}
	
    // 会员中心首页
	public function index() {
		$this->users_model=D("Common/Users");
		$this->comments_model=D("Common/Comments");
		$relationships=M("term_relationships");

		$this->userid=I("get.id",0,'intval');
		$cat_id=$relationships->where(array("object_id"=>$this->userid))->getField("term_id",true);
		$catids=implode(",",$cat_id);
		$tag='ids:'.$catids.';field:term_id,name;';
		$this->term=sp_get_terms($tag);
		
		$this->users=$this->users_model->where(array("id"=>$this->userid))->find();
		$this->user=$this->users_model->where(array("id"=>sp_get_current_userid()))->find();
		$avgs=$this->comments_model->where(array("post_id" => $this->userid))->avg('score');
		$this->users_model->where(array('id'=>$this->userid))->setInc('user_hits');

		$this->assign("avgs",round($avgs,2));
		$this->assign($this->users);
		if(empty($this->users)){
      		$this->display(':404');
		}else{
			$this->display(':info');
		}
    	
    }
}
