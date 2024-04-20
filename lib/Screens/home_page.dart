import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Welcome",
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w300),
          )),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 40,
              width: 140,
              child: Center(
                child: Text("Logout",style: TextStyle(color: Color(0xFFF9D3B4),fontWeight: FontWeight.w300),),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(165, 10, 10, 10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: Offset(0, -1), // Move shadow top
                    blurRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: Offset(-0, 0), // Move shadow left
                    blurRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2, 2), // Move shadow bottom
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),  SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: GestureDetector(
              onTap: (){},
              child: Container(
                height: 40,
                width: 170,
                child: Center(
                  child: Text("Delete User",style: TextStyle(color: Color(0xFFF9D3B4),fontWeight: FontWeight.w300),),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(165, 10, 10, 10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      offset: Offset(0, 0), // Move shadow top
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      offset: Offset(0, 0), // Move shadow left
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(3, 6), // Move shadow bottom
                      blurRadius: 5,
                    ),
                  ],
                ),),
            ),
          )
        ],
      ),
    );
  }
}
