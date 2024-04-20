import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/terms.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 259,
                top: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
