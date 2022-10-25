import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  final weight;
  final height;
  double _bmi;

  String calculatorBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    print(_bmi);
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getAdvice() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have lover then normal body weight. Eat more!";
    }
  }
}
