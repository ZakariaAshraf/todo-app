import 'package:todo_app/core/utils/extract_date.dart';

class TaskModal {
  String? id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TaskModal(
      {
        this.id,
      required this.title,
      required this.description,
      required this.dateTime,
         required this.isDone,
      });
  factory TaskModal.fromFirestore(Map<String, dynamic>json){
    return TaskModal(
      id: json['id'],
      title: json['title'],
      description: json['description'],
        dateTime:DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
    isDone: json["isDone"]);

  }
  Map<String, dynamic> toFirstore(){
      return {
        'id': id,
        'title': title,
        'description': description,
        'dateTime': ExtractDate.extractDate(dateTime).millisecondsSinceEpoch,
        'isDone': isDone,
      };
  }
}
