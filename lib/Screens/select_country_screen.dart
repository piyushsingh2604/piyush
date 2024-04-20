import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:piyush/Model/country_responce_model.dart';
import 'package:piyush/Screens/home_page.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  Future<void> fetchData() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization':
            'Bearer 50|SAmMJXQJERbxRn9kXudYIU0bBzSrL9f225trNbKk5270d1we'
      };

      var body = {'country_id': 2};
      var response = await http.post(
          Uri.parse('https://studylancer.yuktidea.com/api/select/country'),
          headers: headers,
          body: body);

      print('API Response:${response.statusCode}');

      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
        print('API Data:$data');

        // setState(() {
        //   final countryList = CountryList.fromJson(data);
        //   _countries = countryList.data!;
        // });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error: show a snackbar, retry, etc.
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 260),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 30,
                width: 30,
                child: Center(
                    child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 17,
                  color: Colors.white,
                )),
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
                      offset: Offset(-5, -2),
                      blurRadius: 9,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(5, 5),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Select Country",
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w300),
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Please select the country where you",
            style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
          ),
          Text(
            "want to study",
            style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 3, // Spread radius
                  blurRadius: 8, // Blur radius
                  offset: Offset(0, 2), // Shadow offset
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(35, 0, 0, 0),
                  Color.fromARGB(47, 255, 255, 255),
                  Color.fromARGB(35, 0, 0, 0),
                ],
                stops: [0.2, 0.5, 0.8],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Text(
                      "Australia",
                      style: TextStyle(color: Color(0xFF7D7E80)),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                height: 100,
                width: 100,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Text("Canada", style: TextStyle(color: Color(0xFF7D7E80)))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            child: Container(
              height: 40,
              width: 140,
              child: Center(
                child: Text(
                  "Proceed",
                  style: TextStyle(
                      color: Color(0xFFF9D3B4), fontWeight: FontWeight.w300),
                ),
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
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Cant't see the country of your interest?",
            style: TextStyle(
                fontSize: 10, color: Color.fromARGB(136, 255, 255, 255)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Consult with us",
            style: TextStyle(color: Color(0xFFD9896A), fontSize: 17),
          )
        ],
      ),
    );
  }
}
