import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap Gaurav Kendra'**
  String get appTitle;

  /// No description provided for @subtitle.
  ///
  /// In en, this message translates to:
  /// **'A Tribute to the Braveheart of Udaipur'**
  String get subtitle;

  /// No description provided for @chooseYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Language'**
  String get chooseYourLanguage;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @bookTicket.
  ///
  /// In en, this message translates to:
  /// **'Book Ticket'**
  String get bookTicket;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @facilities.
  ///
  /// In en, this message translates to:
  /// **'Facilities'**
  String get facilities;

  /// No description provided for @historyOfPratap.
  ///
  /// In en, this message translates to:
  /// **'History Of Maharana Pratap'**
  String get historyOfPratap;

  /// No description provided for @bhaktiDhamVisit.
  ///
  /// In en, this message translates to:
  /// **'Bhakti Dham Visit'**
  String get bhaktiDhamVisit;

  /// No description provided for @variousShows.
  ///
  /// In en, this message translates to:
  /// **'Various Shows'**
  String get variousShows;

  /// No description provided for @events.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get events;

  /// No description provided for @media.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get media;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @statueOfPride.
  ///
  /// In en, this message translates to:
  /// **'Statue Of Pride'**
  String get statueOfPride;

  /// No description provided for @majorAttractions.
  ///
  /// In en, this message translates to:
  /// **'Major Attractions'**
  String get majorAttractions;

  /// No description provided for @ourTeam.
  ///
  /// In en, this message translates to:
  /// **'Our Team'**
  String get ourTeam;

  /// No description provided for @testimonials.
  ///
  /// In en, this message translates to:
  /// **'What People Say About Us'**
  String get testimonials;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Where History Speaks and Hearts are Inspired !'**
  String get tagline;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Tiger Hills, Manoharpura, Near Badgoan, Udaipur'**
  String get address;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// No description provided for @downloadCertificate.
  ///
  /// In en, this message translates to:
  /// **'Download Certificate'**
  String get downloadCertificate;

  /// No description provided for @aboutPgkDescription.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra, also known as the National Pilgrimage, houses statues depicting qualities like bravery, sacrifice, and valor. It narrates the tales of valor and bravery of Mewar and Maharana Pratap through visual displays, exhibits, and audio-visual presentations. Visitors can witness various paintings, mechanical structures, and audio-visual displays that evoke a sense of pride.'**
  String get aboutPgkDescription;

  /// No description provided for @statueOfPrideDescription.
  ///
  /// In en, this message translates to:
  /// **'A 57 feet tall statue of Maharana Pratap in the renunciant posture is installed on a mountain in the Pratap Gaurav Center. The statue is crafted from eight metals and is a masterpiece by renowned sculptors. The statue weighs approximately 4 tons and depicts Maharana Pratap in a regal pose, showcasing his valor and warrior spirit.'**
  String get statueOfPrideDescription;

  /// No description provided for @majorAttractionsDescription.
  ///
  /// In en, this message translates to:
  /// **'Bharat Mata Mandir, Bharat Darshan Dirgha, Art Galleries of Maharana Pratap painting, Mechanised Galleries, Water pond, cloak room, 57 feet statue of Maharana Pratap, Marvellous statue of Swamibhakt Chetak, Meera Bai and Documentary film on Mewar history. Cafeteria, market, drinking water, and parking are also available.'**
  String get majorAttractionsDescription;

  /// No description provided for @historyOfPratapDescription.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap, the lover of freedom, saintly king, may succeed in instilling patriotism in us and may inspire us to exert for the protection of Dharma, culture and society. From the womb of queen Jayavanti Devi, Pratap was born on May 9, 1540 (Jyestha Shukla 3, V.S. 1597).'**
  String get historyOfPratapDescription;

  /// No description provided for @haldighatiEventTitle.
  ///
  /// In en, this message translates to:
  /// **'HaldiGhati Vijay 450 Years Celebration'**
  String get haldighatiEventTitle;

  /// No description provided for @haldighatiEventDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the grand celebration organized on the completion of 450 years of Haldighati victory of Veer Shiromani Maharana Pratap.'**
  String get haldighatiEventDescription;

  /// No description provided for @eventDate.
  ///
  /// In en, this message translates to:
  /// **'17 June 2026'**
  String get eventDate;

  /// No description provided for @eventVenue.
  ///
  /// In en, this message translates to:
  /// **'Gandhi Ground, Udaipur'**
  String get eventVenue;

  /// No description provided for @popularActivities.
  ///
  /// In en, this message translates to:
  /// **'Popular Activities'**
  String get popularActivities;

  /// No description provided for @tentCamping.
  ///
  /// In en, this message translates to:
  /// **'Tent camping'**
  String get tentCamping;

  /// No description provided for @adventureTravel.
  ///
  /// In en, this message translates to:
  /// **'Adventure travel'**
  String get adventureTravel;

  /// No description provided for @mountainBiking.
  ///
  /// In en, this message translates to:
  /// **'Mountain biking'**
  String get mountainBiking;

  /// No description provided for @swimmingFishing.
  ///
  /// In en, this message translates to:
  /// **'Fishing & swimming'**
  String get swimmingFishing;

  /// No description provided for @gymYoga.
  ///
  /// In en, this message translates to:
  /// **'GYM and Yoga'**
  String get gymYoga;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'gu', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
