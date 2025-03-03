import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AIChatService {
  static final String _apiKey = dotenv.env['HugingFace_API_KEY']!; 
  static const String _modelUrl = "https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct";

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_modelUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"inputs": message}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data[0]['generated_text']; 
      } else {
        return "خطأ في الاتصال بالخادم: ${response.statusCode}";
      }
    } catch (e) {
      return "حدث خطأ: $e";
    }
  }
}
