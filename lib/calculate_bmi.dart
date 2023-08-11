import 'dart:math';
class Calculate_BMI{
  Calculate_BMI(this.height1,this.weight1);
  final int height1;
  final int weight1;
  double _bmi = 0;

  String calculatebmi(){
     _bmi= weight1/pow(height1/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >=25){
      return 'jaadiya genda halvanu rakh kai';
    }else if(_bmi > 18.5){
      return 'barabar che';
    }else{
      return 'khavanu rakh kai';
    }
  }
}