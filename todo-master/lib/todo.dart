import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ToDoClass {
  String id = "1";
  String title = " title";
  String note = "note";
  DateTime? date;
  // String startTime;
  // String endTime;
  DateTime startTime;
  DateTime endTime;
  Color color;

  ToDoClass({
    required this.id,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    this.color = Colors.blue,
  });

  static List<ToDoClass> todoList() {
    return [
      ToDoClass(
        id: "1 ",
        title: "title 1 ",
        note: "note1",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
      ),
      ToDoClass(
        id: "2",
        title: "title 2 ",
        note: "note2",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
      ), ToDoClass(
        id: "3",
        title: "title3",
        note: "note3",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
      ), ToDoClass(
        id: "4",
        title: "title 4 ",
        note: "note 4 ",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
      ),

    ];
  }
}
