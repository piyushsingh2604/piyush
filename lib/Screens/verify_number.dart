import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'package:piyush/Screens/select_country_screen.dart';

// // class VerifyNumber extends StatefulWidget {
// //   const VerifyNumber({super.key});

// //   @override
// //   State<VerifyNumber> createState() => _VerifyNumberState();
// // }

// // class _VerifyNumberState extends State<VerifyNumber> {
// //   TextEditingController newTextEditingController = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xFF404040),
// //       body: Column(
// //         children: [
// //           SizedBox(
// //             height: 70,
// //           ),
// //           Center(
// //             child: Text(
// //               "Verify Number",
// //               style: TextStyle(
// //                   fontSize: 22,
// //                   color: Colors.white,
// //                   fontWeight: FontWeight.w300),
// //             ),
// //           ),
// //           SizedBox(
// //             height: 20,
// //           ),
// //           Text(
// //             "Please enter the OTP received to",
// //             style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
// //           ),
// //           Text(
// //             "verify your number",
// //             style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
// //             child: PinCodeFields(
// //               length: 6,
// //               controller: newTextEditingController,
// //               onComplete: (result) {
// //                 print(result);
// //               },
// //             ),
// //           ),

// //           SizedBox(
// //             height: 100,
// //           ),
// //           Text(
// //             "Didn’t receive OTP?",
// //             style: TextStyle(color: Color(0xFF7D7E80), fontSize: 12),
// //           ),
// //           SizedBox(
// //             height: 15,
// //           ),
// //           TextButton(
// //               onPressed: () {},
// //               child: Text(
// //                 "Resent OTP",
// //                 style: TextStyle(color: Color(0xFFD9896A), fontSize: 17),
// //               )),
// //           SizedBox(
// //             height: 60,
// //           ),
// //           GestureDetector(
// //             onTap: () {},
// //             child: Container(
// //               height: 40,
// //               width: 140,
// //               child: Center(
// //                 child: Text(
// //                   "Proceed",
// //                   style: TextStyle(
// //                       color: Color(0xFFF9D3B4), fontWeight: FontWeight.w300),
// //                 ),
// //               ),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(30),
// //                 color: Color.fromARGB(165, 10, 10, 10),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.white.withOpacity(0.5),
// //                     offset: Offset(0, -1), // Move shadow top
// //                     blurRadius: 3,
// //                   ),
// //                   BoxShadow(
// //                     color: Colors.white.withOpacity(0.5),
// //                     offset: Offset(-0, 0), // Move shadow left
// //                     blurRadius: 2,
// //                   ),
// //                   BoxShadow(
// //                     color: Colors.black.withOpacity(0.5),
// //                     offset: Offset(2, 2), // Move shadow bottom
// //                     blurRadius: 4,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class VerifyNumber extends StatefulWidget {
// final String phoneNumber;
//   const VerifyNumber({Key? key, required this.phoneNumber}) : super(key: key);

//   @override
//   State<VerifyNumber> createState() => _VerifyNumberState();
// }

// class _VerifyNumberState extends State<VerifyNumber> {
//   TextEditingController otpController = TextEditingController();
//   String errorMessage = '';
//     Future<void> _verifyOTP() async {
//     var headers = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/x-www-form-urlencoded',
//     };

//     var body = {
//       'code': otpController.text,
//       'phone': '+918983302922', // Replace with actual phone number
//     };

//    try {
//       var response = await http.post(
//         Uri.parse('https://studylancer.yuktidea.com/api/verify-otp'),
//         headers: headers,
//         body: body,
//       );

//       if (response.statusCode == 200) {
//         // Handle successful verification here
//       } else {
//         // Handle error response here
//         setState(() {
//           errorMessage = 'OTP does not match. please try again';
//         });
//       }
//     } catch (e) {
//       // Handle other errors here
//       setState(() {
//         errorMessage = 'Error: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF404040),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 70,
//           ),
//           Center(
//             child: Text(
//               "Verify Number",
//               style: TextStyle(
//                   fontSize: 22,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w300),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             "Please enter the OTP received to",
//             style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
//           ),
//           Text(
//             "verify your number",
//             style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
//             child: PinCodeFields(
//               length: 4,
//               controller: otpController,
//               onComplete: (result) {
//                 print(result);
//               },
//             ),
//           ),
//            if (errorMessage.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(
//                 errorMessage,
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           SizedBox(
//             height: 100,
//           ),
//           Text(
//             "Didn’t receive OTP?",
//             style: TextStyle(color: Color(0xFF7D7E80), fontSize: 12),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Resent OTP",
//                 style: TextStyle(color: Color(0xFFD9896A), fontSize: 17),
//               )),
//           SizedBox(
//             height: 60,
//           ),
//           GestureDetector(
//             onTap: _verifyOTP,
//             child: Container(
//               height: 40,
//               width: 140,
//               child: Center(
//                 child: Text(
//                   "Proceed",
//                   style: TextStyle(
//                       color: Color(0xFFF9D3B4), fontWeight: FontWeight.w300),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: Color.fromARGB(165, 10, 10, 10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.white.withOpacity(0.5),
//                     offset: Offset(0, -1), // Move shadow top
//                     blurRadius: 3,
//                   ),
//                   BoxShadow(
//                     color: Colors.white.withOpacity(0.5),
//                     offset: Offset(-0, 0), // Move shadow left
//                     blurRadius: 2,
//                   ),
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.5),
//                     offset: Offset(2, 2), // Move shadow bottom
//                     blurRadius: 4,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class VerifyNumber extends StatefulWidget {
  final String phoneNumber;

  const VerifyNumber({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  TextEditingController otpController = TextEditingController();
  String errorMessage = '';

  Future<void> _verifyOTP() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var body = {
      'code': otpController.text,
      'phone': widget.phoneNumber,
    };

    try {
      var response = await http.post(
        Uri.parse('https://studylancer.yuktidea.com/api/verify-otp'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectCountryScreen(),
            ));
        // Handle successful verification here
      } else {
        setState(() {
          errorMessage = 'OTP does not match. Please try again';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
      });
    }
  }

  Future<void> _resendOTP() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://studylancer.yuktidea.com/api/resend-otp'),
    );
    request.fields.addAll({
      'phone': widget.phoneNumber,
    });

    request.headers.addAll(headers);

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        // Optionally, you can handle the successful resend here
      } else {
        print(response.reasonPhrase);
        // Optionally, you can handle the error response here
      }
    } catch (e) {
      print('Error: $e');
      // Handle other errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      body: Column(
        children: [
          SizedBox(height: 70),
          Center(
            child: Text(
              "Verify Number",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Please enter the OTP received to",
            style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
          ),
          Text(
            "verify your number",
            style: TextStyle(color: Color(0xFFD9896A), fontSize: 12),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: PinCodeFields(
              length: 4,
              controller: otpController,
              onComplete: (result) {
                print(result);
              },
            ),
          ),
          if (errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
          SizedBox(height: 100),
          Text(
            "Didn’t receive OTP?",
            style: TextStyle(color: Color(0xFF7D7E80), fontSize: 12),
          ),
          SizedBox(height: 15),
          TextButton(
            onPressed: _resendOTP,
            child: Text(
              "Resend OTP",
              style: TextStyle(color: Color(0xFFD9896A), fontSize: 17),
            ),
          ),
          SizedBox(height: 60),
          GestureDetector(
            onTap: _verifyOTP,
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
                    offset: Offset(0, -1),
                    blurRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: Offset(-0, 0),
                    blurRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2, 2),
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
