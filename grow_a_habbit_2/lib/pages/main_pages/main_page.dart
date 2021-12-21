import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_a_habbit_2/pages/constants/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      appBar: const KekBar(),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/flower.gif',
                height: 250,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Habbits',
                style: TextStyle(color: kPrimaryGreen, fontSize: 25, fontFamily: 'Lato'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryTexthalf, width: 2.67),
                  borderRadius: BorderRadius.circular(20)),
              height: 250,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(17),
              child: const ListViewWidget(),
            ),
            Button(size: size)
          ],
        ),
      ]),
    );
  }
}

// final _habbitController = TextEditingController();

class Button extends HookWidget {
  const Button({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final User? user = auth.currentUser;
    final uid = user!.uid;

    var habbit = '';

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (newContext) {
                    return AlertDialog(
                      title: const Center(
                          child: Text(
                        'create habbit',
                        style: TextStyle(fontFamily: 'Lato'),
                      )),
                      content: TextField(onChanged: (val) {
                        habbit = val;
                      }),
                      actions: [
                        Center(
                            child: ElevatedButton(
                          child: const Text(
                            'ADD',
                            style: TextStyle(fontFamily: 'Lato'),
                          ),
                          onPressed: () async {
                            await users.doc(uid).set({
                              'habbit': FieldValue.arrayUnion([habbit])
                            }, SetOptions(merge: true));
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(color: kPrimaryborder, width: 2.67))),
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryButtonBackgrounColor),
                            foregroundColor: MaterialStateProperty.all(kPrimaryGreen),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 12.5)),
                            fixedSize: MaterialStateProperty.all(Size.fromWidth(size.width)),
                          ),
                        ))
                      ],
                    );
                  });
            },
            child: const Text(
              'Create New Habbit',
              style: TextStyle(fontFamily: 'Lato'),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: kPrimaryborder, width: 2.67))),
              backgroundColor: MaterialStateProperty.all(kPrimaryButtonBackgrounColor),
              foregroundColor: MaterialStateProperty.all(kPrimaryGreen),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
              fixedSize: MaterialStateProperty.all(Size.fromWidth(size.width)),
            )));
  }
}

class KekBar extends StatelessWidget implements PreferredSizeWidget {
  const KekBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryBackground,
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {
          Navigator.of(context).pushNamed('profile_page');
        },
        icon: const Icon(
          Icons.person_rounded,
          color: kPrimaryborder,
          size: 30,
        ),
        tooltip: 'Show Profile',
      ),
      actions: [
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          padding: const EdgeInsets.only(right: 16),
          onPressed: () {
            Navigator.of(context).pushNamed('friendList_page');
          },
          icon: const Icon(
            Icons.people,
            color: kPrimaryborder,
            size: 30,
          ),
          tooltip: 'Show Friends',
        ),
      ],
    );
  }
}

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    final borderStyle = RoundedRectangleBorder(
        side: const BorderSide(
          color: kPrimaryborder,
          width: 2.67,
        ),
        borderRadius: BorderRadius.circular(20));
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Something went wrong',
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          if (snapshot.data['habbit'].length == 0) {
            return const Center(child: Text(""));
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data['habbit'].length,
              itemBuilder: (context, index) {
                String kek = snapshot.data['habbit'][index].toString();
                return Card(
                  borderOnForeground: true,
                  color: kPrimaryBackground,
                  shape: borderStyle,
                  child: ListTile(
                    shape: borderStyle,
                    onTap: () {
                      Navigator.of(context).pushNamed('calendar_page');
                    },
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Center(child: Text('Are you sure to delete habbit?')),
                                content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(fontFamily: 'Lato'),
                                          ),
                                          onPressed: () {
                                            var collection =
                                                FirebaseFirestore.instance.collection('users');
                                            collection.doc(uid).update({
                                              'habbit': FieldValue.arrayRemove(
                                                  [snapshot.data['habbit'][index]]),
                                            });
                                            Navigator.pop(context);
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
                                          )),
                                      ElevatedButton(
                                          child: const Text(
                                            'No',
                                            style: TextStyle(fontFamily: 'Lato'),
                                          ),
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
                    title: Text(
                      kek,
                      style:
                          const TextStyle(color: kPrimaryGreen, fontSize: 20, fontFamily: 'Lato'),
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
