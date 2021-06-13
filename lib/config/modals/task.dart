import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isDone;

  Task(this.name, {this.isDone = false});
}
