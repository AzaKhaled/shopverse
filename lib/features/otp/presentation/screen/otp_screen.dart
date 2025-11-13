import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopverse/core/utils/cubit/home_cubit.dart';
import 'package:shopverse/core/utils/cubit/home_state.dart';
import 'package:shopverse/core/utils/constants/routes.dart';
import 'package:shopverse/core/theme/colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is VerifyEmailSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message), backgroundColor: Colors.green),
              );
              // ✅ الانتقال لصفحة إعادة التعيين
              Navigator.pushReplacementNamed(context, Routes.resetPasswordRoute);
            } else if (state is VerifyEmailErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error), backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  controller: cubit.otpController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter OTP",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: state is VerifyEmailLoadingState
                      ? null
                      : () {
                          cubit.verifyEmail(
                            email: cubit.signUpEmailController.text,
                            otp: cubit.otpController.text,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.primaryColor,
                  ),
                  child: state is VerifyEmailLoadingState
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Verify"),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: state is ResendOtpLoadingState
                      ? null
                      : () => cubit.resendOtp(
                            email: cubit.signUpEmailController.text,
                          ),
                  child: state is ResendOtpLoadingState
                      ? const Text("Sending...")
                      : const Text("Resend OTP"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
