import 'dart:ffi';

import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Контейнер Теория'),
      ),
      body: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(
                    'https://img2.goodfon.com/original/6048x4032/6/83/gorod-franciya-parizh-eyfeleva.jpg')
                .image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Контейнер Теория'),
//       ),
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: Colors.amber[600],
//           ),
//           alignment: Alignment.center,
//           // width: 300,
//           // height: 300,
//           //Внешние отступы
//           margin: const EdgeInsets.only(left: 100),
//           //Внутренние отступы
//           padding: const EdgeInsets.all(0.0),
//           child: Text('codeandart'),
//         ),
//       ),
//     );
//   }
// }
