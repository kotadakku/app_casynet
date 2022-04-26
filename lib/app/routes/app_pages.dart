
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sqflite/sqflite.dart';
import '../../main.dart';
import '../bindings/account/account_page_bindings.dart';
import '../bindings/account/casycoin_manager_bindings.dart';
import '../bindings/account/edit_address_bindings.dart';
import '../bindings/account/information_address.dart';
import '../bindings/account/new_address_bindings.dart';
import '../bindings/account/order_account_bindings.dart';
import '../bindings/account/wallet_voucher_bindings.dart';
import '../bindings/auth_bindings.dart';
import '../bindings/change_password_bindings.dart';
import '../bindings/detail_product_bindings.dart';
import '../bindings/detail_store_bindings.dart';
import '../bindings/filter_product_controller.dart';
import '../bindings/home_bindings.dart';
import '../bindings/products_bindings.dart';
import '../views/screens/account/account_base.dart';
import '../views/screens/account/account_login.dart';
import '../views/screens/account/address/edit_address.dart';
import '../views/screens/account/address/information_address.dart';
import '../views/screens/account/address/new_address.dart';
import '../views/screens/account/casycoin_manager.dart';
import '../views/screens/account/change_password.dart';
import '../views/screens/account/detail_account.dart';
import '../views/screens/account/favourite_product.dart';
import '../views/screens/account/follow_store.dart';
import '../views/screens/account/message/all_message.dart';
import '../views/screens/account/order/order_account.dart';
import '../views/screens/account/seen_product.dart';
import '../views/screens/account/wallet_voucher.dart';
import '../views/screens/auth/auth.dart';
import '../views/screens/detail_product.dart';
import '../views/screens/details_store.dart';
import '../views/screens/filter/filter_product.dart';
import '../views/screens/filter/filter_product_2.dart';
import '../views/screens/filter/filter_product_map.dart';
import '../views/screens/products.dart';

part './app_routes.dart';


class AppPages {
  static final routes =[
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
    GetPage(
      name: Routes.AUTH,
      page: ()=> AuthPage(),
      binding: AuthBindings(),
    ),
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
    GetPage(name: Routes.ACCOUNT_ADDRESS, page: ()=> InformationAddress(),
      binding: InformationAddressBindings()
    ),
    GetPage(
      name: Routes.ACCOUNT_ADDRESS_NEW,
      page: ()=> NewAddress(),
      binding: NewAddressBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_ADDRESS_EDIT,
      page: ()=> EditAddress(),
      binding: EditAddressBindings(),
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
      name: Routes.ACCOUNT_BASE,
      page: ()=>AccountBasePage(),
      binding: AccountPageBindings(),
    ),
    GetPage(
      name: Routes.ACCOUNT_BASE,
      page: ()=>AccountLoginPage(),
      binding: AccountPageBindings(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => DetailProductPage(),
      binding: DetailProductBindings(),
      curve: Curves.easeOut,
      transitionDuration: Duration(milliseconds: 500)

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
      name: Routes.MESSAGES,
      page: ()=> AllMessageAccount(),
    )
  ];

}