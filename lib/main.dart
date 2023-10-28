import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/home_layout/home_layout_view.dart';
import 'package:todo_app/pages/home_view/home_view.dart';
import 'package:todo_app/pages/login/login_view.dart';
import 'package:todo_app/pages/register/register_view.dart';
import 'package:todo_app/pages/setting_view/setting_view.dart';
import 'package:todo_app/pages/splash_view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      initialRoute:SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context) => SplashScreen(),
        HomeLayoutView.routeName:(context) => HomeLayoutView(),
        HomeView.routeName:(context) => const HomeView(),
        LoginView.routeName:(context) =>LoginView(),
        RegisterView.routeName:(context) => RegisterView(),
        SettingView.routeName:(context) => SettingView(),
      },
      builder: EasyLoading.init(  ),
    );
  }
}