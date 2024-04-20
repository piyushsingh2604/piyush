import 'package:flutter/material.dart';
import 'package:piyush/Screens/Terms_screen.dart';
import 'package:piyush/Screens/search_country_screen.dart';

class StartUp extends StatefulWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  State<StartUp> createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/startup.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 440,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Welcome to Study Lancer",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "Please select your role to get registered",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 25),
                          child: Row(
                            children: [
                              Container(
                                height: 130,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchCountry()));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('assets/women.jpeg'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              offset: Offset(
                                                  0, -5), // Move shadow top
                                              blurRadius: 8,
                                            ),
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              offset: Offset(
                                                  -5, 0), // Move shadow left
                                              blurRadius: 8,
                                            ),
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              offset: Offset(
                                                  3, 9), // Move shadow bottom
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Student",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 27,
                              ),
                              Container(
                                height: 130,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchCountry()));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('assets/men.jpeg'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              offset: Offset(
                                                  0, -5), // Move shadow top
                                              blurRadius: 8,
                                            ),
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              offset: Offset(
                                                  -5, 0), // Move shadow left
                                              blurRadius: 8,
                                            ),
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              offset: Offset(
                                                  3, 9), // Move shadow bottom
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Agent",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text(
                                "By continuing you agree to our  ",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        162, 255, 255, 255),
                                    fontSize: 11),
                              ),
                              Container(
                                  child: InkWell(
                                      child: Text(
                                        "Terms and Conditions",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.orange[700]),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Terms(),
                                            ));
                                      }))
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF404040),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    width: MediaQuery.of(context)
                        .size
                        .width, // Adjust width as needed
                    height: 300, // Adjust height as needed
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
