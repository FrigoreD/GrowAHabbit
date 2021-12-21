import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/pages/constants/constants.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  var ind = 0;
  void _incriment() {
    ind += 1;
    setState(() {});
  }

  List<FriendWidget> friends = [];
  void addFriend(FriendWidget friendW) {
    friends.add(friendW);
  }

  @override
  Widget build(BuildContext context) {
    List<FriendWidget> friendData = [];
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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 34),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(
                        const Size(338, 63),
                      ),
                      child: TextField(
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kPrimaryButtonBackgrounColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          hintStyle: const TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            color: Color.fromARGB(128, 0, 0, 0),
                          ),
                          hintText: "Search friend",
                          contentPadding: const EdgeInsets.only(left: 13),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 63,
                  ),
                  const Text(
                    'Your Friends',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: 'Lato', fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(
                        const Size(166, 46),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            kPrimaryButtonBackgrounColor,
                          ),
                        ),
                        child: const Text(
                          'add friend',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Lato', fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () {
                          _incriment();
                          addFriend(const FriendWidget());
                        },
                      ),
                    ),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: friends.length,
                      itemBuilder: (BuildContext context, int index) {
                        return const FriendWidget();
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}

class FriendWidget extends StatelessWidget {
  const FriendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
      child: ConstrainedBox(
          constraints: BoxConstraints.tight(
            const Size(338, 60),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(color: kPrimaryButtonBackgrounColor, width: 2.67),
            ),
            color: kPrimaryBackground,
            child: ListTile(
              onTap: () {},
              title: const Text(
                'Friend',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                iconSize: 30.0,
                icon: const Icon(Icons.delete),
                color: Colors.black,
                onPressed: () {
                  // ignore: avoid_print
                  print("Friend delited");
                },
              ),
            ),
          )),
    );
  }
}
