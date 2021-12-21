import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/data/user_data.dart';
import 'package:grow_a_habbit_2/pages/auth_pages/register_page.dart';
import 'package:grow_a_habbit_2/pages/main_pages/main_page.dart';
import 'package:grow_a_habbit_2/services/auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<OurUser?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<OurUser?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final OurUser? user = snapshot.data;
            return user == null ? const RegisterPage() : const MainPage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
