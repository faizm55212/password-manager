import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'password.g.dart';

@HiveType(typeId: 0)
class Password extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String appName;
  @HiveField(2)
  String uname;
  @HiveField(3)
  String psswd;
  Password({this.appName, this.uname, this.psswd}) : this.id = Uuid().v1();
}
