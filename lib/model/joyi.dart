
import 'package:hive/hive.dart';

part 'joyi.g.dart';

@HiveType(typeId: 1)
class Joyi extends HiveObject{
  @HiveField(0)
  String? viloyat;

  @HiveField(1)
  String? tuman;

  @HiveField(2)
  String? qishloq;

  Joyi({this.viloyat,this.tuman,this.qishloq});
}