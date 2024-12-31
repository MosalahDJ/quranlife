import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // Login Page
          'quran_life': 'Quran Life',
          'email': 'Email',
          'enter_email': 'Enter your email address',
          'password': 'Password',
          'enter_password': 'Enter your password',
          'forgot_password': 'Forgot password?',
          'login': 'Login',
          'or_login_with': 'Or Login with',
          'no_account': 'Don\'t have an account?',
          'sign_in': 'Sign in',
          'please_enter_email': 'Please enter your email',
          'please_enter_password': 'Please enter your password',
          'leave_login': 'Do you want to leave the login process?',

          // Sign Up Page
          'create_account': 'Create Your Account',
          'fill_form': 'Please fill in the form below',
          'first_name': 'First Name',
          'last_name': 'Last Name',
          'enter_first_name': 'Enter your first name',
          'enter_last_name': 'Enter your last name',
          'gender': 'Gender',
          'select_gender': 'Select your gender',
          'male': 'Male',
          'female': 'Female',
          'confirm_password': 'Confirm Password',
          'enter_confirm_password': 'Enter your password again',
          'create_account_button': 'Create Account',
          'leave_registration':
              'Do you want to leave the registration process?',
          'registration': 'Registration',

          // Validation Messages
          'field_required': 'required',
          'valid_email': 'Please enter a valid email address',
          'password_length': 'Password must be at least 6 characters',
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
          'profile': 'Profile',
          'hey_user': 'Hey, User',
          'search': 'Search',
          'logout': 'Logout',

          // Prayer Times Page
          'prayer_times': 'Prayer Times',
          'mawaqit': 'Timings',
          'prayer_board': 'Prayer Board',
          'next_prayer': 'Next Prayer: ',
          'time_remaining': 'Time Remaining: ',
          'get_new_data': 'Get New Data',
          'get_location_desc':
              'Get current location and request new data from the server.\nThis may take a few minutes.',
          'connection_failed': 'Connection failed',
          'check_internet': 'Please check your internet connection then retry',

          // Prayer Names
          'fajr': 'Fajr',
          'sunrise': 'Sunrise',
          'dhuhr': 'Dhuhr',
          'asr': 'Asr',
          'maghrib': 'Maghrib',
          'isha': 'Isha',

          // Home Page
          'refresh_prayer_times': 'Pull to refresh prayer times',
          'nearest_mosque': 'Nearest Mosque',
          'daily_wird': 'Daily Wird',
          'quranlife': 'QuranLife',
          'category': 'Category',

          // Home Page Categories
          'prayer_info': 'Prayer Info',
          'mosque_finder': 'Mosque Finder',
          'qibla_direction': 'Qibla Direction',
          'islamic_calendar': 'Islamic Calendar',

          // Quran Page
          'holy_quran': 'The Holy Qur\'an',
          'surah': 'Surah',
          'juz': 'Juz\'',
          'verse': 'Verse',
          'surah_name': 'Surah Name',
          'search_verses': 'Search verses...',
          'mosque_finder_desc':
              'Are you new here?\nLooking for a mosque?\nDon\'t worry, we\'ll help you find the nearest mosque.',
          'find_mosque': 'Find Mosque',
          'profile_name': 'Mohamed salah',
          'profile_email': 'mohamedsalah@gmail.com',
        },
        'ar': {
          // Login Page
          'quran_life': 'حياة القرآن',
          'email': 'البريد الإلكتروني',
          'enter_email': 'أدخل بريدك الإلكتروني',
          'password': 'كلمة المرور',
          'enter_password': 'أدخل كلمة المرور',
          'forgot_password': 'نسيت كلمة المرور؟',
          'login': 'تسجيل الدخول',
          'or_login_with': 'أو سجل الدخول باستخدام',
          'no_account': 'ليس لديك حساب؟',
          'sign_in': 'إنشاء حساب',
          'please_enter_email': 'الرجاء إدخال البريد الإلكتروني',
          'please_enter_password': 'الرجاء إدخال كلمة المرور',
          'leave_login': 'هل تريد مغادرة عملية تسجيل الدخول؟',

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
          'welcome_title': 'مرحباً بك في حياة القرآن',
          'welcome_subtitle':
              'رفيقك الإسلامي اليومي لتقوية إيمانك وممارسة تعاليم القرآن في حياتك اليومية.',
          'prayer_times_title': 'مواقيت الصلاة والتذكير',
          'prayer_times_subtitle':
              'يذكرك تطبيق حياة القرآن بأوقات الصلاة ويزودك بالأذكار والأدعية، لضمان أداء واجباتك الدينية في وقتها.',
          'for_muslim_title': 'لكل مسلم',
          'for_muslim_subtitle':
              'يدعم تطبيق حياة القرآن جميع المؤمنين في الحفاظ على صلواتهم، ويوفر التوجيه والأدعية المناسبة لكل مناسبة.',
          'community_title': 'المجتمع الإسلامي',
          'community_subtitle':
              'يساعدك تطبيق حياة القرآن في العثور على المساجد القريبة ويربطك بإخوانك وأخواتك في الإيمان.',

          // Home Page Navigation
          'home': 'الرئيسية',
          'adkar': 'أذكار',
          'quran': 'القرآن',
          'profile': 'الملف الشخصي',
          'hey_user': 'مرحباً',
          'search': 'بحث',
          'logout': 'تسجيل خروج',

          // Prayer Times Page
          'prayer_times': 'مواقيت الصلاة',
          'mawaqit': 'مواقيت',
          'prayer_board': 'لوحة الصلوات',
          'next_prayer': 'الصلاة القادمة: ',
          'time_remaining': 'الوقت المتبقي: ',
          'get_new_data': 'تحديث البيانات',
          'get_location_desc':
              'الحصول على الموقع الحالي وطلب بيانات جديدة من الخادم.\nقد يستغرق هذا بضع دقائق.',
          'connection_failed': 'فشل الاتصال',
          'check_internet': 'يرجى التحقق من اتصال الإنترنت ثم إعادة المحاولة',

          // Arabic Prayer Names
          'fajr': 'الفجر',
          'sunrise': 'الشروق',
          'dhuhr': 'الظهر',
          'asr': 'العصر',
          'maghrib': 'المغرب',
          'isha': 'العشاء',

          // Home Page
          'refresh_prayer_times': 'اسحب لتحديث أوقات الصلاة',
          'nearest_mosque': 'أقرب مسجد اليك',
          'daily_wird': 'الورد اليومي',
          'quranlife': 'حياة القرآن',
          'category': 'أقسام',

          // Home Page Categories
          'prayer_info': 'معلومات الصلاة',
          'mosque_finder': 'البحث عن المساجد',
          'qibla_direction': 'اتجاه القبلة',
          'islamic_calendar': 'التقويم الهجري',

          // Quran Page
          'holy_quran': 'القرآن الكريم',
          'surah': 'سورة',
          'juz': 'جزء',
          'verse': 'آية',
          'surah_name': 'اسم السورة',
          'search_verses': 'بحث في الآيات...',
          'mosque_finder_desc':
              'هل أنت جديد هنا؟\nتبحث عن مسجد؟\nلا تقلق، سنساعدك في العثور على أقرب مسجد.',
          'find_mosque': 'ابحث عن مسجد',
          'profile_name': 'محمد صلاح',
          'profile_email': 'mohamedsalah@gmail.com',
        },
        'fr': {
          // Login Page
          'quran_life': 'Vie du Coran',
          'email': 'E-mail',
          'enter_email': 'Entrez votre adresse e-mail',
          'password': 'Mot de passe',
          'enter_password': 'Entrez votre mot de passe',
          'forgot_password': 'Mot de passe oublié?',
          'login': 'Connexion',
          'or_login_with': 'Ou connectez-vous avec',
          'no_account': 'Vous n\'avez pas de compte?',
          'sign_in': 'S\'inscrire',
          'please_enter_email': 'Veuillez entrer votre e-mail',
          'please_enter_password': 'Veuillez entrer votre mot de passe',
          'leave_login': 'Voulez-vous quitter le processus de connexion?',

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
          'profile': 'Profil',
          'hey_user': 'Bonjour',
          'search': 'Rechercher',
          'logout': 'Déconnexion',

          // Prayer Times Page
          'prayer_times': 'Heures de Prière',
          'mawaqit': 'Horaires',
          'prayer_board': 'Tableau des Prières',
          'next_prayer': 'Prochaine Prière: ',
          'time_remaining': 'Temps Restant: ',
          'get_new_data': 'Mettre à jour',
          'get_location_desc':
              'Obtenir la position actuelle et demander de nouvelles données du serveur.\nCela peut prendre quelques minutes.',
          'connection_failed': 'Échec de connexion',
          'check_internet':
              'Veuillez vérifier votre connexion Internet puis réessayer',

          // Prayer Names (Keep English versions for internal use)
          'fajr': 'Fajr',
          'sunrise': 'lever du soleil',
          'dhuhr': 'Dhuhr',
          'asr': 'Asr',
          'maghrib': 'Maghrib',
          'isha': 'Isha',

          // Home Page
          'refresh_prayer_times': 'Tirez pour actualiser les heures de prière',
          'nearest_mosque': 'Mosquée la plus proche',
          'daily_wird': 'Wird Quotidien',
          'quranlife': 'Vie du Coran',
          'category': 'Catégories',

          // Home Page Categories
          'prayer_info': 'Info Prière',
          'mosque_finder': 'Chercheur de Mosquée',
          'qibla_direction': 'Direction Qibla',
          'islamic_calendar': 'Calendrier Islamique',

          // Quran Page
          'holy_quran': 'Le Saint Coran',
          'surah': 'Sourate',
          'juz': 'Juz\'',
          'verse': 'Verset',
          'surah_name': 'Nom de la Sourate',
          'search_verses': 'Rechercher des versets...',
          'mosque_finder_desc':
              'Vous êtes nouveau ici?\nVous cherchez une mosquée?\nNe vous inquiétez pas, nous vous aiderons à trouver la mosquée la plus proche.',
          'find_mosque': 'Trouver une Mosquée',
          'profile_name': 'Mohamed salah',
          'profile_email': 'mohamedsalah@gmail.com',
        },
      };
}



//make every text apeare on UI of these pages localizeable