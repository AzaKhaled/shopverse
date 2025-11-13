import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:shopverse/core/theme/colors.dart';
import 'package:shopverse/core/theme/text_styles.dart';
import 'package:shopverse/core/utils/constants/primary/primary_button.dart';
import 'package:shopverse/core/utils/constants/routes.dart';
import 'package:shopverse/core/utils/cubit/home_cubit.dart';
import 'package:shopverse/core/utils/cubit/home_state.dart';
import 'package:shopverse/core/utils/extensions/context_extension.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is VerifyEmailSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                  ),
                );
                context.pushReplacement(Routes.loginRoute);
              } else if (state is VerifyEmailErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state is ResendOtpSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.blue,
                  ),
                );
                context.pushReplacement<Widget>(Routes.loginRoute);
              } else if (state is ResendOtpErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please enter the 6-digit code sent to your email:',
                    style: TextStylesManager.regular16,
                  ),
                  const SizedBox(height: 40),

                  // 🔢 6-digit OTP Field
                  Center(
                    child: Pinput(
                      length: 6,
                      controller: homeCubit.otpController,
                      keyboardType: TextInputType.number,
                      defaultPinTheme: PinTheme(
                        width: 50,
                        height: 56,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsManager.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 50,
                        height: 56,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorsManager.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ✅ Verify Button
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: state is VerifyEmailLoadingState
                  //         ? null
                  //         : () {
                  //             final email = homeCubit.signUpEmailController.text
                  //                 .trim();
                  //             final otp = homeCubit.otpController.text.trim();

                  //             if (email.isEmpty || otp.length != 6) {
                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                 const SnackBar(
                  //                   content: Text('Please enter all 6 digits.'),
                  //                   backgroundColor: Colors.red,
                  //                 ),
                  //               );
                  //               return;
                  //             }

                  //             homeCubit.verifyEmail(email: email, otp: otp);
                  //           },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: ColorsManager.primaryColor,
                  //       padding: const EdgeInsets.symmetric(vertical: 14),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //     ),
                  //     child: state is VerifyEmailLoadingState
                  //         ? const CircularProgressIndicator(color: Colors.white)
                  //         : const Text(
                  //             'Verify Email',
                  //             style: TextStyle(
                  //               fontSize: 16,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //   ),
                  // ),
                  PrimaryButton(
                    label: Text('Verify Email'),
                    onPressed: () {
                      final email = homeCubit.signUpEmailController.text.trim();
                      final otp = homeCubit.otpController.text.trim();

                      if (email.isEmpty || otp.length != 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter all 6 digits.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      homeCubit.verifyEmail(email: email, otp: otp);
                    },
                  ),
                  const SizedBox(height: 16),

                  // 🔁 Resend OTP
                  Center(
                    child: TextButton(
                      onPressed: state is ResendOtpLoadingState
                          ? null
                          : () => homeCubit.resendOtp(
                              email: homeCubit.signUpEmailController.text
                                  .trim(),
                            ),
                      child: state is ResendOtpLoadingState
                          ? const Text('Sending...')
                          : const Text('Resend OTP'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
