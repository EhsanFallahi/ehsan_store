import 'package:ehsan_store/data_source/model/lang/Language.dart';
import 'package:ehsan_store/data_source/repository/lang/LanguageRepository.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  LanguageRepository _languageRepository = LanguageRepository();
  List<dynamic> _language = [].obs;
  var tempLanguage = List<Language>().obs;

  @override
  void onInit() {
    _getLanguage();
    print('temp lang:${tempLanguage.toString()}');
    super.onInit();
  }

  void updateLanguage(Language language) async {
    await _updateLanguage(language);
  }

  Future _updateLanguage(Language language) async {
    try {
      await _languageRepository.updateLanguage(language);
    } catch (error) {
      print('network error:$error');
    }
  }

  void _getLanguage() {
    try {
      _languageRepository.getLanguage().then((response) {
        _language.add(response.data);
        print('temp lang on get');
        Language _tempLanguage = Language();
        _tempLanguage.fromJson(_language);
        tempLanguage.add(_tempLanguage);
      });
    } catch (error) {
      print('network error:$error');
    }
  }
}
