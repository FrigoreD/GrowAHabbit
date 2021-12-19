import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'database.g.dart';

class ExampleWidgetModel {
  void doSome() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }

    var box = await Hive.openBox<User>('testBox');
    final user = User('Ivan', 54);
    await box.add(user);
    final userFromBox = box.getAt(0);

    print(userFromBox);
  }
}

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  User(this.name, this.age);

  String toString() => 'Name: $name, age: $age';
}
