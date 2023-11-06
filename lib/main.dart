import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/core/global/theme/theme_data/theme_data_light.dart';
import 'package:todo/cubit/project_cubit.dart';
import 'package:todo/project_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProjectCubit()..createDatabase(),
        ),
      ],
      child: MaterialApp(
        title: 'ToDo',
        theme: getThemeDataLight,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/images/app_logo.png',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          nextScreen: const ProjectScreen(),
          backgroundColor: Colors.black,
          duration: 2000,
          centered: true,
          pageTransitionType: PageTransitionType.bottomToTop,
          splashIconSize: 300,
        ),
      ),
    );
  }
}
