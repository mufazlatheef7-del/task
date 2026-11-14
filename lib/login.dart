import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey=GlobalKey<FormState>();
  final username=TextEditingController();
  final password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      
      title: Text("Login",
      style: TextStyle(
        fontWeight: FontWeight.bold
      ),
      ),
      centerTitle: true,
     ),
     body: Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Form(
              key: formkey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter Username"),
                  ),
                  SizedBox(height: 5,),
               TextFormField(
                controller: username,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Enter Password"),
              ),
              SizedBox(height: 5,),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white38,
                  foregroundColor: Colors.black45,
                  minimumSize: Size(200, 50)
                ),
                onPressed: ()async{
               if(username.text=="admin"&&
               password.text=="1234"
               ){
                 var prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', username.text);
    await prefs.setString('password', password.text);
    await prefs.setBool('isLoggedIn', true);

                Navigator.pushReplacement(
                  context, MaterialPageRoute(
                    builder: (context)=>Home()));
               }else{
                 ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
           content: Text("Invalid username or password"),
               backgroundColor: Colors.red,
           ),
          );
               }
                }, child: Text("Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ))
                ],
        ),
              )
      )
          
      )
     );
   
  }
}