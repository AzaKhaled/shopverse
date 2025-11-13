import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopverse/core/network/remote/api_endpoints.dart';
import 'package:shopverse/core/utils/cubit/home_cubit.dart';

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
