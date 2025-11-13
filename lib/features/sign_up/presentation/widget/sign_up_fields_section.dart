import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopverse/core/utils/constants/assets_helper.dart';
import 'package:shopverse/core/utils/constants/primary/primary_field.dart';
import 'package:shopverse/core/utils/constants/spacing.dart';
import 'package:shopverse/core/utils/cubit/home_cubit.dart';
import 'package:shopverse/core/utils/cubit/home_state.dart';

class SignUpFieldsSection extends StatefulWidget {
  const SignUpFieldsSection({super.key});

  @override
  State<SignUpFieldsSection> createState() => _SignUpFieldsSectionState();
}

class _SignUpFieldsSectionState extends State<SignUpFieldsSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeLoadDataSuccessState ||
          current is HomeCountriesSuccessState ||
          current is HomeCountriesErrorState ||
          current is HomeCountriesLoadingState ||
          current is HomeLocationsSuccessState ||
          current is HomeLocationsErrorState ||
          current is HomeLocationsLoadingState,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryField(
              controller: homeCubit.firstNameController,
              label: 'Full Name',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your name' : null,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
            ),
            verticalSpace20,
            PrimaryField(
              controller: homeCubit.lastNameController,
              label: 'last Name',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your name' : null,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
            ),
            verticalSpace20,
            PrimaryField(
              controller: homeCubit.signUpEmailController,
              label: 'Email',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your email' : null,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),

            verticalSpace20,
            PrimaryField(
              controller: homeCubit.signUpPasswordController,
              label: 'Password',
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your password' : null,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              obscureText: !homeCubit.passwordVisibility['signUpPassword'],
              suffixIcon: IconButton(
                icon: Image.asset(
                  homeCubit.passwordVisibility['signUpPassword']
                      ? AssetsHelper.visibility
                      : AssetsHelper.visibilityOff,
                  width: 24,
                  height: 24,
                ),
                color: Colors.grey,
                onPressed: () {
                  homeCubit.togglePasswordVisibility = 'signUpPassword';
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
