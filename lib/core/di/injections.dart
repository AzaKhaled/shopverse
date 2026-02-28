// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shopverse/core/network/remote/api_endpoints.dart';
// import 'package:shopverse/core/util/cubit/home_cubit.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // Bloc
//   sl.registerFactory(
//     () => HomeCubit(),
//   );

//   sl.registerLazySingleton(
//     () => Dio(
//       BaseOptions(
//         baseUrl: '$baseUrl$apiVersion',
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//         sendTimeout: const Duration(seconds: 30),
//       ),
//     ),
//   );

//   //! External
//   final sharedPreferences = await SharedPreferences.getInstance();

//   sl.registerLazySingleton(() => sharedPreferences);
// }
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopverse/core/network/remote/api_endpoints.dart';
import 'package:shopverse/core/util/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  sl.registerFactory(
    () => HomeCubit(),
  );

  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton(
    () => sharedPref,
  );

  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    ),
  );
}