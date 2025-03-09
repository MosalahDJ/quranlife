import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Message {
  final String content;
  final bool isUser;
  Message(this.content, this.isUser);
}

class AiChatController extends GetxController {
  static final String _apiKey = dotenv.env['OPENROUTER_API_KEY']!;
  static const String _modelUrl = "https://openrouter.ai/api/v1";

  final messageController = TextEditingController();
  final scrollController = ScrollController();
  final RxList<Message> messages = <Message>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  static const _systemPrompt = """
أنت مساعد ذكي في تطبيق قرآن لايف ب اللاتينية QuranLife، مهمتك الرئيسية هي:
- تقديم معلومات حول التاريخ الإسلامي بشكل دقيق وموثق.
- تقديم توعية عامة حول الأحداث التاريخية الإسلامية.
- توجيه المستخدمين إلى المصادر الموثوقة عند الحاجة.

القواعد الأساسية:
1. عند السؤال عن هويتك أجب بهدا الجواب و في حالة كان اليوزر يتحدث لغة أخرى ترجمه و قدمه بلغة اليوزر:
   "أنا مساعد ذكي في تطبيق قرآن لايف مخصص لتقديم معلومات حول التاريخ الإسلامي."

2. إذا طرح سؤال خارج نطاق التاريخ الإسلامي أجب بهدا الجواب و في حالة كان اليوزر يتحدث لغة أخرى ترجمه و قدمه بلغة اليوزر: 
   "عذرًا، هذا التطبيق مخصص لتقديم معلومات حول التاريخ الإسلامي فقط. كيف يمكنني مساعدتك في موضوع تاريخي؟"

3. منهجية الإجابة:
   - قدم معلومات دقيقة وموثقة حول التاريخ الإسلامي.
   - استخدم نفس لغة السآل بطريقة واضحة وسهلة.
   - تجنب تمامًا تقديم أي فتاوى أو أحكام شرعية.
   - لا تستخدم نصوص القرآن أو الأحاديث النبوية في الإجابات.
   - لا تقدم أي رأي أو إجابة حول ما إذا كان شيء ما جائزًا أو غير جائز.

4. في حال طلب فتوى أو سؤال ديني:
   "عذرًا، هذا التطبيق مخصص لتقديم معلومات حول التاريخ الإسلامي فقط. يرجى استشارة عالم دين أو مفتٍ معتمد للحصول على إجابة دقيقة."

5. في الأسئلة التي تتطلب فتوى أو حكمًا شرعيًا:
   "هذه مسألة تحتاج إلى فتوى شرعية. يرجى استشارة عالم دين أو مفتٍ موثوق للحصول على إجابة دقيقة."

6. التركيز على التاريخ الإسلامي:
   - قدم معلومات عن الأحداث التاريخية الإسلامية (مثل الفتوحات، الخلفاء الراشدين، الدول الإسلامية).
   - قدم معلومات عن الشخصيات التاريخية الإسلامية (مثل الصحابة، العلماء، القادة).
   - قدم معلومات عن الحضارة الإسلامية والإنجازات العلمية والثقافية.

7. تجنب تمامًا:
   - تقديم أي فتاوى أو أحكام شرعية.
   - استخدام نصوص القرآن أو الأحاديث النبوية.
   - الخوض في المسائل الفقهية أو العقدية.
   - تقديم أي رأي أو إجابة حول ما إذا كان شيء ما جائزًا أو غير جائز.
""";
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> sendMessage() async {
    final userMessage = messageController.text.trim();
    if (userMessage.isEmpty) return;

    messages.add(Message(userMessage, true));
    isLoading.value = true;
    messageController.clear();
    scrollToBottom();

    try {
      final response = await chatWithAI(userMessage);
      messages.add(Message(response, false));
    } catch (e) {
      messages.add(Message("error_connection".tr, false));
    } finally {
      isLoading.value = false;
      scrollToBottom();
    }
  }

  String cleanText(String text) {
    return text
        .replaceAll(r'\n', '\n')
        .replaceAll(RegExp(r'<s>\[INST\].*?\[/INST\]'), '')
        .replaceAll(RegExp(r'[\u200B-\u200D\uFEFF]'), '')
        .replaceAllMapped(
          RegExp(r'\[المصدر:(.*?)\]'),
          (match) => '\n\n[المصدر: ${match.group(1)}]',
        )
        .trim();
  }

  Future<String> chatWithAI(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
        headers: {
          "Authorization": "Bearer $_apiKey",
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode({
          "model": "deepseek/deepseek-r1:free",
          "messages": [
            {"role": "system", "content": _systemPrompt},
            {"role": "user", "content": userMessage}
          ],
          "temperature": 0.3,
          "max_tokens": 600,
          "frequency_penalty": 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        String generatedText = data["choices"][0]["message"]["content"];
        return cleanText(generatedText);
      }
      return "${'connection_error'.tr} (${response.statusCode})";
    } catch (e) {
      return "${'connection_error'.tr} ";
    }
  }

  Future<void> checkModelStatus() async {
    try {
      final response = await http.get(
        Uri.parse(_modelUrl),
        headers: {'Authorization': 'Bearer $_apiKey'},
      );

      if (response.statusCode != 200) {
        errorMessage.value = 'model_unavailable'.tr;
      }
    } catch (e) {
      errorMessage.value = 'server_error'.tr;
    }
  }

  @override
  void onInit() {
    super.onInit();

    checkModelStatus();
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
