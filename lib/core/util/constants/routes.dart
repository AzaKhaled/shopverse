import 'package:flutter/material.dart';
import 'package:shopverse/features/home/presentation/screen/home_screen.dart';
import 'package:shopverse/features/login/presentation/screen/login_screen.dart';
import 'package:shopverse/features/product_details/presentation/screen/product_details_screen.dart';
import 'package:shopverse/features/sign_up/presentation/screen/sign_up_screen.dart';


class Routes {
  static const String homeScreen = '/homeScreen';
  static const String splashScreen = '/splashScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String productDetailsScreen = '/productDetailsScreen';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String addressesScreen = '/addressesScreen';
  static const String mapScreen = '/mapScreen';
  static const String createAddressScreen = '/createAddressScreen';
  static const String cartScreen = '/cartScreen';
  static const String orderCreatedScreen = '/orderCreatedScreen';
  static const String orderScreen = '/orderScreen';

  static Map<String, WidgetBuilder> get routes => {
    // splashScreen: (context) => const SplashScreen(),
    // onBoardingScreen: (context) => const OnBoardingScreen(),
    homeScreen: (context) => const HomeScreen(),
     productDetailsScreen: (context) => const ProductDetailsScreen(),
    loginScreen: (context) =>  LoginScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    // addressesScreen: (context) => const AddressesScreen(),
    // mapScreen: (context) => const MapScreen(),
    // createAddressScreen: (context) => const CreateAddressScreen(),
    // cartScreen: (context) => const CartScreen(),
    // orderCreatedScreen: (context) => const OderCreatedScreen(),
    // orderScreen: (context) => const OrdersScreen(),
  };
}