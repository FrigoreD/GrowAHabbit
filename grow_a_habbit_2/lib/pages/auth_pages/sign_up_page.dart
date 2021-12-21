import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_a_habbit_2/pages/constants/constants.dart';
import 'package:grow_a_habbit_2/services/auth.dart';
import 'package:provider/provider.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusEmail = useFocusNode();
    final focusPass = useFocusNode();
    final focusNick = useFocusNode();
    final _emailController = useTextEditingController();
    final _passController = useTextEditingController();
    final _nickController = useTextEditingController();
    final authService = Provider.of<AuthService>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: kPrimaryborder),
          iconSize: 35,
        ),
      ),
      backgroundColor: kPrimaryBackground,
      body: ListView(shrinkWrap: true, children: [
        const SizedBox(
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            "Sign up",
            style:
                TextStyle(fontSize: 50, color: Color.fromARGB(255, 55, 64, 76), fontFamily: 'Lato'),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              TextFormField(
                cursorColor: kPrimaryborder,
                style: const TextStyle(fontSize: 30, color: kPrimaryborder),
                controller: _emailController,
                focusNode: focusEmail,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: focusEmail.hasFocus ? '' : 'Email',
                    hintStyle: const TextStyle(color: kPrimaryTexthalf, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kPrimaryborder, width: 2.67),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kPrimaryborder, width: 2.67),
                    )),
              ),
              const SizedBox(height: 30),
              TextFormField(
                cursorColor: kPrimaryborder,
                style: const TextStyle(fontSize: 30, color: kPrimaryborder),
                controller: _passController,
                focusNode: focusPass,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: focusPass.hasFocus ? '' : 'Password',
                    hintStyle: const TextStyle(color: kPrimaryTexthalf, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: kPrimaryborder,
                        width: 2.67,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kPrimaryborder, width: 2.67),
                    )),
              ),
              const SizedBox(height: 30),
              TextFormField(
                cursorColor: kPrimaryborder,
                style: const TextStyle(fontSize: 30, color: kPrimaryborder),
                controller: _nickController,
                focusNode: focusNick,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: focusNick.hasFocus ? '' : 'NickName',
                    hintStyle: const TextStyle(color: kPrimaryTexthalf, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: kPrimaryborder,
                        width: 2.67,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kPrimaryborder, width: 2.67),
                    )),
              ),
              const SizedBox(height: 52),
              ElevatedButton(
                  onPressed: () async {
                    await authService.signUp(
                        _emailController.text, _passController.text, _nickController.text);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: kPrimaryborder, width: 2.67))),
                    backgroundColor: MaterialStateProperty.all(kPrimaryButtonBackgrounColor),
                    foregroundColor: MaterialStateProperty.all(kPrimaryGreen),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10)),
                    fixedSize: MaterialStateProperty.all(Size.fromWidth(size.width)),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30),
                  ))
            ])),
      ]),
    );
  }
}
