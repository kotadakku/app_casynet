part of './app_pages.dart';

abstract class Routes{

  static const HOME = '/home';
  static const FILTER = '/filter';
  static const FILTER_MAP = '/filter/map';
  static const FILTER_PRODUCT = '/filter/product';
  static const ACCOUNT_BASE = '/account/base';
  static const ACCOUNT_DETAIL = '/account/detail';
  static const ACCOUNT_ORDER = '/account/order';
  static const ACCOUNT_ADDRESS = '/account/address';
  static const ACCOUNT_ADDRESS_NEW = '/account/address/new';
  static const ACCOUNT_ADDRESS_EDIT = '/account/address/edit';
  static const PRODUCTS_SEEN = '/products/seen';
  static const PRODUCTS_FAVOURITE = '/products/favourite';
  static const STORE_FOLLOWED = '/stores/followed';
  static const ACCOUNT_WALLET_VOUCHER = '/account/wallet_voucher';
  static const ACCOUNT_CASYCOIN = '/account/casycoin';
  static const ACCOUNT_CHANGE_PASS = '/account/change_password';
  static const ACCOUNT_EDIT_INFO = '/account/edit_info';
  static const SELECT_REGION = '/select_region';
  static const CHECKOUT = '/checkout';
  static const CHECKOUT_SUCCESS = '/checkout/success';
  static const PRODUCT_DETAIL= '/product';
  static const PRODUCTS_BY_CATEGORY = '/products';


  static const STORE_HOME_MORE= '/storemore';

  static const CONTACT = '/contact';

  static const STORE_DETAIL = '/store';
  static const MESSAGES = '/messages';
  static const AUTH = '/auth';
  static String ACCOUNT_ENTER_EMAIL_RESET = '/forget_password';

  static const SEARCH = '/search';

  static const MY_STORE = '/my_store';
  static const MY_STORE_CREATE = '/my_store/create';
  static const MY_STORE_PRODUCT = '/my_store/product';
  static const MY_STORE_REVENUE= '/my_store/revenue';
  static const MY_STORE_GIFT = '/my_store/gift';
  static const MY_STORE_NOTI = '/my_store/noti';
  static const MY_STORE_RATE = '/my_store/rate';
  static const MY_STORE_QA = '/my_store/qa';
  static const MY_STORE_SETTINGS = '/my_store/settings';
  static const MY_STORE_DATA = '/my_store/data';
  static const MY_STORE_NEWS = '/my_store/news';
  static const MY_STORE_CATEGORY = '/my_store/category';
  static const MY_STORE_MAINCATEGORY = 'my_store/maincategory';
  static const MY_STORE_TYPEPRODUCT = 'my_store/typeproduct';
  // static const MY_STORE_CATEGORY = '';


  static const STORE_MANAGER = '/manager_store';
  static const STORE_MANAGER_CONTROL = '/manager_store/control';
  static const STORE_MANAGER_INFO =  '/manager_store/info';
  static const STORE_MANAGER_INFO_ORDER = '/manager_store/info_order';
  static const STORE_MANAGER_ORDERS = '/manager_store/orders';
  static const STORE_MANAGER_PRODUCTS = '/manager_store/products';
  static const STORE_MANAGER_ADD_PRODUCT = '/manager_store/add_product';
  static const STORE_MANAGER_SELECT_ORIGIN = '/manager_store/select_origin';
  static const STORE_MANAGER_SELECT_CATEGORY = '/manager_store/category';
  static const STORE_MANAGER_GIFTS = '/manager_store/gifts';
  static const STORE_MANAGER_ADD_GIFT = '/manager_store/add_gift';
  static const STORE_MANAGER_NOTIS = '/manager_store/notis';
  static const STORE_MANAGER_ADD_NOTI = '/manager_store/add_noti';

  static const STORE_MANAGER_NEWS = '/manager_store/news';
  static const STORE_MANAGER_ADD_NEW = '/manager_store/add_news';


}