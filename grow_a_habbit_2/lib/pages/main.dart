import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/pages/auth_pages/register_page.dart';
import 'package:grow_a_habbit_2/pages/auth_pages/sign_in_page.dart';
import 'package:grow_a_habbit_2/pages/auth_pages/sign_up_page.dart';
import 'package:grow_a_habbit_2/pages/main_pages/main_page.dart';

import 'package:flutter/services.dart';
import 'package:grow_a_habbit_2/pages/unknown_page.dart';
import 'package:grow_a_habbit_2/services/auth.dart';

import 'main_pages/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> _sub;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    _sub = FirebaseAuth.instance.userChanges().listen((event) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
          event != null ? 'home' : 'login', (Route<dynamic> route) => false);
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grow a Habbit',
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      routes: {
        '/': (context) => const RegisterPage(),
        '/sign_in': (context) => const SignInPage(),
        '/sign_up': (context) => const SignUpPage(),
        'profile_page': (context) => const Profile(),
      },
      initialRoute: FirebaseAuth.instance.currentUser == null ? 'login' : 'home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const MainPage(),
            );
          case 'login':
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const RegisterPage(),
            );
          default:
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const UnknownPage(),
            );
        }
      },
    );
  }
}
