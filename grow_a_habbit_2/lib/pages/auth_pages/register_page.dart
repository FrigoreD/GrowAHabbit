import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/pages/constants/constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Text(
              "Grow a habit",
              style: TextStyle(fontSize: 50, color: kPrimaryText, fontFamily: 'Lato'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 368.25,
            width: 491,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/backgroundWelcomePage.jpg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 130,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/sign_up');
                },
                child: Container(
                  height: 70,
                  width: 173,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kPrimaryText, width: 2.67)),
                  child: const Center(
                    child: Text(
                      'Sing up',
                      style: TextStyle(fontSize: 30, color: kPrimaryGreen, fontFamily: 'Lato'),
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/sign_in');
                  },
                  child: Container(
                    height: 70,
                    width: 173,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kPrimaryText, width: 2.67)),
                    child: const Center(
                      child: Text(
                        'Sing in',
                        style: TextStyle(fontSize: 30, color: kPrimaryGreen, fontFamily: 'Lato'),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
