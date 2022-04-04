import 'package:app_casynet/bindings/account/order_account_bindings.dart';
import 'package:app_casynet/bindings/change_password_bindings.dart';
import 'package:app_casynet/bindings/detail_app_bindings.dart';
import 'package:app_casynet/bindings/products_bindings.dart';
import 'package:app_casynet/screens/account/change_password.dart';
import 'package:app_casynet/screens/account/detail_account.dart';
import 'package:app_casynet/screens/account/casycoin_manager.dart';
import 'package:app_casynet/screens/account/favourite_product.dart';
import 'package:app_casynet/screens/account/wallet_voucher.dart';
import 'package:app_casynet/screens/auth/auth.dart';
import 'package:app_casynet/screens/filter/filter_product_map.dart';
import 'package:app_casynet/screens/notfications.dart';
import 'package:app_casynet/widget/home/store_widget.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Cart/cart.dart';
import '../bindings/account/casycoin_manager_bindings.dart';
import '../bindings/account/wallet_voucher_bindings.dart';
import '../bindings/detail_product_bindings.dart';
import '../bindings/detail_store_bindings.dart';
import '../bindings/filter_product_controller.dart';
import '../bindings/home_bindings.dart';
import '../main.dart';
import '../screens/account/account_base.dart';
import '../screens/account/account_login.dart';
import '../screens/account/follow_store.dart';
import '../screens/account/message/all_message.dart';
import '../screens/account/order/order_account.dart';
import '../screens/account/seen_product.dart';
import '../screens/products.dart';
import '../screens/detail_product.dart';
import '../screens/detail_app.dart';
import '../screens/details_store.dart';
import '../screens/filter/filter_product.dart';
import '../screens/filter/filter_product_2.dart';
import '../screens/home.dart';

part './app_routes.dart';


class AppPages {
  static final routes = [
    GetPage(name: Routes.HOME,
        page: () => Home(),
        binding: HomeBindings()
    ),
    GetPage(
      name: Routes.FILTER,
      page:() => FilterProductPage2(),
      binding: FilterProductBindings(),
    ),
    GetPage(
      name: Routes.FILTER_MAP,
      page:()=> FilterProductMap()
    ),
    GetPage(name: Routes.NOTIFICATIONS, page: ()=>NotificationPage()),
    GetPage(name: Routes.AUTH, page: ()=> AuthPage()),
    GetPage(name: Routes.ACCOUNT_DETAIL, page: ()=> AccountDetailPage()),
    GetPage(name: Routes.ACCOUNT_ORDER,
      page: ()=>OrderAccountPage(),
      binding: OrderAccountBindings(),
    ),
    GetPage(name: Routes.ACCOUNT_WALLET_VOUCHER,
      page:()=> WalletVoucherPage(),
      binding: WalletVoucherBindings(),
    ),
    GetPage(
      name: Routes.ACCOUNT_CASYCOIN,
      page: ()=> CasycoinManagerPage(),
      binding: CasycoinManagerBindings(),
    ),
    GetPage(name: Routes.PRODUCTS_FAVOURITE, page: ()=>FavouriteProductPage()),
    GetPage(name: Routes.STORE_FOLLOWED, page: ()=> FollowedStorePage()),
    GetPage(
      name: Routes.FILTER_PRODUCT,
      page:() => FilterProductPage(),
      binding: FilterProductBindings(),
    ),
    GetPage(
      name: Routes.ACCOUNT_CHANGE_PASS,
      page:()=> ChangePasswordAccount(),
      binding: ChangePasswordBindings()
    ),
    GetPage(
      name: Routes.PRODUCTS_BY_CATEGORY,
      page:()=> ProductsPage(),
      binding:ProductsBindings(),
    ),
    GetPage(
      name: Routes.ACCOUNT_LOGIN,
      page: ()=>AccountLoginPage(),
    ),
    GetPage(
      name: Routes.ACCOUNT_BASE,
      page: ()=>AccountBasePage(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => DetailProductPage(),
      binding: DetailProductBindings(),
    ),
    GetPage(
      name: Routes.PRODUCTS_SEEN,
      page: () => SeenProductPage(),
    ),
    GetPage(
      name: Routes.STORE_DETAIL,
      page: () => DetailsStorePage(),
      binding: DetailStoreBindings(),
    ),
    GetPage(
      name: Routes.INFORMATION_APP,
      page: ()=> DetailAppPage(),
      binding: DetailAppBindings(),

    ),
    GetPage(
      name: Routes.CART,
      page: ()=> Cart()
    ),
    GetPage(
      name: Routes.MESSAGES,
      page: ()=> AllMessageAccount(),
    )
  ];

}