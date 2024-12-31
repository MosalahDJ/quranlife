import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:get/get.dart';

class Themes {
//=================================================lighttheme=======================================================================

  ThemeData lightmode = ThemeData(
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: kmaincolor3),
      brightness: Brightness.light,
      fontFamily: "Poppins-Black",
      appBarTheme: AppBarTheme(backgroundColor: kmaincolor),
      scaffoldBackgroundColor: kmaincolor3,
      dialogBackgroundColor: kmaincolor3,
      cardColor: textcolor2,
      dividerColor: kmaincolor4,
      buttonTheme: ButtonThemeData(
        buttonColor: kmaincolor4,
        hoverColor: kmaincolor3,
      ),
      iconTheme: IconThemeData(color: textcolor2, size: 25),
      textTheme: TextTheme(
// الاستخدام: عناوين رئيسية كبيرة جداً. تستعمل غالباً في صفحات البداية أو العناوين الرئيسية للمقالات.
        // displayLarge: const TextStyle(
        //     fontSize: 57,
        //     color: Color(0xFFFFFFFF),
        //     fontWeight: FontWeight.bold),

// الاستخدام: عناوين رئيسية أقل حجماً من displayLarge. يمكن استخدامها للعناوين الرئيسية ولكن في أماكن أقل بروزاً.
        // displayMedium: const TextStyle(
        //     fontSize: 45,
        //     color: Color(0xFFFFFFFF),
        //     fontWeight: FontWeight.bold),

// الاستخدام: عناوين رئيسية متوسطة الحجم. تستخدم للعناوين الرئيسية في الأقسام الفرعية أو صفحات التفاصيل.
        // displaySmall: const TextStyle(
        //     fontSize: 36,
        //     color: Color(0xFFFFFFFF),
        //     fontWeight: FontWeight.bold),

// الاستخدام: عناوين الأقسام الرئيسية أو المقالات الرئيسية في المحتوى.
        headlineLarge: TextStyle(
            fontSize: 32, color: kmaincolor, fontWeight: FontWeight.bold),

// الاستخدام: عناوين الأقسام الفرعية. تستخدم لتنظيم المحتوى داخل الأقسام.
        // headlineMedium: const TextStyle(
        //     fontSize: 28,
        //     color: Color(0xFFFFFFFF),
        //     fontWeight: FontWeight.bold),

// الاستخدام: عناوين فرعية داخل الأقسام. تساعد في تقسيم المحتوى بشكل منطقي.
        headlineSmall: TextStyle(
            fontSize: 24, color: textcolor2, fontWeight: FontWeight.bold),

// الاستخدام: عناوين رئيسية في البطاقات أو الأقسام. قد تستخدم في رؤوس الصفحات أو العناصر الهامة.
        titleLarge: TextStyle(
            fontSize: 22,
            color: textcolor3,
            fontWeight: FontWeight.bold,
            fontFamily:
                Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins-Black'),

// الاستخدام: عناوين فرعية داخل البطاقات أو الأقسام. تساعد في تنظيم المحتوى داخل المكونات.
        titleMedium: TextStyle(
            fontSize: 16, color: textcolor2, fontWeight: FontWeight.bold),

// الاستخدام: عناوين فرعية أقل أهمية. قد تستخدم في أجزاء أقل بروزاً من المحتوى.
        titleSmall: TextStyle(
            fontSize: 14, color: textcolor2, fontWeight: FontWeight.bold),

// الاستخدام: النصوص الكبيرة في المحتوى. قد تستخدم في الفقرات الكبيرة أو النصوص التوضيحية.
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textcolor3,
          fontFamily:
              Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins-Black',
        ),

// الاستخدام: النصوص المتوسطة في المحتوى. تستخدم للفقرات العادية والنصوص التوضيحية.
        bodyMedium: TextStyle(
            fontSize: 14,
            color: textcolor3,
            fontWeight: FontWeight.bold,
            fontFamily:
                Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins-Black'),

// الاستخدام: النصوص الصغيرة في المحتوى. تستخدم في النصوص الأقل أهمية أو النصوص التوضيحية القصيرة.
        bodySmall: TextStyle(
          fontSize: 12,
          color: textcolor2,
        ),

// الاستخدام: عناوين أو تسميات الأزرار الكبيرة أو الحقول الهامة.
        labelLarge: TextStyle(
            fontSize: 14, color: hintcolor, fontWeight: FontWeight.bold),

// الاستخدام: عناوين أو تسميات الأزرار المتوسطة أو الحقول.
        labelMedium: TextStyle(
            fontSize: 12, color: textcolor2, fontWeight: FontWeight.bold),

// الاستخدام: تسميات الأزرار الصغيرة أو الأيقونات. تستعمل غالباً في الأماكن ذات الحجم الصغير.
        labelSmall: TextStyle(
            fontSize: 12, color: hintcolor, fontWeight: FontWeight.bold),
      ));

//=================================================Darktheme=======================================================================
  ThemeData darkmode = ThemeData(
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: kmaincolor3dark),
      brightness: Brightness.dark,
      fontFamily: "Poppins-Black",
      appBarTheme: AppBarTheme(backgroundColor: kmaincolor),
      scaffoldBackgroundColor: kmaincolor3dark,
      dialogBackgroundColor: kmaincolor3dark,
      cardColor: kmaincolor2dark,
      dividerColor: kmaincolor4dark,
      buttonTheme: ButtonThemeData(
        buttonColor: kmaincolor4dark,
        hoverColor: kmaincolor3dark,
      ),
      iconTheme: IconThemeData(color: textcolor2dark, size: 25),
      textTheme: TextTheme(
// الاستخدام: عناوين رئيسية كبيرة جداً. تستعمل غالباً في صفحات البداية أو العناوين الرئيسية للمقالات.
        // displayLarge: const TextStyle(
        //     fontSize: 57,
        //     color: Color(0xFFFFFFFF),
        //     fontWeight: FontWeight.bold),

// الاستخدام: عناوين رئيسية أقل حجماً من displayLarge. يمكن استخدامها للعناوين الرئيسية ولكن في أماكن أقل بروزاً.
        // displayMedium: const TextStyle(
        //     fontSize: 45,
        //     color: Color(0xFFFFFFFF),
        //     fontWeight: FontWeight.bold),

// الاستخدام: عناوين رئيسية متوسطة الحجم. تستخدم للعناوين الرئيسية في الأقسام الفرعية أو صفحات التفاصيل.
        // displaySmall: const TextStyle(
        //     fontSize: 36,
        //     color: Color(0xFFFFFFFF),
        //     fontWeight: FontWeight.bold),

// الاستخدام: عناوين الأقسام الرئيسية أو المقالات الرئيسية في المحتوى.
        headlineLarge: TextStyle(
            fontSize: 32, color: kmaincolordark, fontWeight: FontWeight.bold),

// الاستخدام: عناوين الأقسام الفرعية. تستخدم لتنظيم المحتوى داخل الأقسام.
        // headlineMedium: const TextStyle(
        //     fontSize: 28,
        //     color: Color(0xFFFFFFFF),
        //     fontWeight: FontWeight.bold),

// الاستخدام: عناوين فرعية داخل الأقسام. تساعد في تقسيم المحتوى بشكل منطقي.
        headlineSmall: TextStyle(
            fontSize: 24, color: textcolor2dark, fontWeight: FontWeight.bold),

// الاستخدام: عناوين رئيسية في البطاقات أو الأقسام. قد تستخدم في رؤوس الصفحات أو العناصر الهامة.
        titleLarge: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily:
                Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins-Black'),

// الاستخدام: عناوين فرعية داخل البطاقات أو الأقسام. تساعد في تنظيم المحتوى داخل المكونات.
        titleMedium: TextStyle(
            fontSize: 16, color: textcolor2dark, fontWeight: FontWeight.bold),

// الاستخدام: عناوين فرعية أقل أهمية. قد تستخدم في أجزاء أقل بروزاً من المحتوى.
        titleSmall: TextStyle(
            fontSize: 14, color: textcolor2dark, fontWeight: FontWeight.bold),

// الاستخدام: النصوص الكبيرة في المحتوى. قد تستخدم في الفقرات الكبيرة أو النصوص التوضيحية.
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textcolor3dark,
          fontFamily:
              Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins-Black',
        ),

// الاستخدام: النصوص المتوسطة في المحتوى. تستخدم للفقرات العادية والنصوص التوضيحية.
        bodyMedium: TextStyle(
            fontSize: 14,
            color: textcolor3dark,
            fontWeight: FontWeight.bold,
            fontFamily:
                Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins-Black'),

// الاستخدام: النصوص الصغيرة في المحتوى. تستخدم في النصوص الأقل أهمية أو النصوص التوضيحية القصيرة.
        bodySmall: TextStyle(
          fontSize: 12,
          color: textcolor2dark,
        ),

// الاستخدام: عناوين أو تسميات الأزرار الكبيرة أو الحقول الهامة.
        labelLarge: TextStyle(
            fontSize: 14, color: textcolordark, fontWeight: FontWeight.bold),

// الاستخدام: عناوين أو تسميات الأزرار المتوسطة أو الحقول.
        labelMedium: TextStyle(
            fontSize: 12, color: textcolor2dark, fontWeight: FontWeight.bold),

// الاستخدام: تسميات الأزرار الصغيرة أو الأيقونات. تستعمل غالباً في الأماكن ذات الحجم الصغير.
        labelSmall: TextStyle(
            fontSize: 12, color: textcolordark, fontWeight: FontWeight.bold),
      ));
}
