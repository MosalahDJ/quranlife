import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // Authentication
          'quran_life': 'Quran Life',
          'email': 'Email Address',
          'enter_email': 'Enter your email address',
          'password': 'Password',
          'enter_password': 'Enter your password',
          'forgot_password': 'Forgot Password?',
          'login': 'Sign In',
          'or_login_with': 'Or Sign In With',
          'no_account': 'Don\'t have an account?',
          'sign_in': 'Create Account',
          'please_enter_email': 'Please enter your email address',
          'please_enter_password': 'Please enter your password',
          'leave_login': 'Do you want to exit the sign-in process?',
          'leave_app': 'Do you want to exit QuranLife?',
          'log_out': 'Log Out',

          // Registration
          'create_account': 'Create Your Account',
          'fill_form': 'Please complete the form below',
          'first_name': 'First Name',
          'last_name': 'Last Name',
          'enter_first_name': 'Enter your first name',
          'enter_last_name': 'Enter your last name',
          'gender': 'Gender',
          'select_gender': 'Select your gender',
          'male': 'Male',
          'female': 'Female',
          'confirm_password': 'Confirm Password',
          'enter_confirm_password': 'Re-enter your password',
          'create_account_button': 'Create Account',
          'leave_registration': 'Do you want to exit the registration process?',
          'registration': 'Registration',

          // Validation
          'field_required': 'This field is required',
          'valid_email': 'Please enter a valid email address',
          'password_length': 'Password must be at least 6 characters long',
          'passwords_match': 'Passwords do not match',

          // Common
          'are_you_sure': 'Are you sure?',
          'yes': 'Yes',
          'no': 'No',

          // Adkar Page
          'daily_supplications': 'Daily Supplications',
          'category_name': 'Category Name',
          'count': 'Count',
          'adkar_categories': 'Adkar Categories',
          "morning_athkar": "Morning Supplications",
          "evening_athkar": "Evening Supplications",
          "waking_up_athkar": "Waking Up Supplications",
          "pre_wudu_athkar": "Before Ablution Supplications",
          "sleep_athkar": "Sleep Supplications",
          "prayer_athkar": "Prayer Supplications",
          "adhan_athkar": "Call to Prayer Supplications",
          "mosque_athkar": "Mosque Supplications",
          "home_athkar": "Home Supplications",
          "bathroom_athkar": "Bathroom Supplications",
          "food_athkar": "Food Supplications",
          "travel_athkar": "Travel Supplications",
          "post_prayer_athkar": "After Praying Supplications",
          "misc_athkar": "Miscellaneous Supplications",

          // Splash Page
          'please_wait': 'Please wait...',

          // Onboarding Pages
          'skip': 'Skip',
          'get_started': 'Get Started',
          'next': 'Next',
          'welcome_title': 'Welcome to Quran Life',
          'welcome_subtitle':
              'Your daily Islamic companion to strengthen your faith and practice Quranic teachings in your daily life.',
          'prayer_times_title': 'Prayer Times & Reminders',
          'prayer_times_subtitle':
              'Quran Life reminds you of prayer times and provides you with dhikr and duas, ensuring you fulfill your religious obligations on time.',
          'for_muslim_title': 'For Every Muslim',
          'for_muslim_subtitle':
              'Quran Life supports all believers in maintaining their prayers, providing guidance and appropriate duas for every occasion.',
          'community_title': 'Islamic Community',
          'community_subtitle':
              'Quran Life helps you locate nearby mosques and connects you with your brothers and sisters in faith.',

          // Home Page Navigation
          'home': 'Home',
          'adkar': 'Adkar',
          'quran': 'Quran',
          'more': 'More',
          'hey_user': 'Hey, User',
          'logout': 'Logout',
          'menu': 'Menu',

          //category items
          "teaching_prayer": "Teaching Prayer",
          "wudu_ghusl": "Wudu And Ghusl",
          "wudu": "Wudu",
          "ghusl": "Ghusl",
          'wuduguid': 'Wudu Guidelines',
          'ghuslguid': 'Ghusl Guidelines',
          "qibla_direction": "Qibla Direction",
          "electronic_tasbih": "Electronic Tasbih",
          "friday_sunnahs": "Friday Sunnahs",
          "al-arba'in_nawawiyyah": "Al-Arba'in Nawawiyyah",
          "tasbih": "Glorification of Allah",
          "al-Hamd": "Praise",
          "istighfar": "Seeking Forgiveness",
          "islamic_ruqyah": "Islamic Ruqyah",
          "quranic_supplications": "Quranic Supplications",
          "prophets_supplications": "Prophets' Supplications",
          "asma_ul-husna": "Names of Allah",
          "community": "Community",
          "ai_bot": "AI Bot",
          "statistics": "Statistics",
          'islamic_calendar': 'Islamic Calendar',
          'hajj_umrah': 'Hajj and Umrah',
          'haj': 'Haj',
          'hajguid': 'Hajj Guidelines',
          'omraguid': 'Umrah Guidelines',
          'omarah': 'Umrah',
          'zakat': 'Zakat',

          //compass page
          'move_phone_figure8':
              'To obtain the precise Qibla direction, move your phone in a figure 8 pattern to calibrate the compass before use.',
          'in_direction': 'You are facing the Qibla.',
          'calibrating': 'Calibrating...',
          "location_disabled": "Location is disabled",
          "location_services_required": "Location services required",
          "location_permission_required": "Location permission required",
          "enable_location_description":
              "Please enable location services to determine the Qibla direction",
          "retry_permission": "Retry Permission",
          'magnetic':
              'Keep away from metals and magnetic devices to ensure accurate Qibla direction.',

          //tasbihpage
          'sur': 'out of',
          'press': 'Press to count',
          'tasbih1': "Glory be to God",
          'tasbih2': "Praise be to God",
          'tasbih3': "Allah is the Greatest",
          'tasbih4': "Glory be to God and praise Him",
          'tasbih5': "Glory be to God, the Almighty",

          //map
          'location_service_disabled': "Location Service Disabled",
          'enable_gps_message':
              "Please enable GPS to get your current location",
          'cancel': "Cancel",
          'open_settings': "Open Settings",
          'retry': "Retry",
          'permission_denied': "Permission Denied",
          'ok': "OK",
          'permission_denied_permanently': "Permission Permanently Denied",
          'enable_permission_settings':
              "Please enable location permission from app settings",
          'searching_location': "Searching for your location...",
          'my_current_location': "My Current Location",

          // Prayer Times
          'prayer_times': 'Prayer Times',
          'mawaqit': 'Schedule',
          'prayer_board': 'Prayer Board',
          'next_prayer': 'Next Prayer: ',
          'time_remaining': 'Time Remaining: ',
          'get_new_data': 'Update Prayer Times',
          'get_location_desc':
              'Updating location and prayer times may take a few minutes. Do you want to continue?',
          'connection_failed': 'Connection Failed',
          'check_internet':
              'Please check your internet connection and try again',

          // Prayer Names
          'fajr': 'Fajr',
          'sunrise': 'Sunrise',
          'dhuhr': 'Dhuhr',
          'asr': 'Asr',
          'maghrib': 'Maghrib',
          'isha': 'Isha',
          'search': "Search in the Holy Quran",

          //quraan page
          'verses': "verses",
          'Meccan': 'Meccan',
          'Medinan': 'Medinan',
          'no_saved_ayahs': 'No saved verses',
          'saved_ayahs': 'Saved verses',
          'Fajr': 'Fajr',
          'Sunrise': 'Sunrise',
          'Dhuhr': 'Dhuhr',
          'Asr': 'Asr',
          'Maghrib': 'Maghrib',
          'Isha': 'Isha',

          // Home Page
          'refresh_prayer_times': 'Pull to refresh prayer times',
          'search_for_a_mosque': 'Search for a mosque',
          'daily_wird': 'Daily Wird',
          'quranlife': 'QuranLife',
          'category': 'Category',
          'quran_wird': '   Daily verse',
          'hadith_wird': '   Hadith Wird',
          'hadith': "Hadith",
          'allah_names': '   Allah Names',
          'source': 'Source',

          // Quran Page
          'holy_quran': 'The Holy Qur\'an',
          'surah': 'Surah',
          'juz': 'Juz\'',
          'verse': 'Verse',
          'surah_name': 'Surah Name',
          'search_verses': 'Search verses...',
          'mosque_finder_desc':
              'Looking for a mosque?\nDon\'t worry, we\'ll help you find the nearest mosque.',
          'find_mosque': 'Find Mosque',
          'profile_name': 'Mohamed salah',
          'profile_email': 'mohamedsalah@gmail.com',

          // Hijri Calendar Page
          'hijri_calendar': 'Hijri Calendar',
          'important_notes': 'Important Notes About Islamic Occasions',
          'note_yearly_shift':
              'Islamic occasions do not occur in the same Gregorian months each year. They move forward by 11 days annually.',
          'note_ramadan':
              'Ramadan occurs in different Gregorian months as it moves through all months of the year over time.',
          'note_association':
              'Do not associate any Islamic occasion with a specific Gregorian month.',
          'note_guidelines':
              'Please follow your country\'s Religious Affairs Directory guidelines for accurate religious occasion dates.',

          // Referral Page
          'referral_page': 'Referral Page',
          'share_app': 'Share QuranLife',
          'share_description':
              'Share the QuranLife app with your friends. Help them connect with the Quran, track prayer times, and strengthen their faith through daily Islamic guidance. Enjoy multiple features with a smooth and beneficial experience.',
          'your_referral_link': 'Your Referral Link:',
          'or_share_with': 'Or Share with:',
          'refferal': 'Referral',

          // Contact/Complain Page
          'contact_us': 'Contact Us',
          'how_can_we_help': 'How Can We Help You?',
          'contact_description':
              'We value your feedback. Please use the form below to send us your questions, concerns, or suggestions. We\'ll get responde to you as soon as possible.',
          'name': 'Name',
          'description': 'Description',
          'send_message': 'Send Message',
          'direct_message': 'Direct Message',
          'telegram': 'Telegram',
          'send_email': 'Send Email',
          'address': 'Address',
          'address_details': 'Constantine, Algeria',
          'working_hours': 'Working Hours',

          // Drawer Menu
          'my_quran': 'My Quran',
          'bookmarks': 'Bookmarks',
          'about_us': 'About Us',
          'settings': 'Settings',
          'help_feedback': 'Help & Feedback',
          'app_version': 'QuranLife v1.0.0',

          // Settings
          'theme_mode': 'Display Theme',
          'system_theme': 'System Default',
          'light_theme': 'Light Mode',
          'dark_theme': 'Dark Mode',
          'notifications': 'Notifications',
          'adhan_notifications': 'Prayer Time Notifications',
          'adhkar_notifications': 'Daily Supplications Notifications',
          'quran_notifications': 'Quran Reading Reminders',
          //
          'general_settings': "General Settings",
          'account_settings': "Account Settings",
          'account_settings_desc':
              "Manage your account and personal information",
          'appearance': "Appearance",
          'appearance_desc': "Customize app appearance",
          'app_settings': "App Settings",
          'notifications_desc': "Manage app alerts and notifications",
          'language': "Language",
          'language_desc': "Change app language",
          'support': "Support",
          'help_support': "Help & Support",
          'help_support_desc': "Get help and contact us",
          // Theme Page Translations
          'system_theme_desc': 'Automatically match system theme',
          'light_theme_desc': 'Light colors for daytime use',
          'dark_theme_desc': 'Dark colors for comfortable night viewing',
          'theme_updated': 'Theme Updated',
          'theme_applied': 'New theme has been applied',
          // languige page Translations

          'select_language': 'Select Language',
          'language_updated': 'Language Updated',
          'language_applied': 'New language has been applied',
          'language_settings': 'Language Settings',
          'arabic': 'Arabic',
          'english': 'English',
          'french': 'French',
          'arabic_desc': 'Arabic language and interface',
          'english_desc': 'English language and interface',
          'french_desc': 'French language and interface',

          // New Translations
          'who_am_i': 'Who Am I?',
          'developer_name': 'Djehel Mohamed Salah',
          'developer_title': 'Mobile Application Developer',
          'social_facebook': 'Djehel Mohamed Salah',
          'social_instagram': 'moh.medsalah',
          'social_linkedin': 'Djehel Mohamed Salah',
          'social_twitter': 'Djehel Mohamed Salah',
          'building_future': 'Building the Future',
          'mobile_apps': 'Through Mobile Apps',
          'our_expertise': 'Our Expertise',
          'our_mission': 'Our Mission',
          'our_vision': 'Our Vision',
          'expertise_description':
              'We specialize in building beautiful, high-performance apps for Android and iOS using Flutter. With a focus on intuitive design and solving technical challenges, We create apps that are both functional and delightful to use.',
          'mission_description':
              'To empower businesses and individuals by transforming ideas into innovative, user-friendly mobile apps. We deliver scalable solutions that combine cutting-edge technology with exceptional design for meaningful impact.',
          'vision_description':
              ' We envision a world where technology simplifies and enhances everyday life for everyone.',

          // Categories
          'islamic_occasions': 'Islamic Occasions',
          'learn_islam': 'Learn Islam',

          // Hijri Months
          'hijri_month_Muharram': 'Muharram',
          'hijri_month_Safar': 'Safar',
          'hijri_month_Rabi\' al-awwal': 'Rabi al-Awwal',
          'hijri_month_Rabi\' al-thani': 'Rabi al-Thani',
          'hijri_month_Jumada al-awwal': 'Jumada al-Awwal',
          'hijri_month_Jumada al-thani': 'Jumada al-Thani',
          'hijri_month_Rajab': 'Rajab',
          'hijri_month_Sha\'aban': 'Shaban',
          'hijri_month_Ramadan': 'Ramadan',
          'hijri_month_Shawwal': 'Shawwal',
          'hijri_month_Dhu al-Qi\'dah': 'Dhu al-Qidah',
          'hijri_month_Dhu al-Hijjah': 'Dhu al-Hijjah',

          // Statistics Page
          'activity_statistics': 'Activity Statistics',
          'reading_distribution': 'Reading Distribution',
          'overall_progress': 'Overall Progress',
          'daily_progress': 'Daily Progress',
          'daily_goal': 'daily goal',
          'spiritual_journey': 'Your spiritual journey statistics',
          'total_items_read': 'Total Items Read',
          'from_daily_goal': 'of daily goal',
          'no_data': 'No data available',
          'of': 'of',
          'duaa': 'Duaa',
          'qoran': 'Quran',
          'dikr': 'Dikr',
        },
        'ar': {
          // Authentication
          'quran_life': 'قرآن لايف',
          'email': 'البريد الإلكتروني',
          'enter_email': 'أدخل عنوان بريدك الإلكتروني',
          'password': 'كلمة المرور',
          'enter_password': 'أدخل كلمة المرور',
          'forgot_password': 'نسيت كلمة المرور؟',
          'login': 'تسجيل الدخول',
          'or_login_with': 'أو سجل الدخول باستخدام',
          'no_account': 'ليس لديك حساب؟',
          'sign_in': 'إنشاء حساب جديد',
          'please_enter_email': 'الرجاء إدخال البريد الإلكتروني',
          'please_enter_password': 'الرجاء إدخال كلمة المرور',
          'leave_login': 'هل تريد الخروج من عملية تسجيل الدخول؟',
          'leave_app': 'هل تريد الخروج من تطبيق قرآن لايف؟',
          'log_out': 'تسجيل الخروج',

          // Sign Up Page
          'create_account': 'إنشاء حسابك',
          'fill_form': 'يرجى ملء النموذج أدناه',
          'first_name': 'الاسم الأول',
          'last_name': 'اسم العائلة',
          'enter_first_name': 'أدخل اسمك الأول',
          'enter_last_name': 'أدخل اسم عائلتك',
          'gender': 'الجنس',
          'select_gender': 'اختر جنسك',
          'male': 'ذكر',
          'female': 'أنثى',
          'confirm_password': 'تأكيد كلمة المرور',
          'enter_confirm_password': 'أدخل كلمة المرور مرة أخرى',
          'create_account_button': 'إنشاء حساب',
          'leave_registration': 'هل تريد مغادرة عملية التسجيل؟',
          'registration': 'التسجيل',

          // Validation Messages
          'field_required': 'مطلوب',
          'valid_email': 'يرجى إدخال بريد إلكتروني صحيح',
          'password_length': 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
          'passwords_match': 'كلمات المرور غير متطابقة',

          // Common
          'are_you_sure': 'هل أنت متأكد؟',
          'yes': 'نعم',
          'no': 'لا',

          // Adkar Page
          'daily_supplications': 'الأذكار اليومية',
          'category_name': 'اسم التصنيف',
          'count': 'العدد',
          'adkar_categories': 'تصنيفات الأذكار',
          "morning_athkar": "أذكار الصباح",
          "evening_athkar": "أذكار المساء",
          "waking_up_athkar": "أذكار الإستيقاظ من النوم",
          "pre_wudu_athkar": "أذكار قبل الوضوء",
          "sleep_athkar": "أذكار النوم",
          "prayer_athkar": "أذكار الصلاة",
          "adhan_athkar": "أذكار الأذان",
          "mosque_athkar": "أذكار المسجد",
          "home_athkar": "أذكار المنزل",
          "bathroom_athkar": "أذكار الخلاء",
          "food_athkar": "أذكار الطعام",
          "travel_athkar": "أذكار السفر",
          "post_prayer_athkar": "أذكار بعد الصلاة",
          "misc_athkar": "أذكار متفرقة أخرى",

          // Splash Page
          'please_wait': 'برجاء الانتظار...',

          // Onboarding Pages
          'skip': 'تخطي',
          'get_started': 'ابدأ الآن',
          'next': 'التالي',
          'welcome_title': 'مرحباً بك في قرآن لايف',
          'welcome_subtitle':
              'رفيقك الإسلامي اليومي لتقوية إيمانك وممارسة تعاليم القرآن في حياتك اليومية.',
          'prayer_times_title': 'مواقيت الصلاة والتذكير',
          'prayer_times_subtitle':
              'يذكرك تطبيق قرآن لايف بأوقات الصلاة ويزودك بالأذكار والأدعية، لضمان أداء واجباتك الدينية في وقتها.',
          'for_muslim_title': 'لكل مسلم',
          'for_muslim_subtitle':
              'يدعم تطبيق قرآن لايف جميع المؤمنين في الحفاظ على صلواتهم، ويوفر التوجيه والأدعية المناسبة لكل مناسبة.',
          'community_title': 'المجتمع الإسلامي',
          'community_subtitle':
              'يساعدك تطبيق قرآن لايف في العثور على المساجد القريبة ويربطك بإخوانك وأخواتك في الإيمان.',

          // Home Page Navigation
          'home': 'الرئيسية',
          'adkar': 'أذكار',
          'quran': 'القرآن',
          'more': 'أخرى',
          'hey_user': 'مرحباً',
          'logout': 'تسجيل خروج',
          'menu': 'القائمة',

          //category items
          "teaching_prayer": "تعليم الصلاة",
          "wudu_ghusl": "الوضوء والغسل",
          "wudu": "الوضوء",
          "ghusl": "الغسل",
          'wuduguid': 'دليل الوضوء',
          'ghuslguid': 'دليل الغسل',
          "qibla_direction": "اتجاه القبلة",
          "electronic_tasbih": "المسبحة الإلكترونية",
          "friday_sunnahs": "سنن الجمعة",
          "al-arba'in_nawawiyyah": "الأربعون النووية",
          "tasbih": "التسبيح",
          "al-Hamd": "الحمد",
          "istighfar": "الاستغفار",
          "islamic_ruqyah": "الرقية الشرعية",
          "quranic_supplications": "أدعية قرآنية",
          "prophets_supplications": "أدعية الأنبياء",
          "asma_ul-husna": "أسماء الله الحسنى",
          "community": "المجتمع",
          "ai_bot": "AI Bot",
          "statistics": "إحصائيات",
          'islamic_calendar': 'التقويم الإسلامي',
          'hajj_umrah': 'الحج والعمرة',
          'haj': 'الحج',
          'hajguid': 'دليل الحج',
          'omraguid': 'دليل العمرة',
          'omarah': 'العمرة',
          'zakat': 'الزكاة',

          //compass page
          'move_phone_figure8':
              'للحصول على اتجاه القبلة بدقة، حرّك هاتفك بحركة تشكّل الرقم 8 لمعايرة البوصلة قبل الاستعمال.',
          'in_direction': '.أنت في اتجاه القبلة',
          'calibrating': 'معايرة ...',
          "location_disabled": "خدمة الموقع معطلة",
          "location_services_required": "خدمات الموقع مطلوبة",
          "location_permission_required": "إذن الوصول للموقع مطلوب",
          "enable_location_description":
              "يرجى تفعيل خدمة الموقع لتحديد اتجاه القبلة",
          "retry_permission": "إعادة محاولة",
          'magnetic':
              'ابتعد عن المعادن والأجهزة المغناطيسية لضمان دقة اتجاه القبلة.',

//tasbihpage
          'sur': 'من',
          'press': 'اظغط للعد',
          'tasbih1': "سبحان الله",
          'tasbih2': "الحمد الله",
          'tasbih3': "الله أكبر",
          'tasbih4': "سبحان الله و بحمده",
          'tasbih5': "سبحان الله العضيم",

          //map
          'location_service_disabled': "خدمة تحديد الموقع غير مفعلة",
          'enable_gps_message': "يرجى تفعيل GPS للحصول على موقعك الحالي",
          'cancel': "إلغاء",
          'open_settings': "فتح الإعدادات",
          'retry': "إعادة المحاولة",
          'permission_denied': "تم رفض الإذن",
          'ok': "حسناً",
          'permission_denied_permanently': "تم رفض الإذن بشكل دائم",
          'enable_permission_settings':
              "يرجى تفعيل إذن الموقع من إعدادات التطبيق",
          'searching_location': "جاري البحث عن موقعك...",
          'my_current_location': "موقعي الحالي",

          // Prayer Times
          'prayer_times': 'مواقيت الصلاة',
          'mawaqit': 'الصلوات',
          'prayer_board': 'لوحة الصلوات',
          'next_prayer': 'الصلاة القادمة: ',
          'time_remaining': 'الوقت المتبقي: ',
          'get_new_data': 'تحديث مواقيت الصلاة',
          'get_location_desc':
              'تحديث الموقع ومواقيت الصلاة قد يستغرق بضع دقائق، هل تريد الاستمرار؟',
          'connection_failed': 'فشل الاتصال',
          'check_internet': 'يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى',

          // Arabic Prayer Names
          'fajr': 'الفجر',
          'sunrise': 'الشروق',
          'dhuhr': 'الظهر',
          'asr': 'العصر',
          'maghrib': 'المغرب',
          'isha': 'العشاء',

          'Fajr': 'الفجر',
          'Sunrise': 'الشروق',
          'Dhuhr': 'الظهر',
          'Asr': 'العصر',
          'Maghrib': 'المغرب',
          'Isha': 'العشاء',
          'search': "بحث في القرآن الكريم",

          //quraan page
          'verses': 'آية',
          'Meccan': 'مكية',
          'Medinan': 'مدنية',
          'no_saved_ayahs': 'لا توجد آيات المحفوظة',
          'saved_ayahs': 'الآيات المحفوظة',

          // Home Page
          'refresh_prayer_times': 'اسحب لتحديث أوقات الصلاة',
          'search_for_a_mosque': 'البحث عن مسجد',
          'daily_wird': 'الورد اليومي',
          'quranlife': 'قرآن لايف',
          'category': 'أقسام',
          'quran_wird': 'الآية اليومية  ',
          'hadith_wird': 'ورد الحديث   ',
          'hadith': "الحديث",
          'allah_names': 'أسماء الله   ',
          'source': 'المصدر',

          // Quran Page
          'holy_quran': 'القرآن الكريم',
          'surah': 'سورة',
          'juz': 'جزء',
          'verse': 'آية',
          'surah_name': 'اسم السورة',
          'search_verses': 'بحث في الآيات...',
          'mosque_finder_desc':
              'تبحث عن مسجد؟\nسنساعدك في العثور على أقرب مسجد اليك.',
          'find_mosque': 'ابحث عن مسجد',

          // Hijri Calendar Page
          'hijri_calendar': 'التقويم الهجري',
          'important_notes': 'ملاحظات مهمة حول المناسبات الإسلامية',
          'note_yearly_shift':
              'المناسبات الإسلامية لا تقع في نفس الشهور الميلادية كل عام. تتقدم 11 يوماً سنوياً.',
          'note_ramadan':
              'يأتي رمضان في شهور ميلادية مختلفة حيث يتنقل عبر جميع شهور السنة مع مرور الوقت.',
          'note_association': 'لا تربط أي مناسبة إسلامية بشهر ميلادي محدد.',
          'note_guidelines':
              'يرجى اتباع إرشادات مديرية الشؤون الدينية في بلدك للحصول على تواريخ دقيقة للمناسبات الدينية.',

          // Referral Page
          'referral_page': 'صفحة الإحالة',
          'share_app': 'شارك قرآن لايف',
          'share_description':
              'شارك تطبيق قرآن لايف مع أصدقائك .ساعدهم على التواصل مع القرآن، متابعة أوقات الصلاة، وتعزيز إيمانهم من خلال التوجيهات الإسلامية اليومية. استمتع بميزات متعددة بتجربة سلسة ومفيدة',
          'your_referral_link': 'رابط الإحالة الخاص بك:',
          'or_share_with': 'أو شارك عبر:',
          'refferal': 'إحالة',

          // Contact/Complain Page
          'contact_us': 'اتصل بنا',
          'how_can_we_help': 'كيف يمكننا مساعدتك؟',
          'contact_description':
              'نحن نقدر ملاحظاتك. يرجى استخدام النموذج أدناه لإرسال أسئلتك أو استفساراتك أو اقتراحاتك. سنرد عليك في أقرب وقت ممكن.',
          'name': 'الاسم',
          'description': 'الوصف',
          'send_message': 'إرسال',
          'direct_message': 'رسالة مباشرة',
          'telegram': 'تلغرام',
          'send_email': 'إرسال بريد إلكتروني',
          'address': 'العنوان',
          'address_details': 'قسنطينة,الجزائر',
          'working_hours': 'ساعات العمل',

          // Drawer Menu
          'my_quran': 'قرآني',
          'bookmarks': 'المفضلة',
          'about_us': 'من نحن',
          'settings': 'الإعدادات',
          'help_feedback': 'المساعدة والتعليقات',
          'app_version': ' قرآن لايف نسخة ١.٠.٠',

          // Settings
          'theme_mode': 'نمط العرض',
          'system_theme': 'النمط الافتراضي للنظام',
          'light_theme': 'النمط الفاتح',
          'dark_theme': 'النمط الداكن',
          'notifications': 'الإشعارات',
          'adhan_notifications': 'تنبيهات مواقيت الصلاة',
          'adhkar_notifications': 'تنبيهات الأذكار اليومية',
          'quran_notifications': 'تذكير بقراءة القرآن',
//
          'general_settings': "الإعدادات العامة",
          'account_settings': "إعدادات الحساب",
          'account_settings_desc': "إدارة حسابك الشخصي والمعلومات",
          'appearance': "المظهر",
          'appearance_desc': "تخصيص مظهر التطبيق",
          'app_settings': "إعدادات التطبيق",
          'notifications_desc': "إدارة تنبيهات وإشعارات التطبيق",
          'language': "اللغة",
          'language_desc': "تغيير لغة التطبيق",
          'support': "الدعم",
          'help_support': "المساعدة والدعم",
          'help_support_desc': "احصل على المساعدة وتواصل معنا",
          'system_theme_desc': 'مطابقة سمة النظام تلقائياً',
          'light_theme_desc': 'ألوان فاتحة للاستخدام النهاري',
          'dark_theme_desc': 'ألوان داكنة لعرض مريح ليلاً',
          'theme_updated': 'تم تحديث السمة',
          'theme_applied': 'تم تطبيق السمة الجديدة',
          // languige page Translations
          'select_language': 'اختر اللغة',
          'language_updated': 'تم تحديث اللغة',
          'language_applied': 'تم تطبيق اللغة الجديدة',
          'language_settings': 'إعدادات اللغة',
          'arabic': 'العربية',
          'english': 'الإنجليزية',
          'french': 'الفرنسية',
          'arabic_desc': 'اللغة والواجهة العربية',
          'english_desc': 'اللغة والواجهة الإنجليزية',
          'french_desc': 'اللغة والواجهة الفرنسية',

          // New Translations
          'who_am_i': 'من أنا؟',
          'developer_name': 'جحال محمد صلاح',
          'developer_title': 'مطور تطبيقات الموبايل',
          'social_facebook': 'جحال محمد صلاح',
          'social_instagram': 'moh.medsalah',
          'social_linkedin': 'جحال محمد صلاح',
          'social_twitter': 'جحال محمد صلاح',
          'building_future': 'نبني المستقبل',
          'mobile_apps': 'من خلال تطبيقات الموبايل',
          'our_expertise': 'خبرتنا',
          'our_mission': 'مهمتنا',
          'our_vision': 'رؤيتنا',
          'expertise_description':
              'نحن متخصصون في بناء تطبيقات جميلة وعالية الأداء لنظامي Android و iOS باستخدام Flutter. مع التركيز على التصميم البديهي وحل التحديات التقنية، نخلق تطبيقات تكون وظيفية وسارة للاستخدام.',
          'mission_description':
              'تمكين الشركات والأفراد من خلال تحويل الأفكار إلى تطبيقات جوال مبتكرة وسهلة الاستخدام. نقدم حلولاً قابلة للتطوير تجمع بين التكنولوجيا المتطورة والتصميم الاستثنائي لتحقيق تأثير ذو معنى.',
          'vision_description':
              'نحن نتطلع إلى عالم حيث تُبسّط التكنولوجيا وتعزز الحياة اليومية للجميع.',

          // Categories
          'islamic_occasions_info': 'معلومات المناسبات الإسلامية',
          'prayer_calendar': 'تقويم الصلوات',
          'islamic_events': 'الأحداث الإسلامية',
          'nearest_mosques': 'المساجد القريبة',
          'quran_section': 'قسم القرآن',
          'hadith_section': 'قسم الحديث',
          'names_of_allah': 'أسماء الله تعالى',
          'qibla_finder': 'محدد القبلة',
          'salah_times': 'أوقات الصلاة',
          'islamic_occasions': 'المناسبات الإسلامية',
          'learn_islam': 'تعلم الإسلام',

          // Hijri Months
          'hijri_month_Muharram': 'محرم',
          'hijri_month_Safar': 'صفر',
          'hijri_month_Rabi\' al-awwal': 'ربيع الأول',
          'hijri_month_Rabi\' al-thani': 'ربيع الثاني',
          'hijri_month_Jumada al-awwal': 'جمادى الأولى',
          'hijri_month_Jumada al-thani': 'جمادى الثانية',
          'hijri_month_Rajab': 'رجب',
          'hijri_month_Sha\'aban': 'شعبان',
          'hijri_month_Ramadan': 'رمضان',
          'hijri_month_Shawwal': 'شوال',
          'hijri_month_Dhu al-Qi\'dah': 'ذو القعدة',
          'hijri_month_Dhu al-Hijjah': 'ذو الحجة',

          // Statistics Page
          'activity_statistics': 'إحصائيات النشاط',
          'reading_distribution': 'توزيع القراءات',
          'overall_progress': 'التقدم العام',
          'daily_progress': 'التقدم اليومي',
          'daily_goal': 'الهدف اليومي',
          'spiritual_journey': 'إحصائيات رحلتك الروحانية',
          'total_items_read': 'إجمالي العناصر المقروءة',
          'from_daily_goal': 'من الهدف اليومي',
          'no_data': 'لا توجد بيانات متاحة',
          'of': 'من',
          'duaa': 'الدعاء',
          'qoran': 'القرآن',
          'dikr': 'ذكر',
        },
        'fr': {
          // Authentication
          'quran_life': 'Quran Life',
          'email': 'Adresse e-mail',
          'enter_email': 'Saisissez votre adresse e-mail',
          'password': 'Mot de passe',
          'enter_password': 'Saisissez votre mot de passe',
          'forgot_password': 'Mot de passe oublié ?',
          'login': 'Se connecter',
          'or_login_with': 'Ou connectez-vous avec',
          'no_account': 'Vous n\'avez pas de compte ?',
          'sign_in': 'Créer un compte',
          'please_enter_email': 'Veuillez saisir votre adresse e-mail',
          'please_enter_password': 'Veuillez saisir votre mot de passe',
          'leave_login': 'Voulez-vous quitter le processus de connexion ?',
          'leave_app': 'Voulez-vous quitter l\'application Quran Life ?',
          'log_out': 'Déconnexion',

          // Sign Up Page
          'create_account': 'Créez votre compte',
          'fill_form': 'Veuillez remplir le formulaire ci-dessous',
          'first_name': 'Prénom',
          'last_name': 'Nom',
          'enter_first_name': 'Entrez votre prénom',
          'enter_last_name': 'Entrez votre nom',
          'gender': 'Genre',
          'select_gender': 'Sélectionnez votre genre',
          'male': 'Homme',
          'female': 'Femme',
          'confirm_password': 'Confirmer le mot de passe',
          'enter_confirm_password': 'Entrez à nouveau votre mot de passe',
          'create_account_button': 'Créer un compte',
          'leave_registration':
              'Voulez-vous quitter le processus d\'inscription?',
          'registration': 'Inscription',

          // Validation Messages
          'field_required': 'requis',
          'valid_email': 'Veuillez entrer une adresse e-mail valide',
          'password_length':
              'Le mot de passe doit contenir au moins 6 caractères',
          'passwords_match': 'Les mots de passe ne correspondent pas',

          // Common
          'are_you_sure': 'Êtes-vous sûr?',
          'yes': 'Oui',
          'no': 'Non',

          // Adkar Page
          'daily_supplications': 'Supplications Quotidiennes',
          'category_name': 'Nom de la Catégorie',
          'count': 'Compte',
          'adkar_categories': 'Catégories d\'Adhkar',
          "morning_athkar": "Supplications du matin",
          "evening_athkar": "Supplications du soir",
          "waking_up_athkar": "Supplications du réveil",
          "pre_wudu_athkar": "Supplications avant les ablutions",
          "sleep_athkar": "Supplications du sommeil",
          "prayer_athkar": "Supplications de la prière",
          "adhan_athkar": "Supplications de l'appel à la prière",
          "mosque_athkar": "Supplications de la mosquée",
          "home_athkar": "Supplications de la maison",
          "bathroom_athkar": "Supplications des toilettes",
          "food_athkar": "Supplications du repas",
          "travel_athkar": "Supplications du voyage",
          "post_prayer_athkar": "Supplications après la prière",
          "misc_athkar": "Supplications diverses",

          // Splash Page
          'please_wait': 'Veuillez patienter...',

          // Onboarding Pages
          'skip': 'Passer',
          'get_started': 'Commencer',
          'next': 'Suivant',
          'welcome_title': 'Bienvenue sur Quran Life',
          'welcome_subtitle':
              'Votre compagnon islamique quotidien pour renforcer votre foi et pratiquer les enseignements coraniques dans votre vie quotidienne.',
          'prayer_times_title': 'Heures de Prière et Rappels',
          'prayer_times_subtitle':
              'Quran Life vous rappelle les heures de prière et vous fournit des dhikr et des duas, vous assurant de remplir vos obligations religieuses à temps.',
          'for_muslim_title': 'Pour Chaque Musulman',
          'for_muslim_subtitle':
              'Quran Life soutient tous les croyants dans le maintien de leurs prières, fournissant des conseils et des duas appropriés pour chaque occasion.',
          'community_title': 'Communauté Islamique',
          'community_subtitle':
              'Quran Life vous aide à localiser les mosquées à proximité et vous connecte avec vos frères et sœurs dans la foi.',

          // Home Page Navigation
          'home': 'Accueil',
          'adkar': 'Adhkar',
          'quran': 'Coran',
          'more': 'plus',
          'hey_user': 'Bonjour',
          'logout': 'Déconnexion',
          'menu': 'Menu',

          //category items
          "teaching_prayer": "Apprentissage de la Prière",
          "wudu_ghusl": "Wudu et Ghusl",
          "wudu": "Wudu",
          "ghusl": "Ghusl",
          'wuduguid': 'Wudu Guidelines',
          'ghuslguid': 'Ghusl Guidelines',
          "qibla_direction": "Direction de la Qibla",
          "electronic_tasbih": "Tasbih Électronique",
          "friday_sunnahs": "Sounnahs du Vendredi",
          "al-arba'in_nawawiyyah": "Al-Arba'in Nawawiyyah",
          "tasbih": "Glorification d'Allah",
          "al-Hamd": "Louange",
          "istighfar": "Demande de Pardon",
          "islamic_ruqyah": "Ruqyah Islamique",
          "quranic_supplications": "Supplications Coraniques",
          "prophets_supplications": "Supplications des Prophètes",
          "asma_ul-husna": "Noms d'Allah",
          "community": "Communauté",
          "ai_bot": "AI Bot",
          "statistics": "Statistiques",
          'islamic_calendar': 'Calendrier Islamique',
          'hajj_umrah': 'Hajj et Omra',
          'haj': 'Haj',
          'hajguid': 'Guide du Hajj',
          'omraguid': 'Guide de l\'Omra',
          'omarah': 'Umrah',
          'zakat': 'Zakat',
          //compass page
          'move_phone_figure8':
              "Pour obtenir la direction de la Qibla avec précision, déplacez votre téléphone en formant le chiffre 8 pour calibrer la boussole avant utilisation.",
          'in_direction': 'ous êtes face à la Qibla.',
          'calibrating': 'Calibrage en cours',

          "location_disabled": "La localisation est désactivée",
          "location_services_required": "Services de localisation requis",
          "location_permission_required": "Permission de localisation requise",
          "enable_location_description":
              "Veuillez activer les services de localisation pour déterminer la direction de la Qibla",
          "retry_permission": "Réessayer l'autorisation",
          'magnetic':
              'Éloignez-vous des métaux et appareils magnétiques pour assurer la précision de la direction de la Qibla.',

//tasbihpage
          'sur': 'sur',
          'press': 'Appuyez pour compter',
          'tasbih1': "Gloire à Dieu",
          'tasbih2': "Louange à Dieu",
          'tasbih3': "Allah est le Plus Grand",
          'tasbih4': "Gloire à Dieu et louange à Lui",
          'tasbih5': "Gloire à Dieu, le Tout-Puissant",

          //map
          'location_service_disabled': "Service de Localisation Désactivé",
          'enable_gps_message':
              "Veuillez activer le GPS pour obtenir votre position actuelle",
          'cancel': "Annuler",
          'open_settings': "Ouvrir les Paramètres",
          'retry': "Réessayer",
          'permission_denied': "Permission Refusée",
          'ok': "OK",
          'permission_denied_permanently': "Permission Refusée Définitivement",
          'enable_permission_settings':
              "Veuillez activer la permission de localisation dans les paramètres",
          'searching_location': "Recherche de votre position...",
          'my_current_location': "Ma Position Actuelle",

          // Prayer Times
          'prayer_times': 'Horaires des prières',
          'mawaqit': 'prières',
          'prayer_board': 'Tableau des prières',
          'next_prayer': 'Prochaine prière : ',
          'time_remaining': 'Temps restant : ',
          'get_new_data': 'Mettre à jour les horaires',
          'get_location_desc':
              'La mise à jour de la localisation et des horaires de prière peut prendre quelques minutes. Voulez-vous continuer ?',
          'connection_failed': 'Échec de la connexion',
          'check_internet':
              'Veuillez vérifier votre connexion Internet et réessayer',

          // Prayer Names (Keep English versions for internal use)
          'fajr': 'Fajr',
          'sunrise': 'lv du soleil',
          'dhuhr': 'Dhuhr',
          'asr': 'Asr',
          'maghrib': 'Maghrib',
          'isha': 'Isha',

          // Quran Page
          'verses': 'versets',
          'Meccan': 'Meccan',
          'Medinan': 'Medinan',
          'no_saved_ayahs': 'Aucun verset enregistré',
          'saved_ayahs': 'verset enregistré',
          'Fajr': 'Fajr',
          'Sunrise': 'lv du soleil',
          'Dhuhr': 'Dhuhr',
          'Asr': 'Asr',
          'Maghrib': 'Maghrib',
          'Isha': 'Isha',
          'search': "Recherche dans le Coran",

          // Home Page
          'refresh_prayer_times': 'Tirez pour actualiser les heures de prière',
          'search_for_a_mosque': 'Recherche d’une mosquée',
          'daily_wird': 'Wird Quotidien',
          'quranlife': 'QuranLife',
          'category': 'Catégories',
          'quran_wird': '   Verset du Jour',
          'hadith_wird': '   Wird du Hadith',
          'hadith': "Hadith",
          'allah_names': '   Noms d\'Allah',
          'source': 'Source',

          // Quran Page
          'holy_quran': 'Le Saint Coran',
          'surah': 'Sourate',
          'juz': 'Juz\'',
          'verse': 'Verset',
          'surah_name': 'Nom de la Sourate',
          'search_verses': 'Rechercher des versets...',
          'mosque_finder_desc':
              'Vous cherchez une mosquée?\nnous vous aiderons à trouver la mosquée la plus proche.',
          'find_mosque': 'Trouver une Mosquée',

          // Hijri Calendar Page
          'hijri_calendar': 'Calendrier Hijri',
          'important_notes': 'Notes Importantes sur les Occasions Islamiques',
          'note_yearly_shift':
              'Les occasions islamiques ne se produisent pas dans les mêmes mois grégoriens chaque année. Elles avancent de 11 jours par an.',
          'note_ramadan':
              'Le Ramadan se produit dans différents mois grégoriens car il se déplace à travers tous les mois de l\'année au fil du temps.',
          'note_association':
              'N\'associez pas une occasion islamique à un mois grégorien spécifique.',
          'note_guidelines':
              'Veuillez suivre les directives de la Direction des Affaires Religieuses de votre pays pour des dates précises des occasions religieuses.',

          // Referral Page
          'referral_page': 'Page de Parrainage',
          'share_app': 'Partagez QuranLife',
          'share_description':
              'Partagez l\'application QuranLife avec vos amis. Aidez-les à se connecter au Coran, à suivre les heures de prière et à renforcer leur foi grâce à des conseils islamiques quotidiens. Profitez de fonctionnalités multiples avec une expérience fluide et utile.',
          'your_referral_link': 'Votre Lien de Parrainage:',
          'or_share_with': 'Ou Partagez avec:',
          'refferal': 'Parrainage',

          // Contact/Complain Page
          'contact_us': 'Contactez-nous',
          'how_can_we_help': 'Comment Pouvons-nous Vous Aider?',
          'contact_description':
              'Nous apprécions vos commentaires. Veuillez utiliser le formulaire ci-dessous pour nous envoyer vos questions, préoccupations ou suggestions. Nous vous répondrons dès que possible.',
          'name': 'Nom',
          'description': 'Description',
          'send_message': 'Envoyer le Message',
          'direct_message': 'Message Direct',
          'telegram': 'Telegram',
          'send_email': 'envoyer un email',
          'address': 'Adresse',
          'address_details': '123 Rue Principale, Nom de la Ville',
          'working_hours': 'Heures d\'ouverture',

          // Drawer Menu
          'my_quran': 'Mon Coran',
          'bookmarks': 'Favoris',
          'about_us': 'À Propos de Nous',
          'settings': 'Paramètres',
          'help_feedback': 'Aide et Commentaires',
          'app_version': 'QuranLife v1.0.0',

          // Settings
          'theme_mode': 'Thème d\'affichage',
          'system_theme': 'Thème système',
          'light_theme': 'Mode clair',
          'dark_theme': 'Mode sombre',
          'notifications': 'Notifications',
          'adhan_notifications': 'Notifications des heures de prière',
          'adhkar_notifications':
              'Notifications des Supplications quotidiennes',
          'quran_notifications': 'Rappels de lecture du Coran',
          //
          'general_settings': "Paramètres Généraux",
          'account_settings': "Paramètres du Compte",
          'account_settings_desc':
              "Gérer votre compte et vos informations personnelles",
          'appearance': "Apparence",
          'appearance_desc': "Personnaliser l'apparence de l'application",
          'app_settings': "Paramètres de l'Application",
          'notifications_desc': "Gérer les alertes et notifications",
          'language': "Langue",
          'language_desc': "Changer la langue de l'application",
          'support': "Support",
          'help_support': "Aide & Support",
          'help_support_desc': "Obtenir de l'aide et nous contacter",
          // Theme Page Translations
          'system_theme_desc': 'Correspond automatiquement au thème du système',
          'light_theme_desc': 'Couleurs claires pour une utilisation diurne',
          'dark_theme_desc':
              'Couleurs sombres pour un affichage confortable la nuit',
          'theme_updated': 'Thème mis à jour',
          'theme_applied': 'Le nouveau thème a été appliqué',
          // languige page Translations
          'select_language': 'Sélectionner la langue',
          'language_updated': 'Langue mise à jour',
          'language_applied': 'La nouvelle langue a été appliquée',
          'language_settings': 'Paramètres de langue',
          'arabic': 'Arabe',
          'english': 'Anglais',
          'french': 'Français',
          'arabic_desc': 'Langue et interface en arabe',
          'english_desc': 'Langue et interface en anglais',
          'french_desc': 'Langue et interface en français',

          // New Translations
          'who_am_i': 'Qui suis-je?',
          'developer_name': 'Djehel Mohamed Salah',
          'developer_title': 'Développeur d\'Applications Mobiles',
          'social_facebook': 'Djehel Mohamed Salah',
          'social_instagram': 'moh.medsalah',
          'social_linkedin': 'Djehel Mohamed Salah',
          'social_twitter': 'Djehel Mohamed Salah',
          'building_future': 'Construire l\'Avenir',
          'mobile_apps': 'À Travers les Applications Mobiles',
          'our_expertise': 'Notre Expertise',
          'our_mission': 'Notre Mission',
          'our_vision': 'Notre Vision',
          'expertise_description':
              'Nous sommes spécialisés dans la création d\'applications belles et performantes pour Android et iOS en utilisant Flutter. En mettant l\'accent sur un design intuitif et la résolution de défis techniques, nous créons des applications à la fois fonctionnelles et agréables à utiliser.',
          'mission_description':
              'Permettre aux entreprises et aux individus de transformer leurs idées en applications mobiles innovantes et conviviales. Nous proposons des solutions évolutives qui combinent une technologie de pointe et un design exceptionnel pour un impact significatif.',
          'vision_description':
              'Nous envisageons un monde où la technologie simplifie et améliore la vie quotidienne de tous.',

          // Categories
          'islamic_occasions': 'Occasions Islamiques',
          'learn_islam': 'Apprendre l\'Islam',

          // Hijri Months
          'hijri_month_Muharram': 'Mouharram',
          'hijri_month_Safar': 'Safar',
          'hijri_month_Rabi\' al-awwal': 'Rabi al-Awwal',
          'hijri_month_Rabi\' al-thani': 'Rabi al-Thani',
          'hijri_month_Jumada al-awwal': 'Joumada al-Awwal',
          'hijri_month_Jumada al-thani': 'Joumada al-Thani',
          'hijri_month_Rajab': 'Rajab',
          'hijri_month_Sha\'aban': 'Chaabane',
          'hijri_month_Ramadan': 'Ramadan',
          'hijri_month_Shawwal': 'Chawwal',
          'hijri_month_Dhu al-Qi\'dah': 'Dhou al-Qida',
          'hijri_month_Dhu al-Hijjah': 'Dhou al-Hijja',

          // Statistics Page
          'activity_statistics': 'Statistiques d\'Activité',
          'reading_distribution': 'Distribution des Lectures',
          'overall_progress': 'Progrès Global',
          'daily_progress': 'Progrès Quotidien',
          'daily_goal': 'objectif quotidien',
          'spiritual_journey': 'Statistiques de votre parcours spirituel',
          'total_items_read': 'Total des Éléments Lus',
          'from_daily_goal': 'de l\'objectif quotidien',
          'no_data': 'Aucune donnée disponible',
          'of': 'de',
          'duaa': 'Duaa',
          'qoran': 'Coran',
          'dikr': 'Dikr',
        },
      };
}
