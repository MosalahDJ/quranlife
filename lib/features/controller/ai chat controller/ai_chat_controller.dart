import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AIChatService extends GetxController {
  static final String _apiKey = dotenv.env['HUGGINGFACE_API_KEY']!;
  static const String _modelUrl =
      "https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct";
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_modelUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "inputs": """<s>[INST] $message [/INST]""",
          "parameters": {
            "max_length": 1000,
            "temperature": 0.7,
            "top_p": 0.95,
            "repetition_penalty": 1.15,
            "do_sample": true,
            "num_return_sequences": 1
          }
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String generatedText = data[0]['generated_text'];
        // Remove the original prompt from the response
        generatedText = generatedText
            .replaceAll("""<s>[INST] $message [/INST]""", '').trim();
        return generatedText;
      } else if (response.statusCode == 503) {
        return "النموذج قيد التحميل، يرجى المحاولة مرة أخرى بعد قليل.";
      } else {
        return "عذراً، حدث خطأ في الاتصال (${response.statusCode})";
      }
    } catch (e) {
      return "حدث خطأ غير متوقع: $e";
    }
  }

  Future<void> checkModelStatus() async {
    try {
      final response = await http.get(
        Uri.parse(_modelUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
        },
      );

      if (response.statusCode != 200) {
        errorMessage.value = 'النموذج غير متاح حالياً';
      }
    } catch (e) {
      errorMessage.value = 'خطأ في الاتصال بالخادم';
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkModelStatus();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
