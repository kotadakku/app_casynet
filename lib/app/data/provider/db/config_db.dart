class DBConfig{
  static final String DATABASE_NAME = "casynet.db";

  static final DATABASE_VERSION = 1;

  static final String TABLE_BANNER = 'banner';
  static final String COLUMN_BANNER_ID = 'id';
  static final String COLUMN_BANNER_IMAGE = 'image';

  static final String TABLE_SALE = 'sale';
  static final String COLUMN_SALE_ID = 'id';
  static final String COLUMN_SALE_IMAGE = 'image';
  static final String COLUMB_SALE_TITLE = 'title';

  static final String TABLE_CATEGORY = 'category';
  static final String COLUMN_CATEGORY_ID = 'iddanhmuc';
  static final String COLUMN_CATEGORY_IMAGE = 'anhdanhmuc';
  static final String COLUMN_CATEGORY_TITLE = 'tendanhmuc';

  static final String TABLE_CART = 'cart';
  static final String CART_COLUMN_P_ID = 'p_id';
  static final String CART_COLUMN_P_SKU = 'p_sku';
  static final String CART_COLUMN_P_IMAGE = 'p_image';
  static final String CART_COLUMN_P_NAME = 'p_name';
  static final String CART_COLUMN_S_NAME = 's_name';
  static final String CART_COLUMN_DIS_PRICE = 'discount_price';
  static final String CART_COLUMN_PRICE = 'price';
  static final String CART_COLUMN_QUANTITY = 'quantity';
  static final String CART_COLUMN_CART_ID = 'cartId';

}