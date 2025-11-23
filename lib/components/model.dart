// import 'package:tflite_flutter/tflite_flutter.dart';

// class CarPricePredictor {
//   late Interpreter _interpreter;

//   Future<void> loadModel() async {
//     _interpreter = await Interpreter.fromAsset('assets/car_price_model.tflite');
//   }

//   double predictPrice(List<double> inputFeatures) {
//     var input = [inputFeatures];
//     var output = List.filled(1 * 1, 0.0).reshape([1, 1]);
//     _interpreter.run(input, output);
//     return output[0][0];
//   }

//   void close() {
//     _interpreter.close();
//   }
// }
