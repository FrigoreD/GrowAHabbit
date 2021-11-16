import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            padding: const EdgeInsets.only(),
            iconSize: 40,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: const Text(
              "Sign in",
              style: TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 55, 64, 76),
                  fontFamily: 'Lato'),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
              height: 49,
              width: 323,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color.fromARGB(255, 55, 64, 76),
                      width: 2.67)),
              child: Text(
                'Email',
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(128, 55, 64, 76),
                    fontFamily: 'Lato'),
              ))
        ]));
  }
}
