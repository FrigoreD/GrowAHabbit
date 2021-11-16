import 'package:flutter/material.dart';
import 'sign_up_page.dart';
import 'sign_in_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Text(
                "Grow a habit",
                style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(255, 55, 64, 76),
                    fontFamily: 'Lato'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 368.25,
              width: 491,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/backgroundWelcomePage.jpg'),
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
                    Route route1 =
                        MaterialPageRoute(builder: (context) => SignUpPage());
                    Navigator.push(context, route1);
                  },
                  child: Container(
                    height: 70,
                    width: 173,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: const Color.fromARGB(255, 55, 64, 76),
                            width: 2.67)),
                    child: const Center(
                      child: Text(
                        'Sing up',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 21, 98, 23),
                            fontFamily: 'Lato'),
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Route route2 =
                          MaterialPageRoute(builder: (context) => SignInPage());
                      Navigator.push(context, route2);
                    },
                    child: Container(
                      height: 70,
                      width: 173,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color.fromARGB(255, 55, 64, 76),
                              width: 2.67)),
                      child: const Center(
                        child: Text(
                          'Sing in',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 21, 98, 23),
                              fontFamily: 'Lato'),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
