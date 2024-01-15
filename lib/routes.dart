import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/middleware/my_middleware.dart';
import 'package:ecommerce_app/view/screen/address/address_add_details.dart';
import 'package:ecommerce_app/view/screen/address/address_add_map.dart';
import 'package:ecommerce_app/view/screen/address/address_edit.dart';
import 'package:ecommerce_app/view/screen/address/address_view.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password/check_email.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password/reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/signup.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password/verify_code.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screen/auth/verifycode_signup.dart';
import 'package:ecommerce_app/view/screen/cart.dart';
import 'package:ecommerce_app/view/screen/checkout.dart';
import 'package:ecommerce_app/view/screen/homescreen_parent.dart';
import 'package:ecommerce_app/view/screen/language.dart';
import 'package:ecommerce_app/view/screen/my_favorite.dart';
import 'package:ecommerce_app/view/screen/onboarding.dart';
import 'package:ecommerce_app/view/screen/order_details.dart';
import 'package:ecommerce_app/view/screen/orders.dart';
import 'package:ecommerce_app/view/screen/product_details.dart';
import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
      name: '/', page: () => const Language(), middlewares: [MyMiddleware()]),
  // GetPage(
  //   name: '/',
  //   page: () => const Cart(),
  // ),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.checkEmail, page: () => const CheckEmail()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.home, page: () => const HomeScreenParent()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.settings, page: () => const SettingsPage()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(
      name: AppRoute.addressAddDetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressEdit, page: () => const AddressEdit()),
  GetPage(name: AppRoute.addressAddMap, page: () => const AddressAddMap()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orders, page: () => const Orders()),
  GetPage(name: AppRoute.orderDetails, page: () => const OrderDetails())
];
