
import 'package:car_val/controller/prediction_controller.dart';
import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PredictionPage> {
  double? price;
  late int year;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  late final int kms_driven;
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController engineController = TextEditingController();
  final PredictionController _predictionController = PredictionController();
  double? _predictedPrice;

  Future<void> predict() async {
    try {
      price = await _predictionController.predictFraud({
        'name': nameController.text,
        'company': companyController.text,
        'year': year,
        'kms_driven': kms_driven,
        'fuel_type': fuelController.text,
      });
      setState(() {
        _predictedPrice = price;
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    engineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Car Price Predictor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Car Name",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: companyController,
              decoration: const InputDecoration(
                labelText: "Company Name",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              onSubmitted: (v) {
                year = int.parse(v);
              },

              decoration: const InputDecoration(
                labelText: "Year",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              onSubmitted: (value) => {kms_driven = int.parse(value)},
              decoration: const InputDecoration(
                labelText: "Kms Driven",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: fuelController,
              decoration: const InputDecoration(
                labelText: "Fuel Type",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await predict();
              },
              child: const Text("Predict Price"),
            ),
            const SizedBox(height: 24),
            if (_predictedPrice != null)
              Text(
                "Predicted Price: \$${_predictedPrice!.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
