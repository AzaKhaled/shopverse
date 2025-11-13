import 'package:flutter/material.dart';
import 'package:shopverse/core/theme/text_styles.dart';
import 'package:shopverse/core/utils/constants/primary/primary_button.dart';
import 'package:shopverse/core/utils/constants/spacing.dart';
import 'package:shopverse/core/utils/cubit/home_cubit.dart';

class LoginAuthButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginAuthButtons({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          padding: 0,
          label: Text('Login', style: TextStylesManager.bold16),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              homeCubit.login();
            }
          },
        ),
        verticalSpace10,
        // PrimaryButton(
        //   padding: 0,
        //   withBorder: true,
        //   color: ColorsManager.secondaryColor,
        //   textColor: ColorsManager.textColor,
        //   onPressed: () {
        //     context.push<Widget>(Routes.signUpRoute);
        //   },
        //   label: Text('Sign Up', style: TextStylesManager.bold16),
        // ),
      ],
    );
  }
}
