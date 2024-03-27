import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movies_app_route/presentation/home/view/movieDetailsScreen/movieDeatailScreen.dart';
import 'package:movies_app_route/presentation/user_home/view/home_screen.dart';
import 'package:movies_app_route/theme/appTheme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1));
  await Future.delayed(const Duration(seconds: 1));
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(DevicePreview(
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        MovieDeatailScreen.routeName: (context) => MovieDeatailScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
