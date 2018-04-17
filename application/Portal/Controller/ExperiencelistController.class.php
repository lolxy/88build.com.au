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

class ExperiencelistController extends HomebaseController {

	// 前台文章列表
	public function index(){
		$term_id=intval($_GET['cid']);
		$term_id = empty($term_id)?0:$term_id;
		$termname = sp_get_term($term_id);
		$this->name = empty($termname['name'])?"全部经验":$termname['name'];
		if(sp_is_mobile()){
			$term=sp_get_child_terms($term_id);
			}else{
				$term=sp_get_child_terms(0);
				}
		/*if(empty($term)){
		    header('HTTP/1.1 404 Not Found');
		    header('Status:404 Not Found');
		    if(sp_template_file_exists(MODULE_NAME."/404")){
		        $this->display(":404");
		    }
		    return;
		}*/

    	$this->assign('term',$term);
		$this->assign('cat_id', $term_id);
    	$this->display(":list");
	}
	// 前台文章列表
	/*public function index() {
	    $user_id=I('get.id',0,'intval');
		$users_model= M("Users");
    	$username=$users_model->where(array('id'=>$user_id))->getField('user_nicename');
		$userlogin=$users_model->where(array('id'=>$user_id))->getField('user_login');
		$username=empty($username)?$userlogin:$username;
		
		if(empty($userlogin)){
		    header('HTTP/1.1 404 Not Found');
		    header('Status:404 Not Found');
		    if(sp_template_file_exists(MODULE_NAME."/404")){
		        $this->display(":404");
		    }
		    return;
		}

    	$this->assign('user_id', $user_id);
		$this->assign('name', $username);
    	$this->display(":list");
	}*/
	
	// 文章分类列表接口,返回文章分类列表,用于后台导航编辑添加
	public function nav_index(){
		$navcatname="文章分类";
        $term_obj= M("Terms");

        $where=array();
        $where['status'] = array('eq',1);
        $terms=$term_obj->field('term_id,name,parent')->where($where)->order('term_id')->select();
		$datas=$terms;
		$navrule = array(
		    "id"=>'term_id',
            "action" => "Portal/List/index",
            "param" => array(
                "id" => "term_id"
            ),
            "label" => "name",
		    "parentid"=>'parent'
        );
		return sp_get_nav4admin($navcatname,$datas,$navrule) ;
	}
}
