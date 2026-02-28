import 'package:flutter/material.dart';
import 'package:shopverse/core/util/constants/primary/primary_field.dart';
import 'package:shopverse/core/util/constants/spacing.dart';
import 'package:shopverse/core/util/cubit/home_cubit.dart';

class SignUpFieldsSection extends StatefulWidget {
  const SignUpFieldsSection({super.key});

  @override
  State<SignUpFieldsSection> createState() => _SignUpFieldsSectionState();
}

class _SignUpFieldsSectionState extends State<SignUpFieldsSection> {
 
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // NAME FIELD
        PrimaryField(
          controller: homeCubit.nameController,
          label: 'Name',
          validator: (value) =>
              value!.isEmpty ? 'Please enter your name' : null,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
        ),
        verticalSpace20,

        // PHONE
        PrimaryField(
          controller: homeCubit.phoneController,
          label: 'Phone Number',
          validator: (value) =>
              value!.isEmpty ? 'Please enter your phone number' : null,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
        ),
        verticalSpace20,

        // EMAIL
        PrimaryField(
          controller: homeCubit.emailController,
          label: 'Email',
          validator: (value) =>
              value!.isEmpty ? 'Please enter your email' : null,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace20,

        // PASSWORD
        PrimaryField(
          controller: homeCubit.passwordController,
          label: 'Password',
          validator: (value) =>
              value!.isEmpty ? 'Please enter your password' : null,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !showPassword,
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
        ),
        verticalSpace20,

        // CONFIRM PASSWORD
        PrimaryField(
          controller: homeCubit.passwordConfirmController,
          label: 'Confirm Password',
          validator: (value) {
            if (value!.isEmpty) return 'Please confirm your password';
            if (value != homeCubit.passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !showConfirmPassword,
          suffixIcon: IconButton(
            icon: Icon(
              showConfirmPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                showConfirmPassword = !showConfirmPassword;
              });
            },
          ),
        ),
        verticalSpace20,
      ],
    );
  }
}
