import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton(this.onTap,this.buttonTitle);
  final Function? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap!();
      },
      child: Container(
        color: bottomcolor,
        width: double.infinity,
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(buttonTitle,style: labeltextStyle2,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}