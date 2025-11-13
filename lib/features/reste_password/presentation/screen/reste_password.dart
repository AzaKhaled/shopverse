import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:shopverse/core/theme/colors.dart';
import 'package:shopverse/core/theme/text_styles.dart';
import 'package:shopverse/core/utils/constants/primary/primary_field.dart';
import 'package:shopverse/core/utils/constants/routes.dart';
import 'package:shopverse/core/utils/extensions/context_extension.dart';
import 'package:shopverse/core/utils/cubit/home_cubit.dart';
import 'package:shopverse/core/utils/cubit/home_state.dart';
import 'package:shopverse/reste_password/presentation/widgets/reset_buttom.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // 📨 استلام الإيميل المرسل من صفحة "Forgot Password"
    final email = ModalRoute.of(context)?.settings.arguments as String?;

 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: ColorsManager.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
              context.pushReplacement<Widget>(Routes.loginRoute);
            } else if (state is ResetPasswordErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the 6-digit OTP sent to your email:",
                    style: TextStylesManager.regular16,
                  ),
                  const SizedBox(height: 20),

                  // 🔢 OTP input
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

                  Text("New Password:", style: TextStylesManager.regular16),
                  const SizedBox(height: 8),

                  // TextField(
                  //   controller: newPasswordController,
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     hintText: ,
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  // ),
                  PrimaryField(controller: homeCubit.newPasswordController, label: "Enter new password"),

                  const SizedBox(height: 32),
                 ReseteButton(
  label: 'Reset Password',
  isLoading: state is ResetPasswordLoadingState,
  onPressed: state is ResetPasswordLoadingState
      ? null
      : () {
        

          context.read<HomeCubit>().resetPassword(
                email: email!,
                newPassword: homeCubit.newPasswordController.text,
                otp: homeCubit.otpController.text,
              );
        },
)


                  // ✅ Reset Password Button
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                     
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: ColorsManager.primaryColor,
                  //       padding: const EdgeInsets.symmetric(vertical: 14),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //     ),
                  //     child: state is ResetPasswordLoadingState
                  //         ? const CircularProgressIndicator(color: Colors.white)
                  //         : const Text(
                  //             ,
                  //             style: TextStyle(
                  //               fontSize: 16,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
