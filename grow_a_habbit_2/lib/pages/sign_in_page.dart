import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/pages/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String? errorText;

  FocusNode focusEmail = FocusNode();
  FocusNode focusPass = FocusNode();
  @override
  void initState() {
    super.initState();
    focusEmail.addListener(() {
      setState(() {});
    });
    focusPass.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    focusEmail.dispose();
    focusPass.dispose();
    super.dispose();
  }

  void _submitForm() {
    final login = _emailController.text;
    final password = _passController.text;
    if (login == '' && password == '') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('main_page');
    } else {
      errorText = 'Не верный логин и пароль';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: kPrimaryText),
          padding: const EdgeInsets.only(right: 300),
          iconSize: 40,
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
            "Sign in",
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
                focusNode: focusEmail,
                cursorColor: kPrimaryText,
                style: const TextStyle(fontSize: 30, color: kPrimaryText),
                controller: _emailController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: focusEmail.hasFocus ? '' : 'Email',
                    hintStyle: const TextStyle(color: kPrimaryTexthalf, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kPrimaryText, width: 2.67),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kPrimaryText, width: 2.67),
                    )),
              ),
              const SizedBox(height: 30),
              TextFormField(
                focusNode: focusPass,
                cursorColor: kPrimaryText,
                style: const TextStyle(fontSize: 30, color: kPrimaryText),
                controller: _passController,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: focusPass.hasFocus ? '' : 'Password',
                    hintStyle: const TextStyle(color: kPrimaryTexthalf, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: kPrimaryText,
                        width: 2.67,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: kPrimaryText, width: 2.67),
                    )),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: kPrimaryText, width: 2.67))),
                    backgroundColor: MaterialStateProperty.all(kPrimaryButtonBackgrounColor),
                    foregroundColor: MaterialStateProperty.all(kPrimaryGreen),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10)),
                    fixedSize: MaterialStateProperty.all(Size.fromWidth(size.width)),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 30),
                  )),
              const SizedBox(height: 20),
              if (errorText != null)
                Text(errorText.toString(), style: const TextStyle(color: Colors.red, fontSize: 17))
            ])),
      ]),
    );
  }
}
