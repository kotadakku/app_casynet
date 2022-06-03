
import 'package:app_casynet/app/data/model/product.dart';
import 'package:app_casynet/app/data/model/seller.dart';

class ProductCart {
  // API thiếu tên cửa hàng
  /*String? */
  int? p_id;
  int? item_id;
  String? p_sku;
  String? p_image;
  String? p_name;
  String? s_name;
  int? discount_price;
  int? price;
  int? quantity;
  int? cartId;

  Product? product;
  Seller? seller;


  ProductCart({this.p_id,this.item_id, this.p_sku,
    this.p_image, this.p_name, this.s_name,
    this.discount_price, this.price, this.quantity,
    this.cartId
  });

  ProductCart.fromJson(Map<String, dynamic> json) {
    item_id = json['item_id'];
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
  ProductCart.fromJson1(Map<String, dynamic> json) {
    item_id = json['item_id'];
    quantity = json['qty'];
    cartId = int.parse(json['quote_id']);
    quantity = json['qty'];
    product = Product(
      sku: json['sku'],
      thumbnail: json[''],
      name: json['name'],
      price: json['price'],
      officialPrice: json[''],
    );
    seller = Seller(
      name: json[''],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p_id'] = this.p_id;
    data['item_id'] = this.item_id;
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
        "product_option": {
          "extension_attributes": {
            "custom_options": [
              {
                "option_id": "336",
                "option_value": "2022-05-29 05:00:00"
              }
            ]
          }
        }
      },

    };
  }

}
