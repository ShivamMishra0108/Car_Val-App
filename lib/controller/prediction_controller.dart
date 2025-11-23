import 'dart:convert';
import 'package:car_val/global_variable.dart';
import 'package:http/http.dart' as http;
class PredictionController {
   Future<double> predictFraud(Map<String,dynamic> transaction)async{
    try{
      http.Response response = await http.post(
          Uri.parse('$modelUri/predict'),
        body: jsonEncode(transaction),
        headers: <String,String>{
            'Content-Type':'application/json; charset=UTF-8'
        }
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return data['prediction'];
      }
      else{
        throw Exception('Error occurred during prediction. Status code: ${response.statusCode}');
      }
    }
    catch(e){
      throw Exception("Error Occurred : $e");
    }
  }
}
