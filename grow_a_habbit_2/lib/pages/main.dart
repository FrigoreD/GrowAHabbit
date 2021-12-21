import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/pages/auth_pages/register_page.dart';
import 'package:grow_a_habbit_2/pages/auth_pages/sign_in_page.dart';
import 'package:grow_a_habbit_2/pages/auth_pages/sign_up_page.dart';
import 'package:grow_a_habbit_2/pages/main_pages/friendlist.dart';

import 'package:flutter/services.dart';
import 'package:grow_a_habbit_2/pages/main_pages/wrapper.dart';
import 'package:grow_a_habbit_2/services/auth.dart';
import 'package:provider/provider.dart';

import 'auth_pages/forgot_pasword_page.dart';
import 'main_pages/calendar_page.dart';
import 'main_pages/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(),
          )
        ],
        child: MaterialApp(
          title: 'Grow a Habbit',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const Wrapper(),
            '/register_page': (context) => const RegisterPage(),
            '/register_page/sign_in': (context) => const SignInPage(),
            '/register_page/sign_in/forgot_password_page': (context) =>
                const ForgotPasswordWidget(),
            '/register_page/sign_up': (context) => const SignUpPage(),
            'profile_page': (context) => const Profile(),
            'friendList_page': (context) => const FriendList(),
            'calendar_page': (context) => const CalendarPage(),
          },
        ));
  }
}
