import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopverse/core/di/injections.dart';
import 'package:shopverse/core/theme/theme.dart';
import 'package:shopverse/core/util/constants/bloc_observer.dart';
import 'package:shopverse/core/util/constants/routes.dart';
import 'package:shopverse/core/util/cubit/home_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // حجم تصميم Figma
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            theme: ThemesManager.lightTheme,
            darkTheme: ThemesManager.darkTheme,
            themeMode: ThemeMode.system,
            routes: Routes.routes,
            initialRoute: Routes.loginScreen,
            home: child,
          );
        },
        child: const SizedBox(), // ممكن تحطي LoginScreen مباشرة لو تحبي
      ),
    );
  }
}
