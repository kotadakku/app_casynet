
class ProductCart {
  // API thiếu tên cửa hàng
  /*String? */
  int? p_id;
  String? p_sku;
  String? p_image;
  String? p_name;
  String? s_name;
  int? discount_price;
  int? price;
  int? quantity;
  int? cartId;

  ProductCart({this.p_id, this.p_sku,
    this.p_image, this.p_name, this.s_name,
    this.discount_price, this.price, this.quantity,
    this.cartId
  });

  ProductCart.fromJson(Map<String, dynamic> json) {
    p_id = json['item_id'];
    p_sku = json['sku'];
    p_image = json[''];
    p_name = json['name'];
    s_name = json[''];
    price = json['price'];
    discount_price = json[''];
    quantity = json['qty'];
    cartId = int.parse(json['quote_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p_id'] = this.p_id;
    data['p_sku'] = this.p_sku;
    data['p_name'] = this.p_name;
    data['p_image'] = this.p_image;
    data['s_name'] = this.s_name;
    data['discount_price'] = this.discount_price;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['cartId'] = this.cartId;
    return data;
  }
  Map<String, dynamic> toJsonPost(int qty) {
    return {
      "cartItem": {
        "sku": this.p_sku,
        "qty": qty,
        "quote_id": this.cartId,
      }
    };
  }

}
