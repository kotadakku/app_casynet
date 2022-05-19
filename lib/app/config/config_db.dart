class DBConfig{
  static final String DATABASE_NAME = "casynet.db";

  static final DATABASE_VERSION = 1;

  static final String TABLE_BANNER = 'banner';
  static final String BANNER_COLUMN_ID = 'id';
  static final String BANNER_COLUMN_IMAGE = 'image';

  static final String TABLE_SALE = 'sale';
  static final String SALE_COLUMN_ID = 'id';
  static final String SALE_COLUMN_IMAGE = 'image';
  static final String SALE_COLUMN_TITLE = 'title';

  static final String TABLE_CATEGORY = 'category';
  static final String CATEGORY_COLUMN_ID = 'id';
  static final String CATEGORY_COLUMN_IMAGE = 'imageUrl';
  static final String CATEGORY_COLUMN_TITLE = 'name';

  static final String TABLE_CART = 'cart';
  static final String CART_COLUMN_ITEM_ID = 'item_id';
  static final String CART_COLUMN_P_ID = 'p_id';
  static final String CART_COLUMN_P_SKU = 'p_sku';
  static final String CART_COLUMN_P_IMAGE = 'p_image';
  static final String CART_COLUMN_P_NAME = 'p_name';
  static final String CART_COLUMN_S_NAME = 's_name';
  static final String CART_COLUMN_DIS_PRICE = 'discount_price';
  static final String CART_COLUMN_PRICE = 'price';
  static final String CART_COLUMN_QUANTITY = 'quantity';
  static final String CART_COLUMN_CART_ID = 'cartId';

  static final String TABLE_NOTIFICATION = 'notification';
  static final String NOTI_COLUMN_ID = 'id';
  static final String NOTI_COLUMN_TITLE = 'title';
  static final String NOTI_COLUMN_BODY = 'body';
  static final String NOTI_COLUMN_IMAGE_URL = 'imageurl';
  static final String NOTI_COLUMN_ISSEEN = 'isseen';
  static final String NOTI_COLUMN_TIMERECEIVE = 'timereceive';
}