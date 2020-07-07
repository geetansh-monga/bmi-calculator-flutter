import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculator.dart';

class Results extends StatelessWidget {
  final Map results = result();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'Your Results',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kActiveContainerColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      results['category'],
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30.0,
                      ),
                    ),
                    Text(
                      results['result'],
                      style: kBoldText.copyWith(
                        fontSize: 80.0,
                      ),
                    ),
                    Text(
                      results['message'],
                      textAlign: TextAlign.center,
                      style: kBoldText.copyWith(
                        fontSize: 25.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Calculate again',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                        height: kBottomContainerHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kBottomContainerColor,
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
