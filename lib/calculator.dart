import 'input_page.dart';

Map result() {
  double result;
  String category;
  String message;
  double heightInMetres = height / 100;
  result = weight / (heightInMetres * heightInMetres);

  if (result < 18.5) {
    category = 'Underweight';
    message = 'Eat more :P';
  } else if (result >= 18.5 && result <= 24.9) {
    category = 'Normal';
    message = 'Fantastic you are perfect';
  } else if (result >= 25 && result <= 29.9) {
    category = 'Overweight';
    message = 'Try to eat less';
  } else if (result >= 30) {
    category = 'Obesity';
    message = 'Skip meal and do some exercise';
  }
  Map<String, String> data = {
    'result': result.toStringAsPrecision(3),
    'category': category,
    'message': message,
  };
  return data;
}
