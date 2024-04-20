import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:piyush/Model/country_responce_model.dart';
import 'package:piyush/Screens/phone_number_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({Key? key}) : super(key: key);

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  List<Country> _countries = [];

  Future<void> fetchData() async {
    try {
      var headers = {'Accept': 'application/json'};
      var response = await http.get(
        Uri.parse('https://studylancer.yuktidea.com/api/countries'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
//print(data);
        setState(() {
          final countryList = CountryList.fromJson(data);
          _countries = countryList.data!;
        });
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
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "Select your country",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 280,
              height: 43,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hoverColor: Colors.white,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 17,
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(168, 255, 153, 0),
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 30, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors
                                  .grey, 
                              width:
                                  1.0,
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhoneNumberScreen(),
                              ),
                            );
                          },
                          trailing: Text(
                            _countries[index].telCode!,
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                          leading: Container(
                            height: 30,
                            width: 30,
                            child: SvgPicture.network(_countries[index].flag!),
                          ),
                          title: Text(
                            _countries[index].name!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}






