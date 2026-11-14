import 'package:flutter/material.dart';
import 'package:student_record_app/addstudents.dart';
import 'package:student_record_app/model/student_model.dart';
class StudentDetail extends StatelessWidget {
  final Student student;
  const StudentDetail({super.key,required this.student});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        centerTitle: true,
       actions: [
        IconButton(
          onPressed: ()async{
       var updatedStudent=await Navigator.push(
        context,
         MaterialPageRoute(
          builder: (context)=>AddStudents(
            student: student,
          )));
           

          if(updatedStudent != null){
            Navigator.pop(context,updatedStudent);
          }
          }, icon:Icon(Icons.edit) )
       ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              child: Icon(Icons.person, size: 60),
            ),
            SizedBox(height: 20),
            Text(
              student.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Age'),
                subtitle: Text(student.age.toString()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Class'),
                subtitle: Text(student.studentClass),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Address'),
                subtitle: Text(student.address),
              ),
            ),
            SizedBox(height: 20),
         ElevatedButton(
          onPressed: () {
            
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Delete Student?'),
      content: Text('Are you sure you want to delete this student?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context, true);
          },
          child: Text('Delete'),
        ),
      ],
    ),
  );
},
  
         child: Text('Delete Student'),
),
          ],
        ),
      ),
    );
  }
}