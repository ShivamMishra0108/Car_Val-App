import 'package:tflite_flutter/tflite_flutter.dart';

void loadModelInfo() async {
  final interpreter = await Interpreter.fromAsset('car_price_model.tflite');

  // Get input tensor
  var inputTensor = interpreter.getInputTensors().first;

  print("Input Name: ${inputTensor.name}");
  print("Input Shape: ${inputTensor.shape}");
  print("Input Type: ${inputTensor.type}");
}
