
import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student extends HiveObject{
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? surname;

  @HiveField(2)
  String? age;

  Student({this.name,this.surname,this.age});
}
