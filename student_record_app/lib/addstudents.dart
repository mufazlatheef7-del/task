import 'package:flutter/material.dart';
import 'package:student_record_app/model/student_model.dart';
class AddStudents extends StatefulWidget {
  final Student?student;
  const AddStudents({super.key, this.student});
    @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  final name = TextEditingController();
  final age = TextEditingController();
  final studentClass = TextEditingController();
  final address = TextEditingController();
  @override
  void initState() {
  super.initState();

  if (widget.student != null) {
    name.text = widget.student!.name;
    age.text = widget.student!.age.toString();
    studentClass.text = widget.student!.studentClass;
    address.text = widget.student!.address;
  }
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
  widget.student == null ? 'Add Student' : 'Edit Student',
),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 20),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: age,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: studentClass,
              decoration: InputDecoration(
                labelText: 'Class',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: address,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var updatedStudent= Student(
                  image:widget.student?.image?? "",
                   name: name.text,
                    age: int.parse(age.text),
                     studentClass: studentClass.text,
                      address: address.text);
                Navigator.pop(context, updatedStudent);
              },
              child: Text(
        widget.student == null ? 'Save Student' : 'Update Student',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
