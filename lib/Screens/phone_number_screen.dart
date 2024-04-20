import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:piyush/Screens/verify_number.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController _telCodeController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  String _errorMessage = ''; 

    Future<void> _makeApiCall() async {
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://studylancer.yuktidea.com/api/student/login'),
    );
    request.fields.addAll({
      'tel_code': '+91',
      'phone': _phoneNumberController.text.trim(),
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      print('Response status code: ${response.statusCode}');
      print('Response message: ${await response.stream.bytesToString()}');

      if (response.statusCode == 200) {
        print('Successful response');
        setState(() {
          _errorMessage = '';
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyNumber(phoneNumber: _phoneNumberController.text.trim()),
          ),
        );
      } else {
        // Checking for specific error message from API response
        var responseBody = await response.stream.bytesToString();
        if (responseBody.contains('Bad Request')) {
          setState(() {
            _errorMessage = 'Wrong number';
          });
        } else {
          setState(() {
            _errorMessage = 'Failed to make API call';
          });
        }
      }
    } catch (error) {
      print('Error making API call: $error');
      setState(() {
        _errorMessage = 'Failed to make API call';
      });
    }
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
              "Enter phone number",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Please enter your 10 digit mobile",
            style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
          ),
          Text(
            "number to receive OTP",
            style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
          ),
          SizedBox(
            height: 25,
          ),Container(
            height: 1,
            width: double.infinity, 
            decoration: BoxDecoration(
                            boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(0, 2), 
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
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              width: 240,
              child: Row(
                children: [
                  // Indian flag
                  Image.asset(
                    'assets/flag.png',
                    width: 30,
                    height: 20,
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: 39,
                    child: Flexible(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _telCodeController,
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            border: InputBorder.none,
                            hintText: '+91',
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mobile number',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Color.fromARGB(129, 255, 255, 255),
            indent: 35,
            endIndent: 50,
          ),
          // Show error message if not empty
          if (_errorMessage.isNotEmpty)
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red, fontSize: 10),
            ),
          SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap:  () async {
  await _makeApiCall();
  if (_errorMessage.isEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerifyNumber(phoneNumber: _phoneNumberController.text.trim()),
      ),
    );
  }
},

            // onTap: () async {
            //   await _makeApiCall();
            //   if (_errorMessage.isEmpty) {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => VerifyNumber()),
            //     );
            //   }
            // },
            child: Container(
              height: 40,
              width: 140,
              child: Center(
                child: Text(
                  "Proceed",
                  style: TextStyle(
                    color: Color(0xFFF9D3B4),
                    fontWeight: FontWeight.w300,
                  ),
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
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  loginUser(_phoneController.text);
                },
                child: Text('Get Verification Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(String phoneNumber) async {
    var headers = {'Accept': 'application/json'};
    var url = Uri.parse('https://studylancer.yuktidea.com/api/student/login');
    var request = http.MultipartRequest('POST', url);

    request.fields.addAll({
      'tel_code': '+91',
      'phone': phoneNumber,
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
