import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopverse/core/theme/colors.dart';
import 'package:shopverse/core/theme/text_styles.dart';
import 'package:shopverse/core/util/constants/primary/primary_button.dart';
import 'package:shopverse/core/util/constants/routes.dart';
import 'package:shopverse/core/util/constants/spacing.dart';
import 'package:shopverse/core/util/cubit/home_cubit.dart';
import 'package:shopverse/core/util/cubit/home_states.dart';
import 'package:shopverse/core/util/extensions/context_extension.dart';
import 'package:shopverse/features/login/presentation/widget/login_fields_section.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocConsumer<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          
          current is LoginUserLoadingState ||
          current is LoginUserSuccessState ||
          current is LoginUserErrorState,
      listener: (context, state) {
        if (state is LoginUserSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successful! Welcome.')),
          );
          context.pushReplacement(Routes.homeScreen);
        }

        if (state is LoginUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            // appBar: const PrimaryAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace20,
                      Text('ShopVerse', style: TextStylesManager.bold10),
                      verticalSpace40,
                      const LoginFieldsSection(),
                      verticalSpace20,
                      PrimaryButton(
                        isLoading: state is LoginUserLoadingState,
                        text: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            homeCubit.loginUser();
                          }
                        },
                      ),
                      verticalSpace20,
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withOpacity(0.5),
                              thickness: 1.15,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Or'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withOpacity(0.5),
                              thickness: 1.15,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStylesManager.regular14,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              context.push(Routes.signUpScreen);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStylesManager.regular14.copyWith(
                                color: ColorsManager.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
