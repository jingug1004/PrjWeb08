package org.zerock.domain;

public class SampleProductVO {

	private String name;
	private double price;
	
	public SampleProductVO(String name, double price) {
		super();
		this.name = name;
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public double getPrice() {
		return price;
	}

	@Override
	public String toString() {
		return "SampleProductVO [name=" + name +
				", price=" + price + "]";
	}
}


