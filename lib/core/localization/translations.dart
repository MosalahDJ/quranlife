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
          'search': 'Search',
          'logout': 'Logout',

          //category items
          "teaching_prayer": "Teaching Prayer",
          "wudu_ghusl": "Wudu And Ghusl",
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
          'zakat': 'Zakat',

          // Prayer Times
          'prayer_times': 'Prayer Times',
          'mawaqit': 'Schedule',
          'prayer_board': 'Prayer Board',
          'next_prayer': 'Next Prayer: ',
          'time_remaining': 'Time Remaining: ',
          'get_new_data': 'Update Prayer Times',
          'get_location_desc':
              'Updating location and prayer times...\nThis may take a moment.',
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
          'quran_wird': '   Quran Wird',
          'hadith_wird': '   Hadith Wird',
          'allah_names': '   Allah Names',

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
          'adhkar_notifications': 'Daily Remembrance Notifications',
          'quran_notifications': 'Quran Reading Reminders',

          // Languages
          'arabic': 'Arabic',
          'english': 'English',
          'french': 'French',

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
          'search': 'بحث',
          'logout': 'تسجيل خروج',
          //category items
          "teaching_prayer": "تعليم الصلاة",
          "wudu_ghusl": "الوضوء والغسل",
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
          'zakat': 'الزكاة',

          // Prayer Times
          'prayer_times': 'مواقيت الصلاة',
          'mawaqit': 'الصلوات',
          'prayer_board': 'لوحة الصلوات',
          'next_prayer': 'الصلاة القادمة: ',
          'time_remaining': 'الوقت المتبقي: ',
          'get_new_data': 'تحديث مواقيت الصلاة',
          'get_location_desc':
              'جاري تحديث الموقع ومواقيت الصلاة...\nيرجى الانتظار.',
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

          // Home Page
          'refresh_prayer_times': 'اسحب لتحديث أوقات الصلاة',
          'search_for_a_mosque': 'البحث عن مسجد',
          'daily_wird': 'الورد اليومي',
          'quranlife': 'قرآن لايف',
          'category': 'أقسام',
          'quran_wird': 'ورد القرآن   ',
          'hadith_wird': 'ورد الحديث   ',
          'allah_names': 'أسماء الله   ',

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
          'profile_name': 'محمد صلاح',
          'profile_email': 'mohamedsalah@gmail.com',

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

          // Languages
          'arabic': 'العربية',
          'english': 'الإنجليزية',
          'french': 'الفرنسية',

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
          'search': 'Rechercher',
          'logout': 'Déconnexion',

          //category items
          "teaching_prayer": "Apprentissage de la Prière",
          "wudu_ghusl": "Wudu et Ghusl",
          "qibla_direction": "Direction de la Qibla",
          "electronic_tasbih": "Tasbih Électronique",
          "friday_sunnahs": "Sounnahs du Vendredi",
          "al-arba'in_nawawiyyah": "Al-Arba'in Nawawiyyah",
          "tasbih": "Glorification d'Allah",
          "al-Hamd": "Louange",
          "istighfar": "Demande de Pardon",
          "islamic_ruqyah": "Ruqyah Islamique",
          "quranic_supplications": "Invocations Coraniques",
          "prophets_supplications": "Invocations des Prophètes",
          "asma_ul-husna": "Noms d'Allah",
          "community": "Communauté",
          "ai_bot": "AI Bot",
          "statistics": "Statistiques",
          'islamic_calendar': 'Calendrier Islamique',
          'hajj_umrah': 'Hajj et Omra',
          'zakat': 'Zakat',

          // Prayer Times
          'prayer_times': 'Horaires des prières',
          'mawaqit': 'prières',
          'prayer_board': 'Tableau des prières',
          'next_prayer': 'Prochaine prière : ',
          'time_remaining': 'Temps restant : ',
          'get_new_data': 'Mettre à jour les horaires',
          'get_location_desc':
              'Mise à jour de la localisation et des horaires de prière...\nVeuillez patienter.',
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

          'Fajr': 'Fajr',
          'Sunrise': 'lv du soleil',
          'Dhuhr': 'Dhuhr',
          'Asr': 'Asr',
          'Maghrib': 'Maghrib',
          'Isha': 'Isha',

          // Home Page
          'refresh_prayer_times': 'Tirez pour actualiser les heures de prière',
          'search_for_a_mosque': 'Recherche d’une mosquée',
          'daily_wird': 'Wird Quotidien',
          'quranlife': 'QuranLife',
          'category': 'Catégories',
          'quran_wird': '   Wird du Coran',
          'hadith_wird': '   Wird du Hadith',
          'allah_names': '   Noms d\'Allah',

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
          'profile_name': 'Mohamed salah',
          'profile_email': 'mohamedsalah@gmail.com',

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
          'adhkar_notifications': 'Notifications des invocations quotidiennes',
          'quran_notifications': 'Rappels de lecture du Coran',

          // Languages
          'arabic': 'arabe',
          'english': 'anglais',
          'french': 'français',

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
        },
      };
}
