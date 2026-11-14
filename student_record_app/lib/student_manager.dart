import 'package:student_record_app/model/student_model.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class StudentManager {
  StudentManager._();

  static final StudentManager instance = StudentManager._();

  final students = <Student>[];
  ValueNotifier<int> studentCount = ValueNotifier(0);
  final studentController = StreamController<List<Student>>.broadcast();
  Future<List<Student>> getStudents() async {
  await Future.delayed(Duration(seconds: 3));

  return students;
}
void notifyStudents() {
  studentController.add(List.from(students));
}
Stream<List<Student>> get studentsStream async* {
  yield List.from(students);
  yield* studentController.stream;
}
}