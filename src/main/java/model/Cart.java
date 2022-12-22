package model;

public class Cart {
	private String cartId;
	private String productId;
	private int quantity;
	private String customerId;
	private String productName;
	private String productImage;
	private int price;

	public Cart() {
		super();
	}
	
	public Cart(String cartId, String productId, int price, int quantity, String customerId) {
		super();
		this.cartId = cartId;
		this.productId = productId;
		this.price = price;
		this.quantity = quantity;
		this.customerId = customerId;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
}