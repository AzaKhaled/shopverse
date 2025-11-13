import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopverse/core/models/user_model.dart';
import 'package:shopverse/core/network/remote/api_endpoints.dart';
import 'package:shopverse/core/network/remote/dio_helper.dart';
import 'package:shopverse/core/utils/cubit/home_state.dart';
import 'package:shopverse/main.dart';

HomeCubit get homeCubit => HomeCubit.get(navigatorKey.currentContext!);

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final newPasswordController = TextEditingController();
  final otpController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPhoneNumberController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final forgetPasswordEmailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  
  Map<String, dynamic> passwordVisibility = {
    'loginPassword': false,
    'signUpPassword': false,
  };

  set togglePasswordVisibility(String type) {
    passwordVisibility[type] = !passwordVisibility[type]!;
    emit(HomeTogglePasswordVisibilityState());
  }

  bool _isRememberMe = false;

  bool get isRememberMe => _isRememberMe;

  set isRememberMe(bool value) {
    _isRememberMe = value;
    emit(HomeToggleRememberMeState());
  }

  void login() async {
    emit(HomeLoginLoadingState());
    final result = await DioHelper.postData(
      url: loginApi,
      data: {
        'email': loginEmailController.text,
        'password': loginPasswordController.text,
      },
    );
    result.fold(
      (l) {
        debugPrint('❌ Dio Error: $l');
        emit(HomeLoginErrorState(l));
      },
      (r) {
        final data = r.data;
        debugPrint('✅ Login Response: $data');
        final userModel = UserModel.fromJson(data);
        emit(HomeLoginSuccessState(userModel));
      },
    );
  }

  void signUp() async {
    emit(HomeSignupLoadingState());
    final result = await DioHelper.postData(
      url: signUpApi,
      data: {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': signUpEmailController.text,
        'password': signUpPasswordController.text,
      },
    );
    result.fold(
  (l) {
    debugPrint('❌ Dio Error: $l');
    emit(HomeSignupErrorState(l));
  },
  (r) {
    final data = r.data;
    final message = data['message'];
    debugPrint('✅ Signup success: $message');
    
    emit(HomeSignupSuccessState(message));
  },
);

  }

  void verifyEmail({required String email, required String otp}) async {
    emit(VerifyEmailLoadingState());

    final result = await DioHelper.postData(
      url: verifyEmailApi,
      data: {"email": email, "otp": otp},
    );

    result.fold(
      (l) {
        // ❌ في حالة فشل
        debugPrint("❌ Verify Email Error: $l");
        emit(VerifyEmailErrorState(l));
      },
      (r) {
        // ✅ في حالة نجاح
        debugPrint("✅ Verify Email Response: ${r.data}");

        dynamic message;

        if (r.data is Map) {
          final data = r.data;
          if (data['errors'] != null) {
            final errors = data['errors'];
            if (errors['otp'] != null &&
                errors['otp'] is List &&
                errors['otp'].isNotEmpty) {
              message = errors['otp'][0];
            } else {
              message = data['message'];
            }
          } else if (data['message'] != null) {
            message = data['message'];
          } else {
            message = 'Email verified successfully!';
          }
        } else if (r.data is String) {
          message = r.data;
        } else {
          message = 'Email verified successfully!';
        }

        emit(VerifyEmailSuccessState(message));
      },
    );
  }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoadingState());
    debugPrint("🔵 Sending OTP to: $email");

    final result = await DioHelper.postData(
      url: resendOtpApi,
      data: {'email': email},
    );

    result.fold(
      (l) {
        // ❌ فشل
        debugPrint("❌ Resend OTP Error: $l");
        emit(ResendOtpErrorState(l));
      },
      (r) {
        // ✅ نجاح
        debugPrint("✅ Resend OTP Response: ${r.data}");
        final message = r.data['message'] ?? 'OTP sent successfully';
        emit(ResendOtpSuccessState(message));
      },
    );
  }
void validateOtp({required String email, required String otp}) async {
  emit(ValidateOtpLoadingState());

  final result = await DioHelper.postData(
    url: validateOtpApi,
    data: {"email": email, "otp": otp},
  );

  result.fold(
    (l) {
      debugPrint('❌ Dio Error (Validate OTP): $l');
      emit(ValidateOtpErrorState(l.toString()));
    },
    (r) {
      final data = r.data;

      // ✅ تأكدي إن الـ response Map قبل ما تستخدميه
      String message;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        message = data['message'];
      } else {
        message = data.toString(); // في حالة الرد مجرد نص
      }

      debugPrint('✅ Validate OTP Success: $message');
      emit(ValidateOtpSuccessState(message));
    },
  );
}

 void resetPassword({
  required String email,
  required String otp,
  required String newPassword,
}) async {
  emit(ResetPasswordLoadingState());

  final result = await DioHelper.postData(
    url: resetPasswordApi,
    data: {
      "email": email,
      "otp": otp, // ✅ لازم يتبعت
      "newPassword": newPassword, // ✅ الاسم الصحيح من الـ API
    },
  );

  result.fold(
    (l) {
      debugPrint('❌ Dio Error (Reset Password): $l');
      emit(ResetPasswordErrorState(l.toString()));
    },
    (r) {
      final data = r.data;
      final message = (data is Map<String, dynamic> && data.containsKey('message'))
          ? data['message']
          : data.toString();

      debugPrint('✅ Reset Password Success: $message');
      emit(ResetPasswordSuccessState(message));
    },
  );
}

  void forgotPassword({required String email}) async {
  emit(ForgotPasswordLoadingState());
  debugPrint("📨 Sending forgot password request for: $email");

  final result = await DioHelper.postData(
    url: forgotPasswordApi,
    data: {
      'email': email,
    },
  );

  result.fold(
    (l) {
      debugPrint("❌ Forgot Password Error: $l");
      emit(ForgotPasswordErrorState(l));
    },
    (r) {
      final data = r.data;
      final message = (data is Map && data.containsKey('message'))
          ? data['message']
          : data.toString();

      debugPrint('✅ Forgot Password success: $message');
      emit(ForgotPasswordSuccessState(message));
    },
  );
}

}
