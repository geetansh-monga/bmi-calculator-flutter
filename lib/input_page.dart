import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'round_icon.dart';
import 'results_page.dart';
import 'dialog_box.dart';

enum Gender { male, female, none }
int height = 180;
int weight = 60;
int age = 18;

Color maleCardColor = kInactiveContainerColor;
Color femaleCardColor = kInactiveContainerColor;

Gender selectedGender = Gender.none;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                    cardChild: IconContent(
                      icon: FaIcon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                    cardChild: IconContent(
                      icon: FaIcon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                      ),
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableWidget(
              colour: kActiveContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabeledText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBoldText,
                      ),
                      Text(
                        'cm',
                        style: kLabeledText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x26EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableWidget(
                    colour: kActiveContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabeledText,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kBoldText,
                            ),
                            Text(
                              'cm',
                              style: kLabeledText,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIcon(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 30.0,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            RoundIcon(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 30.0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableWidget(
                    colour: kActiveContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabeledText,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: kBoldText,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIcon(
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 30.0,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            RoundIcon(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 30.0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedGender == Gender.none) {
                showDialog(
                  child: DialogBox(),
                  context: context,
                );
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Results()));
              }
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate your  BMI',
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
          )
        ],
      ),
    );
  }
}
