import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopverse/core/di/injections.dart';
import 'package:shopverse/core/theme/theme.dart';
import 'package:shopverse/core/utils/constants/my_bloc_observer.dart';
import 'package:shopverse/core/utils/constants/responsive_size.dart';
import 'package:shopverse/core/utils/constants/routes.dart';
import 'package:shopverse/core/utils/cubit/home_cubit.dart';
import 'package:shopverse/core/utils/cubit/home_state.dart';

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
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            theme: ThemesManager.lightTheme,
            darkTheme: ThemesManager.darkTheme,
            themeMode: ThemeMode.system,
            routes: Routes.routes,
            initialRoute: Routes.loginRoute,
            builder: (context, child) {
              ScreenSizes.init(context);
              return child!;
            },
          );
        },
      ),
    );
  }
}
