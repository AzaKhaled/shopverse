// import 'package:flutter/material.dart';
// import 'package:shopverse/core/theme/text_styles.dart';
// import 'package:shopverse/core/util/constants/primary/primary_button.dart';
// import 'package:shopverse/core/util/cubit/home_cubit.dart';
// import 'package:shopverse/core/util/cubit/home_states.dart';

// class LoginAuthButtons extends StatelessWidget {
//   final GlobalKey<FormState> formKey;

//   const LoginAuthButtons({super.key, required this.formKey});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         PrimaryButton(
//           isLoading: state is LoginUserLoadingState,
//           text: 'Login',
//           onPressed: () {
//             if (formKey.currentState!.validate()) {
//               homeCubit.loginUser();
//             }
//           },
//         ),
        
  
//       ],
//     );
//   }
// }
