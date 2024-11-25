import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';


const bottomContainerHeight = 80.0;
const activeCardColour = Color(0XFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomCardColour = Color(0XFFFB1555);

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(child: Row(
              children: <Widget>[
                Expanded(

                  child:GestureDetector(onTap:() {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                    child: ResuableCard(
                    colour:selectedGender == Gender.male? activeCardColour : inactiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',
                     ),
                    ),
                   ),
                  ),
                Expanded(child: GestureDetector(onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                              });
                  },
                  child: ResuableCard(
                    colour: selectedGender == Gender.female? activeCardColour : inactiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',
                    ),
                   ),
                  ),
                ),
              ],
            ),),
            Expanded(child: ResuableCard(colour: activeCardColour,)
              ,),
            Expanded(child: Row(
              children: [
                Expanded(child: ResuableCard(colour: activeCardColour,)
                  ,),
                Expanded(child: ResuableCard(colour: activeCardColour,)
                  ,),
              ],
            ),),
            Container(
              color: bottomCardColour,
              margin:EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        )
    );
  }
}



