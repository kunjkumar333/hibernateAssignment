package com.coforge.training.crudtest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="producttest")
public class Product {

	@Id
	@Column(name="Pro_id")
	private int id;
	
	@Column(name="Pro_name")
	private String pname;
	
	@Column(name="Pro_des")
	private String des;
	@Column(name="Avalibility")
	public String ava;
	@Column(name="Pro_price")
	private int price;
	
	@Column(name="Quantity")
	private int qty;

	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int id, String pname, String des, int price,String ava,int qty) {
		super();
		this.id = id;
		this.pname = pname;
		this.des = des;
		this.price = price;
		this.ava = ava;
		this.qty = qty;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getAva() {
		return ava;
	}

	public void setAva(String ava) {
		this.ava = ava;
	}
	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
}
