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
class SearchController extends HomebaseController {
    
    //搜索结果页面
    public function index() {
		
		$users = M("Users");
		$keyword = I('request.keyword/s','');
		
		if (empty($keyword)) {
			$this -> error("关键词不能为空！请重新输入！");
		}

	$map['signature'] = array('like',"%$keyword%");
    $counts = $users->where($map)->count();// 查询满足要求的总记录数 $map表示查询条件
    $Page = new \Think\Page($counts,25);//  实例化分页类 传入总记录数和每页显示的记录数(25)
    $show = $Page->show();// 分页显示输出
    // 进行分页数据查询
    $list = $users->where($map)->order('id')->limit($Page->firstRow.','.$Page->listRows)->select(); // $Page->firstRow 起始条数 $Page->listRows 获取多少条
		
		$this -> assign("searchresult", $list);
		$this -> assign('counts',$counts);
		$this -> assign('pages',$show);// 赋值分页输出
		$this -> assign("keyword", $keyword);
		$this -> display(":search");
    }
    
}
