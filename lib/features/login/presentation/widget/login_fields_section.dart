import 'package:flutter/material.dart';
import 'package:shopverse/core/theme/colors.dart';
import 'package:shopverse/core/theme/text_styles.dart';
import 'package:shopverse/core/util/constants/primary/primary_field.dart';
import 'package:shopverse/core/util/constants/spacing.dart';
import 'package:shopverse/core/util/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFieldsSection extends StatefulWidget {
  const LoginFieldsSection({super.key});

  @override
  State<LoginFieldsSection> createState() => _LoginFieldsSectionState();
}

class _LoginFieldsSectionState extends State<LoginFieldsSection> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryField(
          controller: homeCubit.emailController,
          label: 'Email',
          validator: (value) =>
              value!.isEmpty ? 'Please enter your email' : null,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace20,
        PrimaryField(
          controller: homeCubit.passwordController,
          label: 'Password',
          validator: (value) =>
              value!.isEmpty ? 'Please enter your password' : null,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !_isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              color: ColorsManager.textColor,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        verticalSpace20,
        Row(
          children: [
            const Text('Remember me'),
            const Spacer(),
            TextButton(
              onPressed: () {
                final email = homeCubit.emailController.text.trim();
                if (email.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your email first')),
                  );
                  return;
                }
                // homeCubit.forgotPassword(email: email);
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
