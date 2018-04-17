<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomebaseController; 
/**
 * 首页
 */
class IndexController extends HomebaseController {
    protected $options_model;
	
	public function _initialize() {
		parent::_initialize();
		$this->options_model = D("Common/Options");
	}
	
    public function index() {
        $options = sp_get_option("all_hits");
        $options["real_hits"]+=1;
        $data['option_name']="all_hits";
		$data['option_value']=json_encode($options);
        $result=$this->options_model->where('option_id = 9')->save($data);
        $newoptions = sp_get_option("all_hits");
        $this->hits_inedx = $newoptions["real_hits"]+$newoptions["add_hits"];
    	$this->display(":index");
    }
}


