import 'package:flutter/material.dart';
import 'package:flutter_application_profile/consts.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryBackground,
        leading: IconButton(
          iconSize: 30.0,
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
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
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 30,
                          color: kPrimaryText),
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
                  child: TextField(
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 30,
                      color: kPrimaryText,
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kPrimaryBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: kPrimaryText,
                          width: 2.67,
                        ),
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 30,
                        color: Color.fromARGB(128, 0, 0, 0),
                      ),
                      hintText: "Email",
                      contentPadding: const EdgeInsets.only(left: 13),
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
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(
                                        color: kPrimaryText, width: 2.67))),
                        backgroundColor: MaterialStateProperty.all(
                            kPrimaryButtonBackgrounColor),
                        foregroundColor:
                            MaterialStateProperty.all(kPrimaryGreen),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 10)),
                        fixedSize: MaterialStateProperty.all(
                            const Size.fromWidth(2.67)),
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
