import '../../../common/constant/app_imports.dart';
import '../../../core/models/language/language_model.dart';
import '../controllers/home_controller.dart';

class LanguageDropdownWidget extends  GetView<HomeController>  {
  const LanguageDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomDropdown<LanguageModel>(
      valueListenable: controller.selectedLanguage,
      items: controller.supportedLanguages,
      hint: 'Language',
      label: (LanguageModel lang) => lang.name,
      leadingIcon: Icons.language, // Adds a nice globe icon
      dropdownWidth: 130, // Adjust width as needed
      onChanged: (LanguageModel? newValue) {
        controller.changeLanguage(newValue);
      },
    );
  }
}