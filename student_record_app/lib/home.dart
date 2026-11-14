import 'package:flutter/material.dart';
import 'package:student_record_app/model/student_model.dart';
import 'package:student_record_app/addstudents.dart';
import 'package:student_record_app/student_detail.dart';
import 'package:student_record_app/student_manager.dart';
class Home extends StatefulWidget {
 const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
  
}
class _HomeState extends State<Home> {
   final students = StudentManager.instance.students;
   String searchQuery = '';
   late Stream<List<Student>> studentsStream;
  @override
  
void initState() {
  super.initState();
  studentsStream = StudentManager.instance.studentsStream;
  StudentManager.instance.studentCount.value = students.length;
}
@override
  Widget build(BuildContext context) {
    
    return Scaffold(
    appBar: AppBar(
      title: Text("Student management"),
      centerTitle: true,
    ),
    body:Column(
  children: [
    Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search students by name',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
      ),
    ),
    ValueListenableBuilder<int>(
  valueListenable: StudentManager.instance.studentCount,
  builder: (context, count, child) {
    return Text('Total Students: $count');
  },
),

    Expanded(
      child:StreamBuilder<List<Student>>(
  stream: studentsStream,
  builder: (context, snapshot) {

    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (snapshot.hasError) {
      return Center(
        child: Text('Error loading students'),
      );
    }
var streamStudents = snapshot.data ?? [];

var filteredList = streamStudents.where((student) =>
  student.name.toLowerCase().contains(searchQuery.toLowerCase())
).toList();
    return  ListView.builder(
itemCount: filteredList.length,
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(filteredList[index].name),
        trailing: Icon(Icons.arrow_forward_ios),

        onTap: () async {
            var selectedStudent = filteredList[index];
  var studentIndex = students.indexOf(selectedStudent);
          var updatedStudent = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDetail(
                student: selectedStudent,
              ),
            ),
          );

          if (updatedStudent == true) {
            setState(() {
              students.removeAt(studentIndex) ; 
              
            });
      StudentManager.instance.notifyStudents();
      StudentManager.instance.studentCount.value = students.length;
          }else if(updatedStudent !=null){
            setState(() {
              students[studentIndex]=updatedStudent;
            });
            StudentManager.instance.notifyStudents();
          }
        },
      ),
    );
  },
);
  }
    )
    )
  ]
    ),
floatingActionButton: FloatingActionButton(
  onPressed: () async {
    var newStudent = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddStudents(),
      ),
    );

    if (newStudent != null) {
      setState(() {
        students.add(newStudent);
        StudentManager.instance.studentCount.value = students.length;
      });
      StudentManager.instance.notifyStudents();
    }
  },
  child: Icon(Icons.add),
),
    );
  }
}