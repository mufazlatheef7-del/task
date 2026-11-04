import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const new({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("its life",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 20,
            child: Icon(Icons.person),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("good morning",
              style: TextStyle(
                fontSize: 25
              ),
              ),
              Text("Dear christina",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10,),

              Container(
padding: EdgeInsets.all(20),
                width: double.infinity,
               
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     "keep it up " ,
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                     ),
                    ),
                    SizedBox(height: 10,),
                    Text("2 weeks streak of \n supporting",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),
                    ),
                    SizedBox(height: 20,),
                    Text("this week",
                    style: TextStyle(
                      color: Colors.lightGreen
                    ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("popular reports",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                      
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("women abuse",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 10,),
                        Text("sexual physical,\nemotional...",
                        style: TextStyle(
                          color: Colors.white
                        ),
                        )
                      ],
                    ),
                  )),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("child abuse",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          SizedBox(height: 10,),
                          Text("sexual physical,\n emotional...",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          )
                        ],
                      ),
                    )
                    )
                ],
              ),
              SizedBox(height: 25,),
              Text("popular reports",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 205, 205),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text("M"),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("animal abuse",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Text("sexual physical emotional...",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          )
                        ],
                      )),
                      Icon(Icons.arrow_forward_ios,
                      
                      )
                  ],
                ),
              ),
              SizedBox(height: 30,),
                BottomNavigationBar(
   type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightGreen,
 unselectedItemColor: Colors.grey,

      currentIndex: 0,
  items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Feeds",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
             
            ],
          ),
            ]
        ),
      ),
      )
    );
  }
}