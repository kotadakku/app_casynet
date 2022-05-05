
class ItemProductInCart {
  // API thiếu tên cửa hàng
  String? _image;// ảnh sản phẩm => API thiếu
  int? _itemId;// id sản phẩm
  String? _sku;
  int? _qty;
  String? _name;// tên sản phẩm
  int? _discount; // giá ưu đãi
  int? _oldPrice;// giá cũ => API thiếu
  String? _productType;// phân loại hàng
  String? _quoteId;

  ItemProductInCart(
      {String? image,
        int? itemId,
        String? sku,
        int? qty,
        String? name,
        int? price,// giá ưu đãi
        int? oldPrice,
        String? productType,
        String? quoteId}) {
    if (image != null){
      _image = image;
    }
    if (itemId != null) {
      _itemId = itemId;
    }
    if (sku != null) {
      _sku = sku;
    }
    if (qty != null) {
      _qty = qty;
    }
    if (name != null) {
      _name = name;
    }
    if (price != null) {
      _discount = price;
    }
    if (oldPrice != null) {
      _oldPrice = oldPrice;
    }
    if (productType != null) {
      _productType = productType;
    }
    if (quoteId != null) {
      this._quoteId = quoteId;
    }
  }


  String? get image => _image;
  set image(String? image) => _image = image;
  int? get itemId => _itemId;
  set itemId(int? itemId) => _itemId = itemId;
  String? get sku => _sku;
  set sku(String? sku) => _sku = sku;
  int? get qty => _qty;
  set qty(int? qty) => _qty = qty;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get price => _discount;
  set price(int? price) => _discount = price;
  int? get oldPrice => _oldPrice;
  set oldPrice(int? oldPrice) => _oldPrice = oldPrice;
  String? get productType => _productType;
  set productType(String? productType) => _productType = productType;
  String? get quoteId => _quoteId;
  set quoteId(String? quoteId) => _quoteId = quoteId;

  ItemProductInCart.fromJson(Map<String, dynamic> json) {
    _image = json[''];
    _itemId = json['item_id'];
    _sku = json['sku'];
    _qty = json['qty'];
    _name = json['name'];
    _discount = json['price'];// giá ưu đãi
    _oldPrice = json[''];// giá cũ
    _productType = json['product_type'];
    _quoteId = json['quote_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this._itemId;
    data['sku'] = this._sku;
    data['qty'] = this._qty;
    data['name'] = this._name;
    data['price'] = this._discount;// giá ưu đãi

    data['product_type'] = this._productType;
    data['quote_id'] = this._quoteId;
    return data;
  }
}
