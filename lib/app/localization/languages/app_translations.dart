import 'package:get/get.dart';

import '../ar_ar.dart';
import '../en_us.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': arAR, 'en': enUS};
}
