import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'Buy Now': 'شراء الان',
          'Add to card': 'اضافة الى السلة',
          'Product Info': 'خصائص المنتج',
          'View All': 'عرض الكل',
          'Home': 'الرئيسية',
          'Settings': 'الاعدادات',
          'Profile': 'الشخصية',
          'Favorate': 'المفضلة',
          'Search': 'بحث',
          'Categories': 'الاقسام',
          'Choose Language': 'اختر اللغة',
          'Arabic': 'عربية',
          'English': 'انجليزية',
          'continue': 'استمر',
          //Onboarding Titles
          TranslationsValue.onboardingTitle1.key:
              TranslationsValue.onboardingTitle1.arabicText,
          'onboarding_title2': 'دفع سهل وآمن',
          'onboarding_title3': 'ايصال المنتج',
          //onboarding Subtitles
          'onboarding_subtitle1':
              'ابحث عن منتجاتك المفضلة التي ترغب\n في شرائها بسهولة',
          'onboarding_subtitle2':
              'ادفع ثمن المنتجات التي تشتريها\n بأمان وسهولة',
          'onboarding_subtitle3':
              'يتم تسليم المنتج الخاص بك إلى \nمنزلك بأمان وأمان',
        },
        'en': {
          'Buy Now': 'Buy Now',
          'Add to card': 'Add to card',
          'Product Info': 'Product Info',
          'View All': 'View all',
          'Home': 'Home',
          'Settings': 'Settings',
          'Profile': 'Profile',
          'Favorate': 'Favorate',
          'Search': 'Search',
          'Categories': 'Categories',
          'Choose Language': 'Choose Language',
          'Arabic': 'Arabic',
          'English': 'English',
          'continue': 'Continue',
          //Onboarding Titles
          TranslationsValue.onboardingTitle1.key:
              TranslationsValue.onboardingTitle1.englishText,
          'onboarding_title2': 'Easy and Safe Payment',
          'onboarding_title3': 'Product Delivery',
          //onboarding Subtitles
          'onboarding_subtitle1':
              'find your fovorite products that you want to\nbuy easily',
          'onboarding_subtitle2':
              'pay for the products you buy safely and\neasily',
          'onboarding_subtitle3':
              'Your product is delivered to your home\nsafely and securely',
        }
      };
}

class TranslationTexts {
  final String key;
  final String englishText;
  final String arabicText;

  TranslationTexts(
      {required this.key, required this.englishText, required this.arabicText});
}

class TranslationsValue {
  static final onboardingTitle1 = TranslationTexts(
      key: 'onboarding_title1',
      englishText: 'Find Favorite Items',
      arabicText: 'البحث عن العناصر المفضلة');
}
