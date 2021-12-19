import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/data/database.dart';
import 'package:grow_a_habbit_2/pages/main_page.dart';
import 'package:grow_a_habbit_2/pages/profile.dart';
import 'package:grow_a_habbit_2/pages/sign_in_page.dart';
import 'package:grow_a_habbit_2/pages/sign_up_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'example_page.dart';
import 'register_page.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    title: 'Grow a Habbit',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const RegisterPage(),
      '/sign_in': (context) => const SignInPage(),
      '/sign_up': (context) => const SignUpPage(),
      'main_page': (context) => const MainPage(),
      'profile_page': (context) => const Profile(),
      'example_page': (BuildContext fisrtContext) => const ExampleWidget(),
    },
    initialRoute: '/',
  ));
}
