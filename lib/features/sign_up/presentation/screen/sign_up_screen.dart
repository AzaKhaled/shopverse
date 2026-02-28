import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopverse/core/theme/colors.dart';
import 'package:shopverse/core/util/constants/primary/primary_button.dart';
import 'package:shopverse/core/util/constants/routes.dart';
import 'package:shopverse/core/util/constants/spacing.dart';
import 'package:shopverse/core/util/cubit/home_cubit.dart';
import 'package:shopverse/core/util/cubit/home_states.dart';
import 'package:shopverse/core/util/extensions/context_extension.dart';
import 'package:shopverse/features/sign_up/presentation/widget/sign_up_fields_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return Scaffold(
      
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeStates>(
          listenWhen: (previous, current) =>
              current is RegisterSuccessState || current is RegisterErrorState,
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Account Created Successfully! 🎉"),
                ),
              );

            context.pushReplacement(Routes.homeScreen);

            }

            if (state is RegisterErrorState) {
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
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    verticalSpace10,

                    const Text(
                      "Create your new account to start shopping!",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),

                    verticalSpace30,

                    const SignUpFieldsSection(),

                    verticalSpace30,

                    PrimaryButton(
                      text: "Sign Up",
                      isLoading: state is RegisterLoadingState,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          homeCubit.registerUser();
                        }
                      },
                    ),

                    verticalSpace20,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:  Text(
                            "Login",
                            
                            style: TextStyle(fontWeight: FontWeight.bold ,  color: ColorsManager.primaryColor,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 