import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'Choose Language': 'اختر اللغة',
          'Arabic': 'عربية',
          'English': 'انجليزية'
        },
        'en': {
          'Choose Language': 'Choose Language',
          'Arabic': 'Arabic',
          'English': 'English'
        }
      };
}
