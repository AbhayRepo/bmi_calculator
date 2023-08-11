import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'card_child.dart';
import 'bottom_button.dart';
import 'calculate_bmi.dart';


enum Gendertype {male,female,none}
class InputPage extends StatefulWidget {
   InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gendertype changedGender = Gendertype.none;
  int height = 180;
  int weight = 50;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: () {
                  setState(() {
                    changedGender = Gendertype.male;
                  });
                },
                child: ReusableCard(changedGender == Gendertype.male
                    ? colorVariable
                    : incolorVariable,
                    InsiderCard(FontAwesomeIcons.mars, 'MALE')
                ),
              ),
              ),
              Expanded(child: GestureDetector(
                onTap: () {
                  setState(() {
                    changedGender = Gendertype.female;
                  });
                },
                child: ReusableCard(changedGender == Gendertype.female
                    ? colorVariable
                    : incolorVariable,
                    InsiderCard(FontAwesomeIcons.venus, 'FEMALE')
                ),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(colorVariable, Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Height',
                style: labeltextstyle,
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(),
                    style: labeltextStyle2,
                  ), const Text('cm', style: labeltextstyle,)
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTickMarkColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0XFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                  RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: height.toDouble(),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                  min: 110.0,
                  max: 220.0,
                  inactiveColor: Color(0xFF8D8E98),
                ),
              ),
            ],
          )),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                  colorVariable,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                        style: labeltextstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: labeltextStyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(FontAwesomeIcons.minus,
                                  () {
                                setState(() {
                                  print('minus is pressed');
                                  weight--;
                                });
                              }),
                          SizedBox(width: 10.0),
                          RoundIconButton(FontAwesomeIcons.plus, () =>
                          {
                            setState(() {
                              weight++;
                            })
                          }),
                        ],
                      )
                    ],
                  )
              ),
              ),
              Expanded(child: ReusableCard(colorVariable,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: labeltextstyle),
                      SizedBox(width: 10.0),
                      Text(age.toString(), style: labeltextStyle2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(width: 10.0),
                          RoundIconButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              age++;
                            });
                          })
                        ],
                      )

                    ],
                  )),
              ),
            ],
          )
          ),
          BottomButton(() {
            Calculate_BMI calc = Calculate_BMI(height, weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultPage(calc.calculatebmi(), calc.getresult(),
                  calc.getInterpretation());
            }
            ),
            );
          }, 'CALCULATE'),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon,this.onPressed1);

  final IconData icon;
  final Function? onPressed1;
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(child:
      Icon(icon),
      onPressed: (){
      onPressed1!();
    },
    shape: CircleBorder(),
      elevation: 0.0,
    fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}






