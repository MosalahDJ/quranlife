import 'package:get/get.dart';
import 'package:project/features/controller/onboarding%20page%20controller/onboarding_pagecontroller.dart';
import 'package:project/features/view/auth/login%20page/loginpage.dart';
import 'package:project/features/view/auth/signin%20page/signin_page.dart';
import 'package:project/features/view/home/adkar%20page/adkar_page.dart';
import 'package:project/features/view/home/categories/categories_pages/hijri_calender.dart';
import 'package:project/features/view/home/categories/categories_pages/messaging_page.dart';
import 'package:project/features/view/home/main_page.dart';
import 'package:project/features/view/home/menu/menu%20items%20pages/Referal%20Page/referal_page.dart';
import 'package:project/features/view/home/menu/menu%20items%20pages/about_us%20page/about_us_page.dart';
import 'package:project/features/view/home/menu/menu%20items%20pages/complain%20page/complain_page.dart';
import 'package:project/features/view/home/menu/menu%20items%20pages/settings%20page/setting_page.dart';
import 'package:project/features/view/home/quraan%20page/quraan_page.dart';
import 'package:project/features/view/home/salat%20time/prayer_time_page.dart';
import 'package:project/features/view/home/salat%20time/widgets/tablerow.dart';
import 'package:project/features/view/onboarding%20pages/on_boarding_view.dart';
import 'package:project/features/view/splash%20page/splash_view.dart';

class Myrouts {
  static List<GetPage<dynamic>> get getpages {
    return [
      GetPage(name: "/splashview", page: () => const SplashView()),
      GetPage(
        name: "/onboarding",
        page: () => const OnBoardingView(),
        binding: BindingsBuilder(
          () => Get.lazyPut<OnboardingPagecontroller>(
            () => OnboardingPagecontroller(),
          ),
        ),
      ),
      GetPage(name: "/login", page: () => LoginPage()),
      GetPage(name: "/home", page: () => MainPage()),
      GetPage(name: "/signin", page: () => SigninPage()),
      GetPage(name: "/hijri", page: () => HijriCalender()),
      GetPage(name: "/settings", page: () => const SettingPage()),
      GetPage(name: "/quraan", page: () => QuraanPage()),
      GetPage(name: "/adkar", page: () => AdkarPage()),
      GetPage(name: "/aboutus", page: () => AboutUsPage()),
      GetPage(name: "/help", page: () => ComplainPage()),
      GetPage(name: "/refferal", page: () => RefferalPage()),
      GetPage(name: "/chat", page: () => const MessagingPage()),
      GetPage(
        name: "/salattime",
        page: () => const PrayerTimesPage(),
        bindings: [
          BindingsBuilder(
            () => Get.put<SalawatTableRow>(SalawatTableRow(), permanent: true),
          ),
        ],
      ),
    ];
  }
}
