import 'package:flutter/material.dart';
import 'package:shopverse/core/theme/colors.dart';
import 'package:shopverse/core/theme/text_styles.dart';
import 'package:shopverse/core/utils/constants/primary/primary_field.dart';
import 'package:shopverse/core/utils/constants/routes.dart';
import 'package:shopverse/core/utils/constants/spacing.dart';
import 'package:shopverse/core/utils/cubit/home_cubit.dart';
import 'package:shopverse/core/utils/cubit/home_state.dart';
import 'package:shopverse/core/utils/extensions/context_extension.dart';

class LoginFieldsSection extends StatelessWidget {
  const LoginFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryField(
          controller: homeCubit.loginEmailController,
          label: 'Email',
          validator: (value) =>
              value!.isEmpty ? 'Please enter your email' : null,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace20,
        PrimaryField(
          controller: homeCubit.loginPasswordController,
          label: 'Password',
          validator: (value) =>
              value!.isEmpty ? 'Please enter your password' : null,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !homeCubit.passwordVisibility['loginPassword'],
          suffixIcon: IconButton(
            icon: Icon(
              homeCubit.passwordVisibility['loginPassword']
                  ? Icons.visibility
                  : Icons.visibility_off,
              size: 24,
            ),
            color: Colors.grey,
            onPressed: () {
              homeCubit.togglePasswordVisibility = 'loginPassword';
            },
          ),
        ),
        verticalSpace20,
        Row(
          children: [
            Checkbox(
              value: homeCubit.isRememberMe,
              onChanged: (value) {
                homeCubit.isRememberMe = value!;
              },
              checkColor: ColorsManager.whiteColor,
              activeColor: ColorsManager.primaryColor,
            ),
            const Text('Remember me'),
            const Spacer(),
            TextButton(
              // onPressed: () {
              //   context.push<String>(
              //     Routes.resetPasswordRoute,
              //     arguments: homeCubit.signUpEmailController.text,
              //   );
              //   homeCubit.forgotPassword();
              // },
              onPressed: () async {
    final email = homeCubit.loginEmailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email first')),
      );
      return;
    }

     homeCubit.forgotPassword(email: email);

    if (context.mounted && homeCubit.state is ForgotPasswordSuccessState) {
      context.push<String>(
        Routes.resetPasswordRoute,
        arguments: email,
      );
    }
  },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                'Forgot Password',
                style: TextStylesManager.regular14.copyWith(
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
