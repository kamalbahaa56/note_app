import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class Quotes {
  @HiveField(0)
  String Author ;
  @HiveField(1)
  String Wisdom ;
  Quotes({required this.Author,required this.Wisdom});
}