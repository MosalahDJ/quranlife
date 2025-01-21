import 'package:get/get.dart';
import 'package:quranlife/features/controller/onboarding%20page%20controller/onboarding_pagecontroller.dart';
import 'package:quranlife/features/view/auth/login%20page/loginpage.dart';
import 'package:quranlife/features/view/auth/signin%20page/signin_page.dart';
import 'package:quranlife/features/view/home/profile/More%20page/more%20items%20pages/about_us%20page/about_us_page.dart';
import 'package:quranlife/features/view/home/profile/More%20page/more%20items%20pages/complain%20page/complain_page.dart';
import 'package:quranlife/features/view/home/profile/More%20page/more%20items%20pages/Referal%20Page/referal_page.dart';
import 'package:quranlife/features/view/home/profile/More%20page/more%20items%20pages/settings%20page/setting_page.dart';
import 'package:quranlife/features/view/home/adkar%20page/adkar_page.dart';
import 'package:quranlife/features/view/home/categories_page/hijri%20calender/hijri_calender.dart';
import 'package:quranlife/features/view/home/main_page.dart';
import 'package:quranlife/features/view/home/mytestpage.dart';
import 'package:quranlife/features/view/home/quraan%20page/quraan_page.dart';
import 'package:quranlife/features/view/home/salat%20time/prayer_time_page.dart';
import 'package:quranlife/features/view/home/salat%20time/widgets/tablerow.dart';
import 'package:quranlife/features/view/onboarding%20pages/on_boarding_view.dart';
import 'package:quranlife/features/view/splash%20page/splash_view.dart';

class Myrouts {
  static List<GetPage<dynamic>> get getpages {
    return [
      GetPage(
        name: "/splashview",
        page: () => const SplashView(),
      ),
      GetPage(
        name: "/test",
        page: () => const Mytestpage(),
      ),
      GetPage(
          name: "/onboarding",
          page: () => const OnBoardingView(),
          binding: BindingsBuilder(
            () => Get.lazyPut<OnboardingPagecontroller>(
              () => OnboardingPagecontroller(),
            ),
          )),
      GetPage(
        name: "/login",
        page: () => LoginPage(),
      ),
      GetPage(
        name: "/home",
        page: () => MainPage(),
      ),
      GetPage(
        name: "/signin",
        page: () => SigninPage(),
      ),
      GetPage(
        name: "/hijri",
        page: () => HijriCalender(),
      ),
      GetPage(
        name: "/settings",
        page: () => SettingPage(),
      ),
      GetPage(
        name: "/quraan",
        page: () => QuraanPage(),
      ),
      GetPage(
        name: "/adkar",
        page: () => AdkarPage(),
      ),
      GetPage(
        name: "/aboutus",
        page: () => AboutUsPage(),
      ),
      GetPage(
        name: "/help",
        page: () => ComplainPage(),
      ),
      GetPage(
        name: "/refferal",
        page: () => RefferalPage(),
      ),
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
