package cn.edu.cuit.entity;

public class Goods {
	Integer goods_id;
	String goods_name;
	double goods_price;
	Integer goods_num;
	String goods_img;
	Integer goods_type;
	
	
	@Override
	public String toString() {
		return "Goods [goods_id=" + goods_id + ", goods_name=" + goods_name + ", goods_price=" + goods_price
				+ ", goods_num=" + goods_num + ", goods_img=" + goods_img + ", goods_type=" + goods_type + "]";
	}
	public Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(double goods_price) {
		this.goods_price = goods_price;
	}
	public Integer getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(Integer goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public Integer getGoods_type() {
		return goods_type;
	}
	public void setGoods_type(Integer goods_type) {
		this.goods_type = goods_type;
	}
	
	
}
