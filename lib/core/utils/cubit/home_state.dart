import 'package:shopverse/core/models/country_model.dart';
import 'package:shopverse/core/models/location_model.dart';
import 'package:shopverse/core/models/user_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeTogglePasswordVisibilityState extends HomeState {}

class HomeToggleRememberMeState extends HomeState {}

class HomeLoginLoadingState extends HomeState {}

class HomeLoginSuccessState extends HomeState {
  final UserModel userModel;

  HomeLoginSuccessState(this.userModel);
}

class HomeLoginErrorState extends HomeState {
  final String error;

  HomeLoginErrorState(this.error);
}

class HomeSignupLoadingState extends HomeState {}

class HomeSignupSuccessState extends HomeState {
  final String message;
  HomeSignupSuccessState(this.message);
}

class HomeSignupErrorState extends HomeState {
  final String error;

  HomeSignupErrorState(this.error);
}

class HomeCountriesLoadingState extends HomeState {}

class HomeCountriesSuccessState extends HomeState {
  final List<CountryModel> countries;

  HomeCountriesSuccessState(this.countries);
}

class HomeCountriesErrorState extends HomeState {
  final String error;

  HomeCountriesErrorState(this.error);
}

/// Locations
class HomeLocationsLoadingState extends HomeState {}

class HomeLocationsSuccessState extends HomeState {
  final List<LocationModel> locations;

  HomeLocationsSuccessState(this.locations);
}

class HomeLocationsErrorState extends HomeState {
  final String error;

  HomeLocationsErrorState(this.error);
}

class HomeLoadDataSuccessState extends HomeState {}

class HomeOtpAddedState extends HomeState {}

class HomeOtpRemovedState extends HomeState {}

class HomeOtpClearedState extends HomeState {}
// OTP Verify
class VerifyEmailLoadingState extends HomeState {}
class VerifyEmailSuccessState extends HomeState {
  final String message;
  VerifyEmailSuccessState(this.message);
}
class VerifyEmailErrorState extends HomeState {
  final String error;
  VerifyEmailErrorState(this.error);
}

// Resend OTP
class ResendOtpLoadingState extends HomeState {}
class ResendOtpSuccessState extends HomeState {
  final String message;
  ResendOtpSuccessState(this.message);
}
class ResendOtpErrorState extends HomeState {
  final String error;
  ResendOtpErrorState(this.error);
}

// Validate OTP (before reset password)
class ValidateOtpLoadingState extends HomeState {}
class ValidateOtpSuccessState extends HomeState {
  final String message;
  ValidateOtpSuccessState(this.message);
}
class ValidateOtpErrorState extends HomeState {
  final String error;
  ValidateOtpErrorState(this.error);
}

// Reset Password
class ResetPasswordLoadingState extends HomeState {}
class ResetPasswordSuccessState extends HomeState {
  final String message;
  ResetPasswordSuccessState(this.message);
}
class ResetPasswordErrorState extends HomeState {
  final String error;
  ResetPasswordErrorState(this.error);
}
// 🔹 Forgot Password States
class ForgotPasswordLoadingState extends HomeState {}

class ForgotPasswordSuccessState extends HomeState {
  final String message;
  ForgotPasswordSuccessState(this.message);
}

class ForgotPasswordErrorState extends HomeState {
  final String error;
  ForgotPasswordErrorState(this.error);
}
