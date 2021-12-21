import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grow_a_habbit_2/data/user_data.dart';

class OurDatabase {
  final CollectionReference _firesote = FirebaseFirestore.instance.collection('users');

  // Future addOrUpdateHabbit(OurUser? user) async {
  //   return await _firesote.doc(await AuthService().getCurrentUID()).set(user!.habbit);
  // }

  Future<String?> createUser(OurUser user) async {
    String retVal = 'error';
    try {
      await _firesote.doc(user.uid).set({
        'nickName': user.nickName,
        'email': user.email,
        'habbit': user.habbit,
      });
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}

// Future<List<dynamic>?> getHabbit(String? uid) async {
//   DocumentReference docRef = FirebaseFirestore.instance.collection('users').doc(uid);

//   return docRef.get().then((datasnapshot) {
//     if (datasnapshot.exists) {
//       List<dynamic> info = datasnapshot.data['Names'].toList();
//       print('#');
//       print(info); //this line prints [aa, aghshs, fffg, fug, ghh, fggg, ghhh]
//       print(info.length); //this line prints 7
//       return info;
//     }
//   });
// }

  // Future<OurUser> getUserInfo(String? uid) async {
  //   OurUser retVal = OurUser();
  //   try {
  //     DocumentSnapshot _docSnapshot = await _firesote.doc(uid).get();
  //     retVal.uid = uid;
  //     retVal.email = _docSnapshot.get('email');
  //     retVal.habbit = _docSnapshot.get('habbits');
  //   } catch (e) {
  //     print(e);
  //   }

  //   return retVal;
  // }

  // Future<String?> createHabbit(OurUser user) async {
  //   String retVal = 'error';
  //   try {
  //     await _firesote.doc(user.uid).set({
  //       'habbits': user.habbit,
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  // Future<OurHabbits> getCurrentHabbit(String habbitId) async {
  //   OurHabbits retVal = OurHabbits();

  //   try {
  //     DocumentSnapshot _docSnapshot = await _firesote.collection('habbits').doc(habbitId).get();
  //     retVal.habbitId = habbitId;
  //     retVal.name = _docSnapshot.get('name');
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  // Future<String?> createHabbit(String habbitName, String userUID) async {
  //   String retVal = 'error';
  //   try {
  //     DocumentReference _docRef = await _firesote.collection("habbits").add({
  //       'name': habbitName,
  //     });

  //     await _firesote.collection('users').doc(userUID).update({
  //       'habbtisGroup': _docRef.id,
  //     });
  //     retVal = 'success';
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  // Future<String?> getHabbit(String habbitName, String userUID) async {
  //   String retVal = 'error';
  //   try {
  //     retVal = 'success';
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }
