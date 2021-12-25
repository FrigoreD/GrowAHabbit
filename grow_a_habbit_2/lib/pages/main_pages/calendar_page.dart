import 'package:flutter/material.dart';
import 'package:flutter_application_profile/consts.dart';
import 'package:flutter_application_profile/widgets/calendar_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      body: Padding(
        padding: const EdgeInsets.only(right: 17, left: 17),
        child: Column(
          children: [
            const SizedBox(height: 28),
            Align(
              alignment: Alignment.topRight,
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  const Size(74, 39),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: const BorderSide(
                                color: kPrimaryText, width: 0.0))),
                    backgroundColor:
                        MaterialStateProperty.all(kPrimaryButtonBackgrounColor),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 10)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Edit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lato', fontSize: 20, color: kPrimaryText),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 63),
            CalendarWidget(),
          ],
        ),
      ),
    );
  }
}
