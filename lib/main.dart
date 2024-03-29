import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movies_app_route/presentation/Login/view/LoginScreen.dart';
import 'package:movies_app_route/presentation/Regester/view/RegesterScreen.dart';
import 'package:movies_app_route/presentation/home/view/movieDetailsScreen/movieDeatailScreen.dart';
import 'package:movies_app_route/presentation/home/view/movieDetailsScreen/movieDetailsCubit/movieDetailsViewModel.dart';
import 'package:movies_app_route/presentation/user_home/view/home_screen.dart';
import 'package:movies_app_route/presentation/welcomeScreen/view/welcomeScreen.dart';
import 'package:movies_app_route/theme/appTheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1));
  await Future.delayed(const Duration(seconds: 1));
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(BlocProvider(
    create: (context) => MovieDetailsViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routName: (context) => LoginScreen(),
        RegesterScreen.routName: (context) => RegesterScreen(),
        WelcomeScreen.routName: (context) => WelcomeScreen(),
        MovieDeatailScreen.routeName: (context) => MovieDeatailScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
