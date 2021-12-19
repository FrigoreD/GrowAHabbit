import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/pages/constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _passConfController = TextEditingController();

  FocusNode focusEmail = FocusNode();
  FocusNode focusPass = FocusNode();
  FocusNode focusConfPass = FocusNode();

  @override
  void initState() {
    super.initState();
    focusEmail.addListener(() {
      setState(() {});
    });
    focusPass.addListener(() {
      setState(() {});
    });
    focusConfPass.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _passConfController.dispose();
    focusEmail.dispose();
    focusPass.dispose();
    focusConfPass.dispose();
    super.dispose();
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
                    floatingLabelBehavior: FloatingLabelBehavior.never,
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
              const SizedBox(height: 30),
              TextFormField(
                focusNode: focusConfPass,
                cursorColor: kPrimaryText,
                style: const TextStyle(fontSize: 30, color: kPrimaryText),
                controller: _passConfController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: focusConfPass.hasFocus ? '' : 'Confirm Password',
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
              const SizedBox(height: 52),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('example_page');
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
                    'Sign Up',
                    style: TextStyle(fontSize: 30),
                  ))
            ])),
      ]),
    );
  }
}
