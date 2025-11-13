import 'package:flutter/material.dart';
import 'package:shopverse/features/home/presentation/screen/home_screen.dart';
import 'package:shopverse/features/login/presentation/screen/login_screen.dart';
import 'package:shopverse/features/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:shopverse/features/reste_password/presentation/screen/reste_password.dart';
// import 'package:shopverse/password/presentation/screen/forgetes_password.dart';
import 'package:shopverse/verify_email/presentation/screen/verify_email.dart';

class Routes {
  static const String onBoardingRoute = '/on_boarding';
  static const String loginRoute = '/login';
  static const String signUpRoute = '/sign_up';
  static const String homeRoute = '/home';
  static const String forgetPasswordRoute = '/forget_password';
  static const String verifyEmailRoute = '/verify_email';
  static const String otpRoute = '/otp';
   static const String resetPasswordRoute = '/reset_password';
  static Map<String, WidgetBuilder> get routes => {
    // onBoardingRoute: (context) => const OnBoardingScreen(),
    loginRoute: (context) => LoginScreen(),
    homeRoute: (context) => const HomeScreen(),
    signUpRoute: (context) => SignUpScreen(),
    //  forgetPasswordRoute: (context) => ئ(),
     verifyEmailRoute: (context) => const OtpVerificationView(),
    //  otpRoute: (context) => const OtpVerificationView(),
      resetPasswordRoute: (context) => const ResetPasswordView(),
  };
}
