package cn.edu.cuit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.cuit.dao.*;
import cn.edu.cuit.entity.*;
import cn.edu.cuit.service.*;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	@Resource
	private GoodsDao goodsDao;

	@Override
	public List<Goods> findAllGoods() {
		
		return goodsDao.finAllGoods();
	}
	

}
