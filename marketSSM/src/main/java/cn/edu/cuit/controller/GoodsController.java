package cn.edu.cuit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.cuit.dao.GoodsDao;
import cn.edu.cuit.service.GoodsService;
import cn.edu.cuit.entity.*;



@Controller // 控制器
@RequestMapping("/goods")
public class GoodsController {
	@Resource
	private GoodsService goodsService;

	@Resource
	private GoodsDao goodsDao;
	
	@RequestMapping("/toGoodsList")
	public ModelAndView toLogin(HttpServletRequest request, ModelAndView mv) {
		List<Goods> goodsList = new ArrayList<Goods>();
		goodsList = goodsService.findAllGoods();
		HttpSession session = request.getSession();
		session.setAttribute("goodsList", goodsList);
		
		mv.setViewName("goodsList");
		return mv;
	}
}
