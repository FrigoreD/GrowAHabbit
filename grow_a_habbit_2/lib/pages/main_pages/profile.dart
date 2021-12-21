import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/pages/constants/constants.dart';
import 'package:grow_a_habbit_2/pages/main_pages/text_by_creators.dart';
import 'package:grow_a_habbit_2/services/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    final AuthService _authService = AuthService();
    Stream<DocumentSnapshot> provideDocumentFielStream() {
      return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
    }

    return Scaffold(
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
      backgroundColor: kPrimaryBackground,
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(const Size(200, 200)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFC4C4C4)),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.only(left: 100, top: 170))),
                  onPressed: () {},
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(45, 43)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF000000)),
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
                  constraints: BoxConstraints.tight(const Size(336, 52)),
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: provideDocumentFielStream(),
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Text("Loading");
                        }
                        dynamic data = snapshot.data;
                        return ListView(children: [
                          TextField(
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
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              hintText: data['nickName'],
                              contentPadding: const EdgeInsets.only(left: 13),
                            ),
                          )
                        ]);
                      }),
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
            const SizedBox(height: 30),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(310, 52)),
                  child: (ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.black, width: 2.67)),
                    ),
                    child: const Center(
                      child: Text(
                        'Log Out',
                        style:
                            TextStyle(fontFamily: 'Lato', fontSize: 20, color: Color(0xFF156217)),
                      ),
                    ),
                    onPressed: () async {
                      await _authService.signOut();
                      Navigator.pop(context);
                    },
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
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.black, width: 2.67)),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Center(child: Text('Are you sure to delete account?')),
                                content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          child: const Text('Yes'),
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            shape:
                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                        side: const BorderSide(
                                                            color: kPrimaryborder, width: 2.67))),
                                            backgroundColor: MaterialStateProperty.all(
                                                kPrimaryButtonBackgrounColor),
                                            foregroundColor:
                                                MaterialStateProperty.all(kPrimaryGreen),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.symmetric(vertical: 12.5)),
                                          )),
                                      ElevatedButton(
                                          child: const Text('No'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ButtonStyle(
                                            shape:
                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                        side: const BorderSide(
                                                            color: kPrimaryborder, width: 2.67))),
                                            backgroundColor: MaterialStateProperty.all(
                                                kPrimaryButtonBackgrounColor),
                                            foregroundColor:
                                                MaterialStateProperty.all(kPrimaryGreen),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.symmetric(vertical: 12.5)),
                                          ))
                                    ]));
                          });
                    },
                    child: const Text(
                      'Delete account',
                      style: TextStyle(fontFamily: 'Lato', fontSize: 20, color: Color(0xFFCA5A4E)),
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
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))),
                    backgroundColor:
                        MaterialStateProperty.all(const Color.fromARGB(77, 196, 196, 196)),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const TextByCreators();
                        });
                  },
                  child: const Center(
                    child: Text(
                      'На хлеб разрабам',
                      style: TextStyle(
                          fontFamily: 'Lato', fontSize: 30, color: Color.fromARGB(128, 0, 0, 0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
