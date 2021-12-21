import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grow_a_habbit_2/pages/constants/constants.dart';
import 'package:grow_a_habbit_2/services/auth.dart';
import 'package:provider/provider.dart';

class ForgotPasswordWidget extends HookWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = useTextEditingController();
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryBackground,
        leading: IconButton(
          iconSize: 35.0,
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              const SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      const Size(333, 108),
                    ),
                    child: const Text(
                      'Please enter your email to send you code to reset your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Lato', fontSize: 30, color: kPrimaryTexthalf),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 63),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(
                    const Size(333, 48),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _emailController,
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 30,
                      color: kPrimaryborder,
                    ),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: kPrimaryBackground,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: kPrimaryborder, width: 2.67),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: kPrimaryborder, width: 2.67),
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 30,
                        color: Color.fromARGB(128, 0, 0, 0),
                      ),
                      hintText: "Email",
                      contentPadding: EdgeInsets.only(left: 13),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(
                    const Size(333, 58),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        var email = _emailController.text;
                        authService.sendPasswordResetEmail(email);
                        Fluttertoast.showToast(
                            msg: "link for password change was sending to your email: $email",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            backgroundColor: kPrimaryButtonBackgrounColor,
                            textColor: kPrimaryGreen,
                            fontSize: 16.0);
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: kPrimaryborder, width: 2.67))),
                        backgroundColor: MaterialStateProperty.all(kPrimaryButtonBackgrounColor),
                        foregroundColor: MaterialStateProperty.all(kPrimaryGreen),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10)),
                        fixedSize: MaterialStateProperty.all(const Size.fromWidth(2.67)),
                      ),
                      child: const Center(
                        child: Text(
                          'Send',
                          style: TextStyle(fontSize: 30),
                        ),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
