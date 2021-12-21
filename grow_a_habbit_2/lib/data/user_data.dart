import 'package:grow_a_habbit_2/data/habbit.dart';

class OurUser {
  final String uid;
  final String? email;
  String? nickName;
  List<Habbit>? habbit;
  List<String>? firend;

  OurUser(
      {required this.uid, required this.email, required this.nickName, this.habbit, this.firend});

  // OurUser.fromJson(Map<String, Object?> json)
  //     : this(
  //         email: json['email']! as String,
  //         nickName: json['nickName'] as String,
  //         habbit: (json['habbit']! as List).cast<String>(),
  //         friend: (json['friend']! as List).cast<String>(),
  //       );

  // Map<String, dynamic>? toJson() {
  //   return {"email": email, "nickName": nickName, "habbit": habbit, "friend": friend};
  // }
}
