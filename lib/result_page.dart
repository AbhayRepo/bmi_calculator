import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage(this.bmiresult,this.getresult,this.getInterpretation);
  final String bmiresult;
  final String getresult;
  final String getInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculate'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('RESULT',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          )
          ),Expanded(flex:5,child: ReusableCard(colorVariable,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiresult,style:TextStyle(
                    color: Color(0xFF24D876),
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ) ,
                  ),
                  Text(getresult,style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text(getInterpretation,
                    textAlign:TextAlign.center,
                    style: TextStyle(
                    fontSize: 22.0
                  ),
                  )
                ],
              ))
          ),
          BottomButton((){
            Navigator.pop(context);
          }, 'RE_CALCULATE')
        ],
      ),
    );
  }
}
