import 'dart:ui';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            children: [
              const SizedBox(
                height: 38,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(211, 212)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFC4C4C4)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(left: 100, top: 170))),
                    onPressed: () {},
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(45, 43)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF000000)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          '+',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(336, 52)),
                    child: TextField(
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFC4C4C4),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          color: Color.fromARGB(128, 0, 0, 0),
                        ),
                        hintText: "Choose nickname",
                        contentPadding: const EdgeInsets.only(left: 13),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 34),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(310, 52)),
                    child: TextField(
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFC4C4C4),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          color: Color.fromARGB(128, 0, 0, 0),
                        ),
                        hintText: "Change email",
                        contentPadding: const EdgeInsets.only(left: 13),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(310, 52)),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFC4C4C4),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          color: Color.fromARGB(128, 0, 0, 0),
                        ),
                        hintText: "Change password",
                        contentPadding: const EdgeInsets.only(left: 13),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 99),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(310, 52)),
                    child: (ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.black, width: 2.67)),
                      ),
                      child: const Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 20,
                              color: Color(0xFF156217)),
                        ),
                      ),
                      onPressed: () {},
                    )),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(310, 52)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.black, width: 2.67)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Delete account',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            color: Color(0xFFCA5A4E)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 27),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(329, 37)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0))),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(77, 196, 196, 196)),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text(""),
                              content: Text("Dialog Content"),
                            );
                          });
                    },
                    child: const Center(
                      child: Text(
                        '???? ???????? ????????????????',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 30,
                            color: Color.fromARGB(128, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
