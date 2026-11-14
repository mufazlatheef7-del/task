import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  var prefs = await SharedPreferences.getInstance();

  var isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

runApp(Myapp(isLoggedIn: isLoggedIn));
}
class Myapp extends StatelessWidget {
   final bool isLoggedIn;
  
  const Myapp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? Login() : Home(),
    );
  }
}