
import 'package:app_casynet/app/views/screens/account/address/select_region.dart';
import 'package:app_casynet/app/views/screens/home/search_screen.dart';
import 'package:app_casynet/app/views/screens/store/mystore.dart';
import 'package:app_casynet/app/views/screens/store/news.dart';
import 'package:app_casynet/app/views/screens/store/notications_customer.dart';
import 'package:app_casynet/app/views/screens/store/quan_ly_doanh_thu.dart';
import 'package:app_casynet/app/views/screens/store/quan_ly_don_hang.dart';
import 'package:app_casynet/app/views/screens/store/rate_store_page.dart';
import 'package:app_casynet/app/views/screens/store_manager/UI_cacmenuch/UI_dichvusanpham/UI_Dichvusanpham.dart';
import 'package:app_casynet/app/views/screens/store_manager/UI_cacmenuch/UI_dichvusanpham/UI_ThemSPDV.dart';
import 'package:app_casynet/app/views/screens/store_manager/UI_cacmenuch/UI_quanlydonhang/UI_chitietdonhang.dart';
import 'package:app_casynet/app/views/screens/store_manager/UI_cacmenuch/UI_quanlyquatang/UI_Quanlyquatang.dart';
import 'package:app_casynet/app/views/screens/store_manager/UI_cacmenuch/UI_quanlyquatang/UI_Themquatang.dart';
import 'package:app_casynet/app/views/screens/store_manager/UI_cacmenuch/UI_quanlythongbao/UI_Quanlythongbao.dart';
import 'package:app_casynet/app/views/screens/store_manager/UI_cacmenuch/UI_quanlythongbao/UI_Themthongbao.dart';
import 'package:app_casynet/app/views/screens/store_manager/UI_cuahang.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../main.dart';
import '../bindings/account/casycoin_manager_bindings.dart';
import '../bindings/account/edit_address_bindings.dart';
import '../bindings/account/information_address.dart';
import '../bindings/account/new_address_bindings.dart';
import '../bindings/account/order_account_bindings.dart';
import '../bindings/account/wallet_voucher_bindings.dart';
import '../bindings/auth_bindings.dart';
import '../bindings/cart_binding.dart';
import '../bindings/change_password_bindings.dart';
import '../bindings/detail_product_bindings.dart';
import '../bindings/detail_store_bindings.dart';
import '../bindings/filter_product_controller.dart';
import '../bindings/home_bindings.dart';
import '../bindings/products_bindings.dart';
import '../views/screens/account/account_base.dart';
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
import '../views/screens/cart/checkout_page.dart';
import '../views/screens/detail_store/details_store.dart';
import '../views/screens/filter/filter_product.dart';
import '../views/screens/filter/filter_product_2.dart';
import '../views/screens/filter/filter_product_map.dart';
import '../views/screens/product_detail/detail_product.dart';
import '../views/screens/products.dart';
import '../views/screens/store/data_store_page.dart';
import '../views/screens/store/gift_store_page.dart';
import '../views/screens/store/question_answer.dart';
import '../views/screens/store/sanpham_dichvu.dart';
import '../views/screens/store/setting_notications.dart';
import '../views/screens/store_manager/UI_cacmenuch/UI_Bangdieukhien.dart';
import '../views/screens/store_manager/UI_cacmenuch/UI_Thongtincuahang.dart';

part './app_routes.dart';


class AppPages {
  static final routes =[
    GetPage(name: Routes.HOME,
        page: () => Home(),
        bindings: [
          HomeBindings(),
          CartBinding(),
        ]
    ),
    GetPage(
      name: Routes.SEARCH,
      page: ()=> SearchSreen()),
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
    GetPage(name: Routes.CHECKOUT,
      page: ()=>CheckoutPage(),
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
    GetPage(name: Routes.SELECT_REGION,
      page: ()=>SelectRegionPage()
    ),
    GetPage(
      name: Routes.ACCOUNT_BASE,
      page: ()=>AccountBasePage(),
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
    ),
    GetPage(
        name: Routes.MY_STORE_REVENUE,
        page: ()=> QuanLyDoanhThu()
    ),
    GetPage(
      name: Routes.MY_STORE,
      page: ()=> MyStorePage()
    ),
    GetPage(
      name: Routes.MY_STORE_PRODUCT,
      page: ()=>SanPhamDichVu()
    ),
    GetPage(
      name: Routes.MY_STORE_GIFT,
      page: ()=> GiftStorePage(),
    ),
    GetPage(
      name: Routes.MY_STORE_NOTI,
      page: ()=> NotificationCustomer()
    ),
    GetPage(
      name: Routes.MY_STORE_RATE,
      page: ()=>RateStorePage(),
    ),
    GetPage(
      name: Routes.MY_STORE_QA,
      page: ()=> QuestionAnswer()
    ),
    GetPage(
      name: Routes.MY_STORE_SETTINGS,
      page: ()=>SettingNotications()
    ),
    GetPage(
      name:Routes.MY_STORE_DATA,
      page: ()=> DataStorePage(),
    ),
    GetPage(
      name: Routes.MY_STORE_NEWS,
      page: ()=> News(),
    ),
    GetPage(
      name: Routes.STORE_MANAGER,
      page: () => MenuCuahang(),
    ),
    GetPage(
      name: Routes.STORE_MANAGER_CONTROL,
      page: () => BangDieuKhien()
    ),
    GetPage(
      name: Routes.STORE_MANAGER_INFO,
      page: () => ThongTinCuaHang(),
    ),
    GetPage(
      name: Routes.STORE_MANAGER_INFO_ORDER,
      page: () => ChiTietDonHang(),
    ),
    GetPage(
      name: Routes.STORE_MANAGER_ORDERS,
      page: ()=> QuanLyDonHang()
    ),
    GetPage(
      name: Routes.STORE_MANAGER_PRODUCTS,
      page: ()=> DichVuSanPham(),
    ),
    GetPage(
      name: Routes.STORE_MANAGER_ADD_PRODUCT,
      page: () => Themspdv()
    ),
    GetPage(
      name: Routes.STORE_MANAGER_GIFTS,
      page: ()=> QuanLyQuaTang(),
    ),
    GetPage(
      name: Routes.STORE_MANAGER_ADD_GIFT,
      page: ()=> ThemQuaTang(),
    ),
    GetPage(
      name: Routes.STORE_MANAGER_NOTIS,
      page: ()=>QuanLyThongBao()
    ),
    GetPage(
      name: Routes.STORE_MANAGER_ADD_NOTI,
      page: () => ThemThongBao(),
    )
  ];

}