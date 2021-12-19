import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grow_a_habbit_2/pages/constants/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _model = ListViewModel();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      appBar: const KekBar(),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        ListViewProvider(
          model: _model,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/GrowaHabit.png',
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
                  'Привычки',
                  style: TextStyle(color: kPrimaryGreen, fontSize: 25),
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
        ),
      ]),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (newContext) {
                  return AlertDialog(
                    title: const Center(child: Text('create habbit')),
                    content: TextField(
                        onChanged: (String value) =>
                            ListViewProvider.read(context)?.newValue = value),
                    actions: [
                      Center(
                          child: ElevatedButton(
                        child: const Text('ADD'),
                        onPressed: () {
                          ListViewProvider.read(context)?.addToList();
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: kPrimaryText, width: 2.67))),
                          backgroundColor: MaterialStateProperty.all(kPrimaryButtonBackgrounColor),
                          foregroundColor: MaterialStateProperty.all(kPrimaryGreen),
                          padding:
                              MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12.5)),
                          fixedSize: MaterialStateProperty.all(Size.fromWidth(size.width)),
                        ),
                      ))
                    ],
                  );
                });
          },
          child: const Text('Create New Habbit'),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: kPrimaryText, width: 2.67))),
            backgroundColor: MaterialStateProperty.all(kPrimaryButtonBackgrounColor),
            foregroundColor: MaterialStateProperty.all(kPrimaryGreen),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
            fixedSize: MaterialStateProperty.all(Size.fromWidth(size.width)),
          )),
    );
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
          color: kPrimaryText,
          size: 30,
        ),
        tooltip: 'Show Profile',
      ),
      actions: [
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          padding: const EdgeInsets.only(right: 16),
          onPressed: () {},
          icon: const Icon(
            Icons.people,
            color: kPrimaryText,
            size: 30,
          ),
          tooltip: 'Show Friends',
        ),
      ],
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderStyle = RoundedRectangleBorder(
        side: const BorderSide(
          color: kPrimaryText,
          width: 2.67,
        ),
        borderRadius: BorderRadius.circular(20));
    final todoList = ListViewProvider.watch(context)?.todoList;
    final kekw = ListViewProvider.watch(context)?.kekw;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: todoList?.length,
      itemBuilder: (context, index) {
        return Card(
          borderOnForeground: true,
          color: kPrimaryBackground,
          shape: borderStyle,
          child: ListTile(
            shape: borderStyle,
            onLongPress: () => ListViewProvider.read(context)?.removeFromList(index),
            title: Text(
              todoList?[index],
              style: const TextStyle(color: kPrimaryGreen, fontSize: 20),
            ),
            trailing: IconButton(
                icon: Icon(kekw),
                onPressed: () {} //ListViewProvider.watch(context)?.changeBox(kekw),
                ),
          ),
        );
      },
    );
  }
}

class ListViewModel extends ChangeNotifier {
  List todoList = ['1', '2', '3', '4'];
  IconData kekw = Icons.check_box_outline_blank;
  String? _newValue;

  set newValue(String value) => _newValue = value;

  void addToList() {
    todoList.add(_newValue);
    notifyListeners();
  }

  void removeFromList(index) {
    todoList.removeAt(index);
    notifyListeners();
  }
}

class ListViewProvider extends InheritedNotifier<ListViewModel> {
  final ListViewModel model;
  const ListViewProvider({Key? key, required this.model, required Widget child})
      : super(
          key: key,
          notifier: model,
          child: child,
        );
  static ListViewModel? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ListViewProvider>()?.notifier;
  }

  static ListViewModel? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<ListViewProvider>()?.widget;
    return widget is ListViewProvider ? widget.notifier : null;
  }
}
