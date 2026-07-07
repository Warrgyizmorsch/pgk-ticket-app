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

  /// No description provided for @legacyTitle.
  ///
  /// In en, this message translates to:
  /// **'A Legacy of Courage and Resilience'**
  String get legacyTitle;

  /// No description provided for @historyIntroP1.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap history is a story of courage, resilience, and unwavering patriotism. He was a valiant Rajput ruler of Mewar who refused to bow to the Mughal empire. Known for his indomitable spirit, he dedicated his life to protecting his kingdom and upholding Rajput honor. Maharana Pratap history is marked by his relentless struggle against Emperor Akbar and his strategic warfare tactics, making him a legendary figure in Indian history.'**
  String get historyIntroP1;

  /// No description provided for @historyIntroP2.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap was the son of Maharana Udai Singh of the Sisodiya clan of Rajputs, the rulers of Mewar. Pratap became the ruler of Mewar against his father’s wish, who had appointed his favourite son Jagmal as his successor. However, the senior nobles of Mewar decided that Pratap, the first son and rightful successor should be crowned king. Moreover, Maharana Pratap was said to be a man of strong Rajput character, he was far more brave and chivalrous. His kind heartedness and just decision making won the hearts of even his enemies. He is the only ruler of India that did not give in to the Mughal rule, and for that he is the most celebrated ruler of the country to this day.'**
  String get historyIntroP2;

  /// No description provided for @historyIntroP3.
  ///
  /// In en, this message translates to:
  /// **'After the famous battle of Haldighati, Maharana Pratap’s own brother, Shakti Singh, who had joined the Mughals helped him escape the battlefield, as his beloved and trusted horse Chetak was wounded in his hind leg and Jhala Man a noble was wearing the Maharana’s crown as decoy. Chetak, Maharana Pratap’s trusted horse, delivered him to safe grounds before breathing his last. Pratap had to take refuge in the Aravalli hills. The Bhil tribals of the Aravallis supported Maharana during times of war, and helped him in living off the forests during times of peace. In exile, Pratap spent considerable time perfecting war tactics like guerilla warfare, harassing the enemy and light horse tactics which helped him win back Mewar.'**
  String get historyIntroP3;

  /// No description provided for @historyIntroP4.
  ///
  /// In en, this message translates to:
  /// **'Col. Tod, the famous British antiquarian, gave Pratap the title of ‘Leonidas of Rajasthan’. In one of his writings on Pratap, Tod mentioned that, “There is not a pass in the Alpine Aravalli that is not sanctified by some deed of Maharana Pratap – some brilliant victory, or oftener, more glorious defeat.” It is believed that during his exile, Maharana Pratap, was at breaking point. A Rajput poet and warrior, Prithiraj of Bikaner who was at Akbar’s court sent a letter to the Maharana giving him strength, and steered him to carry on his war efforts.'**
  String get historyIntroP4;

  /// No description provided for @historyIntroP5.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap history stands as a timeless testament to courage, honor, and unwavering dedication to one’s land and values. For visitors to Pratap Gaurav Kendra, this legacy serves as a powerful reminder of the strength found in integrity and leadership. Whether you’re a business leader, entrepreneur, or history enthusiast, the life of Maharana Pratap offers lessons that transcend centuries.'**
  String get historyIntroP5;

  /// No description provided for @challengesTitle.
  ///
  /// In en, this message translates to:
  /// **'What Challenges Did Maharana Pratap Face During His Reign?'**
  String get challengesTitle;

  /// No description provided for @nobleLineageTitle.
  ///
  /// In en, this message translates to:
  /// **'A Just Ruler with a Noble Lineage'**
  String get nobleLineageTitle;

  /// No description provided for @nobleLineageDesc.
  ///
  /// In en, this message translates to:
  /// **'Born into the Sisodiya clan of Rajputs, Maharana Pratap was the eldest son of Maharana Udai Singh II of Mewar. Though his father chose Jagmal as his successor, the nobles of Mewar stood by tradition and crowned Pratap as the rightful ruler. His leadership was rooted in fairness, honor, and an unwavering sense of responsibility towards his kingdom.\n\nMaharana Pratap is celebrated not only for his military strategies but also for his humility, empathy, and high moral standards — qualities that gained him the respect of even his enemies.'**
  String get nobleLineageDesc;

  /// No description provided for @refusalMughalTitle.
  ///
  /// In en, this message translates to:
  /// **'Refusal to Submit to Mughal Rule'**
  String get refusalMughalTitle;

  /// No description provided for @refusalMughalDesc.
  ///
  /// In en, this message translates to:
  /// **'In an era when many Rajput rulers allied with the Mughal Empire, Pratap remained steadfast in his decision to resist. His refusal to accept Mughal sovereignty, even under pressure from Emperor Akbar, made him a unique figure in Maharana Pratap history and earned him a special place in Indian heritage.\n\nHis dedication to preserving the independence of Mewar was more than a political stance — it was a personal vow to protect Rajput pride and culture.\n\nOne of the most iconic places to experience the valor of Mewar is the Maharana Pratap Memorial Udaipur, a must-visit for history lovers.'**
  String get refusalMughalDesc;

  /// No description provided for @haldighatiTitle.
  ///
  /// In en, this message translates to:
  /// **'The Battle of Haldighati: A Turning Point'**
  String get haldighatiTitle;

  /// No description provided for @haldighatiDesc.
  ///
  /// In en, this message translates to:
  /// **'In 1576, the famous Battle of Haldighati took place between Maharana Pratap and Mughal forces led by Man Singh. Though the battle was indecisive, it became symbolic of Rajput valor. Pratap’s brave steed, Chetak, carried him to safety despite severe injuries. His loyal warrior Jhala Maan sacrificed his life by wearing the Maharana’s crown to mislead enemies.\n\nAfter this fierce encounter, Pratap took refuge in the Aravalli hills, choosing hardship over surrender — a decision that deeply inspires those who visit Pratap Gaurav Kendra to this day.'**
  String get haldighatiDesc;

  /// No description provided for @guerrillaTitle.
  ///
  /// In en, this message translates to:
  /// **'Guerrilla Warfare and Strategic Wisdom'**
  String get guerrillaTitle;

  /// No description provided for @guerrillaDesc.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap adapted to new conditions with skill and creativity. Supported by the local Bhil community, he utilized guerrilla warfare, night raids, and swift cavalry tactics to keep the Mughal forces unsettled. His understanding of the terrain, combined with relentless spirit, helped him reclaim key parts of Mewar.\n\nThis strategic resilience reflects the essence of Maharana Pratap history in Hindi and regional folklore, where he is remembered as both a warrior and a wise protector of his people.'**
  String get guerrillaDesc;

  /// No description provided for @faqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions (FAQs)'**
  String get faqTitle;

  /// No description provided for @faqQ1.
  ///
  /// In en, this message translates to:
  /// **'Why is Maharana Pratap history so important?'**
  String get faqQ1;

  /// No description provided for @faqA1.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap history is a symbol of bravery, resistance, and self-respect. His unyielding spirit against Mughal domination and commitment to the Rajput code of honor have made him one of India’s most revered historical figures.'**
  String get faqA1;

  /// No description provided for @faqQ2.
  ///
  /// In en, this message translates to:
  /// **'Where can I explore Maharana Pratap history in Hindi?'**
  String get faqQ2;

  /// No description provided for @faqA2.
  ///
  /// In en, this message translates to:
  /// **'You can explore Maharana Pratap history in Hindi at Pratap Gaurav Kendra Udaipur, where exhibits, visuals, and narrations bring his legacy to life in both Hindi and English for all visitors.'**
  String get faqA2;

  /// No description provided for @faqQ3.
  ///
  /// In en, this message translates to:
  /// **'What happened in the Battle of Haldighati?'**
  String get faqQ3;

  /// No description provided for @faqA3.
  ///
  /// In en, this message translates to:
  /// **'The Battle of Haldighati in 1576 was a fierce conflict between Maharana Pratap and the Mughal army. Though inconclusive, it highlighted Pratap’s courage and tactics. His horse Chetak and loyal warrior Jhala Maan played heroic roles in ensuring his escape.'**
  String get faqA3;

  /// No description provided for @faqQ4.
  ///
  /// In en, this message translates to:
  /// **'How did Maharana Pratap continue his fight after defeat?'**
  String get faqQ4;

  /// No description provided for @faqA4.
  ///
  /// In en, this message translates to:
  /// **'Even after setbacks, Maharana Pratap reorganized his army and used guerrilla tactics to reclaim lost territories. His resilience and innovation made him one of the greatest military minds in Indian history.'**
  String get faqA4;

  /// No description provided for @faqQ5.
  ///
  /// In en, this message translates to:
  /// **'Why should business leaders and professionals learn about Maharana Pratap?'**
  String get faqQ5;

  /// No description provided for @faqA5.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap’s life teaches us to lead with integrity, stand by our values, and adapt to challenges with strategic thinking — lessons that resonate deeply with today’s entrepreneurs and decision-makers.'**
  String get faqA5;

  /// No description provided for @historyFooter.
  ///
  /// In en, this message translates to:
  /// **'At Pratap Gaurav Kendra Udaipur, Maharana Pratap’s legacy is preserved not just through historical artifacts but through immersive storytelling that connects the past with the present. His life is a source of inspiration — showing that even in the face of overwhelming odds, a true leader stands tall.\n\nVisit Pratap Gaurav Kendra to walk through the inspiring journey of a hero whose name still echoes in the hills of Mewar and the hearts of millions.'**
  String get historyFooter;

  /// No description provided for @museumDashboard.
  ///
  /// In en, this message translates to:
  /// **'Museum Dashboard'**
  String get museumDashboard;

  /// No description provided for @welcomeBannerText.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Pratap Gaurav Kendra. Explore\nthe Legacy of Maharana Pratap.'**
  String get welcomeBannerText;

  /// No description provided for @bhaktiDham.
  ///
  /// In en, this message translates to:
  /// **'Bhakti Dham'**
  String get bhaktiDham;

  /// No description provided for @waterLaserShow.
  ///
  /// In en, this message translates to:
  /// **'Water Laser Show'**
  String get waterLaserShow;

  /// No description provided for @vijayStambh.
  ///
  /// In en, this message translates to:
  /// **'Vijay Stambh'**
  String get vijayStambh;

  /// No description provided for @museumNews.
  ///
  /// In en, this message translates to:
  /// **'Museum News'**
  String get museumNews;

  /// No description provided for @newsLightSoundShow.
  ///
  /// In en, this message translates to:
  /// **'New Light & Sound Show\nLaunch'**
  String get newsLightSoundShow;

  /// No description provided for @newsSpecialExhibition.
  ///
  /// In en, this message translates to:
  /// **'Special Exhibition on\nHaldighati'**
  String get newsSpecialExhibition;

  /// No description provided for @eventPratapJayanti.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap Jayanti\nCelebration - May 9th'**
  String get eventPratapJayanti;

  /// No description provided for @eventKidsWorkshop.
  ///
  /// In en, this message translates to:
  /// **'Weekend Workshop for\nKids'**
  String get eventKidsWorkshop;

  /// No description provided for @aboutPratapGauravKendra.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra, also known as the National Pilgrimage, houses statues depicting qualities like bravery, sacrifice, and valor, such as Mahimahendra, Yavadarya, Kulkamal Divakar, Ravikul Bhushan, Maharaja Adhiraj, Raj Rajeshwar, Shri Ekalinagnath Devan, Hindu Suraj, and Maharana Shri Pratap Singh, narrating the tales of valor and bravery of Mewar and Maharana Pratap through visual displays, exhibits, and audio-visual presentations. The center serves as a means to convey the glory of Mewar and the saga of Maharana Pratap to the masses. Visitors can witness various paintings, mechanical structures, and audio-visual displays that evoke a sense of pride. The museum provides free guides to help visitors understand and view the entire collection.'**
  String get aboutPratapGauravKendra;

  /// No description provided for @pratapGauravKendra.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra'**
  String get pratapGauravKendra;

  /// No description provided for @aboutPgkTitle.
  ///
  /// In en, this message translates to:
  /// **'About PGK'**
  String get aboutPgkTitle;

  /// No description provided for @pgkHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra:\nA National Tribute'**
  String get pgkHeroTitle;

  /// No description provided for @narrationIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Narration: Introduction to PGK'**
  String get narrationIntroTitle;

  /// No description provided for @completedText.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedText;

  /// No description provided for @whoWeAreHeader.
  ///
  /// In en, this message translates to:
  /// **'Who We Are'**
  String get whoWeAreHeader;

  /// No description provided for @pgkIntroP1.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra is a unique cultural and historical center located in the serene Aravalli hills of Udaipur. Dedicated to the great Rajput warrior Maharana Pratap, it is a tribute to his bravery, sacrifice, and leadership. The center offers visitors a deep insight into the glorious history of Mewar and showcases the legendary Battle of Haldighati through life-size sculptures, engaging audio-visual presentations, and interactive displays. For history lovers, students, and cultural travelers, this is undoubtedly the best tourist place in Udaipur to explore the roots of Rajputana pride.'**
  String get pgkIntroP1;

  /// No description provided for @pgkIntroP2.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra is one of the best tourist places in Udaipur, dedicated to the great Rajput warrior, Maharana Pratap. Located in the beautiful Aravalli hills, this center shares the history of Mewar through life-sized statues, interesting galleries, and audio-visual shows. Visitors can learn about the famous Battle of Haldighati and the bravery of Maharana Pratap.'**
  String get pgkIntroP2;

  /// No description provided for @pgkIntroP3.
  ///
  /// In en, this message translates to:
  /// **'As one of the famous tourist places in Udaipur, this center is perfect for history lovers and travelers. Its peaceful surroundings and well-designed exhibits make it an important stop in any Udaipur city tour places plan. Whether you want to learn about history or enjoy the beauty of Udaipur, Pratap Gaurav Kendra is a great place to visit.'**
  String get pgkIntroP3;

  /// No description provided for @majorAttractionsHeader.
  ///
  /// In en, this message translates to:
  /// **'Major Attractions'**
  String get majorAttractionsHeader;

  /// No description provided for @haldighatiBattleEpic.
  ///
  /// In en, this message translates to:
  /// **'Haldighati Battle\nEpic'**
  String get haldighatiBattleEpic;

  /// No description provided for @liveActionTheaters.
  ///
  /// In en, this message translates to:
  /// **'Live Action\nTheaters'**
  String get liveActionTheaters;

  /// No description provided for @historicalSculptures.
  ///
  /// In en, this message translates to:
  /// **'Historical\nSculptures'**
  String get historicalSculptures;

  /// No description provided for @epicTaleOfHaldighati.
  ///
  /// In en, this message translates to:
  /// **'The Epic Tale of Haldighati'**
  String get epicTaleOfHaldighati;

  /// No description provided for @epicTaleP1.
  ///
  /// In en, this message translates to:
  /// **'The saga of Haldighati Victory Battle begins with the Haldighati Victory Battle Epic. Here, through the medium of a model display, the Haldighati War is brought to life. The sculptures of the heroes and martyrs of Haldighati are showcased, along with scenes from the battle. The display prominently features the statues of Jhala Man, Purohit Jannath, Mahasani Jagnnath, Hakeem Khan Sur, Rana Punja, etc., presenting their valorous stories. The epic also highlights the special mention of Ram Prasad, the beloved elephant of Maharana Pratap. A scene depicting Maharana Pratap cutting off the head of Mughal commander Bahlool Khan in a single stroke is showcased, symbolizing the strategic brilliance and martial skill of Maharana Pratap. The courageous act of Jhala Man and Maharana Pratap’s striking a blow with a spear on Raja Man Singh while riding on his horse Chetak adds an interesting dimension to the display. The epic portrays the factual defeat of the powerful Mughal army by Maharana Pratap through his strategic and martial prowess in the Haldighati Victory Battle.'**
  String get epicTaleP1;

  /// No description provided for @exhibitHighlights.
  ///
  /// In en, this message translates to:
  /// **'Exhibit Highlights:'**
  String get exhibitHighlights;

  /// No description provided for @epicTaleP2.
  ///
  /// In en, this message translates to:
  /// **'One of the main highlights of Pratap Gaurav Kendra is the Haldighati Victory Battle Epic, a meticulously created display that narrates the events of the battle between Maharana Pratap and the Mughal army. The exhibit brings to life several heroes of the battlefield:'**
  String get epicTaleP2;

  /// No description provided for @exhibitBullet1.
  ///
  /// In en, this message translates to:
  /// **'Sculptures of Jhala Man, Purohit Jannath, Mahasani Jagannath, Rana Punja, and Hakeem Khan Sur are prominently displayed.'**
  String get exhibitBullet1;

  /// No description provided for @exhibitBullet2.
  ///
  /// In en, this message translates to:
  /// **'A powerful depiction of Maharana Pratap delivering a fatal blow to Mughal commander Bahlool Khan showcases his martial strength and courage.'**
  String get exhibitBullet2;

  /// No description provided for @exhibitBullet3.
  ///
  /// In en, this message translates to:
  /// **'The scene where Maharana Pratap strikes Raja Man Singh while riding his loyal horse Chetak adds a dramatic touch to the battle’s narration.'**
  String get exhibitBullet3;

  /// No description provided for @exhibitBullet4.
  ///
  /// In en, this message translates to:
  /// **'A special corner is dedicated to Ram Prasad, the Maharana’s elephant, emphasizing the deep bond between warriors and their animals.'**
  String get exhibitBullet4;

  /// No description provided for @epicTaleP3.
  ///
  /// In en, this message translates to:
  /// **'The combination of storytelling, visuals, and sculpture makes this center stand out among all famous tourist places in Udaipur.'**
  String get epicTaleP3;

  /// No description provided for @nationalTributeHeader.
  ///
  /// In en, this message translates to:
  /// **'Who We Are / A National Tribute'**
  String get nationalTributeHeader;

  /// No description provided for @nationalTributeP1.
  ///
  /// In en, this message translates to:
  /// **'The chief of the Rashtriya Swayamsevak Sangh (RSS), Mohan Bhagwat, along with the successful Prime Minister of India, Narendra Modi, and National Saint orator Murari Bapu, and Sadhvi Ritambhara have all visited the Pratap Gaurav Kendra, the “Rashtriya Tirth,” to see the National Tirth. In addition to them, the RSS General Secretary, Bhaiya Joshi, RSS Joint General Secretary Intellectual Head Sunil Bhai Mehta, RSS Joint General Secretary Ghumantu Karya Pramukh Durgadas, Indian government ministers Nitin Gadkari and Mahesh Sharma, and Vishwa Hindu Parishad’s two central ministers Jugal Kishor and Ajay Kumar Parihar, are also present. Prakash Chandra, the Minister of Organization of the Small Industries of Bharatiya Kisan Sangh, Gajendra Singh, the Minister of Bharatiya Janata Party’s National Secretary and Member of Parliament from Pauri Garhwal, Uttarakhand Chief Minister Teerath Singh Rawat, Indian government minister Arjun Ram Meghwal, Central Minister Pratap Chandra Sarangi, former Governor of Rajasthan Kalyan Singh, former Chief Minister Vasundhara Raje, former Deputy Chief Minister of Haryana Ram Vilas Sharma, Nand Kumar Singh, Member of Parliament from Khadwa, Madhya Pradesh, Bhagwant Khuba, Member of Parliament from Bidar, Karnataka, and Pushpendra Singh, Member of Parliament from Hamirpur, Uttar Pradesh, have also graced the occasion.'**
  String get nationalTributeP1;

  /// No description provided for @nationalTributeP2.
  ///
  /// In en, this message translates to:
  /// **'Blessings have been received from various saints, including Swami Narayan of the Swaminarayan Sanstha, Akshar Prem Swami from Abu Dhabi, Sadhu Yogi Premdas, and Mahatma Prem Muni from the Arya Vanprasth Ashram in Haridwar.'**
  String get nationalTributeP2;

  /// No description provided for @nationalTributeP3.
  ///
  /// In en, this message translates to:
  /// **'Recognized as a Rashtriya Tirth, the center has attracted national and spiritual leaders alike. Their visits strengthen Pratap Gaurav Kendra’s identity as both a place of historical learning and spiritual reflection.'**
  String get nationalTributeP3;

  /// No description provided for @perfectPlaceHeader.
  ///
  /// In en, this message translates to:
  /// **'A Perfect Place for All Kinds of Visitors'**
  String get perfectPlaceHeader;

  /// No description provided for @perfectPlaceP1.
  ///
  /// In en, this message translates to:
  /// **'Whether you’re part of a school group, a family exploring Rajasthan, or an international traveler seeking to understand Indian history, this center offers something for everyone:'**
  String get perfectPlaceP1;

  /// No description provided for @perfectPlaceBullet1.
  ///
  /// In en, this message translates to:
  /// **'Life-like Statues and dramatic storytelling that make the past come alive.'**
  String get perfectPlaceBullet1;

  /// No description provided for @perfectPlaceBullet2.
  ///
  /// In en, this message translates to:
  /// **'Audio-Visual Theaters that explain events of Mewar’s history in an engaging format.'**
  String get perfectPlaceBullet2;

  /// No description provided for @perfectPlaceBullet3.
  ///
  /// In en, this message translates to:
  /// **'Peaceful surroundings and cultural richness, ideal for both leisure and learning.'**
  String get perfectPlaceBullet3;

  /// No description provided for @perfectPlaceBullet4.
  ///
  /// In en, this message translates to:
  /// **'A chance to experience patriotism and spiritual pride in one location.'**
  String get perfectPlaceBullet4;

  /// No description provided for @perfectPlaceP2.
  ///
  /// In en, this message translates to:
  /// **'It rightly claims its spot among the top Udaipur city tour places, offering a complete experience of bravery, tradition, and national pride.'**
  String get perfectPlaceP2;

  /// No description provided for @aboutPgkFaqQ1.
  ///
  /// In en, this message translates to:
  /// **'Q1. Why is Pratap Gaurav Kendra considered the best tourist place in Udaipur?'**
  String get aboutPgkFaqQ1;

  /// No description provided for @aboutPgkFaqA1.
  ///
  /// In en, this message translates to:
  /// **'Because it combines patriotism, history, education, and art in a single experience. It allows visitors to learn about Maharana Pratap and Rajputana glory in an engaging and inspiring manner.'**
  String get aboutPgkFaqA1;

  /// No description provided for @aboutPgkFaqQ2.
  ///
  /// In en, this message translates to:
  /// **'Q2. Is the center part of regular Udaipur city tour places?'**
  String get aboutPgkFaqQ2;

  /// No description provided for @aboutPgkFaqA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, it is often recommended by guides and travel agencies as one of the must-visit spots in Udaipur, especially for those interested in history and Indian culture.'**
  String get aboutPgkFaqA2;

  /// No description provided for @aboutPgkFaqQ3.
  ///
  /// In en, this message translates to:
  /// **'Q3. What are the main attractions inside the center?'**
  String get aboutPgkFaqQ3;

  /// No description provided for @aboutPgkFaqA3.
  ///
  /// In en, this message translates to:
  /// **'The Haldighati Battle Epic, life-sized warrior statues, Chetak Gallery, Maharana Pratap’s life gallery, and a spiritual segment make it one of the most famous tourist places in Udaipur.'**
  String get aboutPgkFaqA3;

  /// No description provided for @aboutPgkFaqQ4.
  ///
  /// In en, this message translates to:
  /// **'Q4. Is this location suitable for children and school groups?'**
  String get aboutPgkFaqQ4;

  /// No description provided for @aboutPgkFaqA4.
  ///
  /// In en, this message translates to:
  /// **'Definitely. The center’s educational format and visual storytelling make it ideal for young minds and academic groups.'**
  String get aboutPgkFaqA4;

  /// No description provided for @aboutPgkFaqQ5.
  ///
  /// In en, this message translates to:
  /// **'Q5. How long does a visit usually take?'**
  String get aboutPgkFaqQ5;

  /// No description provided for @aboutPgkFaqA5.
  ///
  /// In en, this message translates to:
  /// **'Visitors typically spend 2–3 hours exploring all exhibits and shows comfortably.'**
  String get aboutPgkFaqA5;

  /// No description provided for @planVisitToday.
  ///
  /// In en, this message translates to:
  /// **'Plan Your Visit Today'**
  String get planVisitToday;

  /// No description provided for @planVisitDesc.
  ///
  /// In en, this message translates to:
  /// **'Whether you’re planning a historical exploration or just looking for the best tourist place in Udaipur, Pratap Gaurav Kendra offers a fulfilling experience. It’s not just a place to visit—it’s a place to feel pride, learn heritage, and connect with India’s glorious past. Add it to your list of Udaipur city tour places and experience a journey back in time.'**
  String get planVisitDesc;

  /// No description provided for @statueOfPrideDesc.
  ///
  /// In en, this message translates to:
  /// **'A 57 feet tall statue of Maharana Pratap in the renunciant posture is installed on a mountain in the Pratap Gaurav Center. The statue is crafted from eight metals and is a masterpiece by renowned sculptors Shri Mahavir Murtikar and Laxman Vyas of Jaipur. The statue weighs approximately 40 tons and depicts Maharana Pratap in a regal pose, showcasing his valor and warrior spirit. The statue is commonly referred to as the “Statue of Pride.”'**
  String get statueOfPrideDesc;

  /// No description provided for @showDetails.
  ///
  /// In en, this message translates to:
  /// **'Show Details'**
  String get showDetails;

  /// No description provided for @showDuration.
  ///
  /// In en, this message translates to:
  /// **'30 Mins'**
  String get showDuration;

  /// No description provided for @showTiming.
  ///
  /// In en, this message translates to:
  /// **'7:30 PM, Daily'**
  String get showTiming;

  /// No description provided for @aboutTheShow.
  ///
  /// In en, this message translates to:
  /// **'About the Show'**
  String get aboutTheShow;

  /// No description provided for @laserShowDesc1.
  ///
  /// In en, this message translates to:
  /// **'Experience the legendary tale of Maharana Pratap brought to life through an advanced laser projection show on water screens. Witness the heroic moments of Mewar’s history, including Panna’s sacrifice and the Battle of Diwer. This captivating show, which beautifully narrates the Maharana Pratap story in Hindi, starts at 7:30 PM and lasts for approximately 30 minutes.'**
  String get laserShowDesc1;

  /// No description provided for @laserShowDesc2.
  ///
  /// In en, this message translates to:
  /// **'Immerse yourself in the glorious past of Mewar as the Maharana Pratap story in Hindi unfolds before your eyes, blending history and technology seamlessly. The show uses cutting-edge visuals and sound to depict the courage and valor of one of India’s greatest warriors. Don’t miss this stunning tribute to the legendary king!'**
  String get laserShowDesc2;

  /// No description provided for @watchLaserShowTitle.
  ///
  /// In en, this message translates to:
  /// **'Watch the Water Laser Show – Relive Maharana Pratap’s Story'**
  String get watchLaserShowTitle;

  /// No description provided for @watchLaserShowDesc.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra Udaipur presents the Water Laser Show, a unique experience where history is displayed through lights, water, and sound. The program highlights the Maharana Pratap Story in Hindi, allowing visitors to connect with the life, bravery, and legacy of the great warrior. With advanced laser projections, traditional music, and powerful narration, the show combines entertainment with cultural learning, making it one of the most engaging evening attractions in Udaipur.'**
  String get watchLaserShowDesc;

  /// No description provided for @mustSeeShowTitle.
  ///
  /// In en, this message translates to:
  /// **'One Show That Tourists in Udaipur Shouldn’t Miss'**
  String get mustSeeShowTitle;

  /// No description provided for @mustSeeShowDesc.
  ///
  /// In en, this message translates to:
  /// **'The Water Laser Show is designed to take audiences on a journey through Mewar’s history. Each scene showcases important episodes from the Maharana Pratap Story in Hindi, including his struggle for freedom and his dedication to the people of Mewar.'**
  String get mustSeeShowDesc;

  /// No description provided for @showHighlightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Highlights of the Show:'**
  String get showHighlightsTitle;

  /// No description provided for @highlight1.
  ///
  /// In en, this message translates to:
  /// **'Laser lights and water projections creating dynamic visuals'**
  String get highlight1;

  /// No description provided for @highlight2.
  ///
  /// In en, this message translates to:
  /// **'Clear narration in Hindi for cultural connection'**
  String get highlight2;

  /// No description provided for @highlight3.
  ///
  /// In en, this message translates to:
  /// **'Music inspired by Rajasthan’s heritage'**
  String get highlight3;

  /// No description provided for @highlight4.
  ///
  /// In en, this message translates to:
  /// **'A meaningful experience for visitors of all ages'**
  String get highlight4;

  /// No description provided for @relivingLegacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Reliving the Legacy of Maharana Pratap'**
  String get relivingLegacyTitle;

  /// No description provided for @warriorJourneyTitle.
  ///
  /// In en, this message translates to:
  /// **'The Warrior’s Journey'**
  String get warriorJourneyTitle;

  /// No description provided for @warriorJourneyDesc.
  ///
  /// In en, this message translates to:
  /// **'The show reflects the courage of Maharana Pratap during the Mughal conflicts and his determination to protect Mewar’s independence. Episodes like the Battle of Haldighati are recreated with light and sound to engage the audience.'**
  String get warriorJourneyDesc;

  /// No description provided for @blendLearningTitle.
  ///
  /// In en, this message translates to:
  /// **'A Blend of Learning and Entertainment'**
  String get blendLearningTitle;

  /// No description provided for @blendLearningDesc.
  ///
  /// In en, this message translates to:
  /// **'This performance not only entertains but also educates. By presenting the Maharana Pratap Story in Hindi, the Water Laser Show makes history accessible and easy to understand for everyone.'**
  String get blendLearningDesc;

  /// No description provided for @whyChoosePgkTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Pratap Gaurav Kendra for the Water Laser Show?'**
  String get whyChoosePgkTitle;

  /// No description provided for @whyPgk1.
  ///
  /// In en, this message translates to:
  /// **'Dedicated to Maharana Pratap’s life and Mewar’s history'**
  String get whyPgk1;

  /// No description provided for @whyPgk2.
  ///
  /// In en, this message translates to:
  /// **'Use of modern technology to present traditional stories'**
  String get whyPgk2;

  /// No description provided for @whyPgk3.
  ///
  /// In en, this message translates to:
  /// **'Convenient location for travelers in Udaipur'**
  String get whyPgk3;

  /// No description provided for @whyPgk4.
  ///
  /// In en, this message translates to:
  /// **'Ideal evening activity after sightseeing'**
  String get whyPgk4;

  /// No description provided for @whyPgk5.
  ///
  /// In en, this message translates to:
  /// **'Suitable for students, families, and history lovers'**
  String get whyPgk5;

  /// No description provided for @planVisitLaserShow.
  ///
  /// In en, this message translates to:
  /// **'The Water Laser Show at Pratap Gaurav Kendra is an inspiring way to explore Rajasthan’s cultural and historical heritage. By combining modern visuals with the Maharana Pratap Story in Hindi, the show connects audiences with the legacy of one of India’s greatest warriors.\n\nBook your visit today and experience the story of Maharana Pratap through lights, music, and water in Udaipur.'**
  String get planVisitLaserShow;

  /// No description provided for @faqLaserQ1.
  ///
  /// In en, this message translates to:
  /// **'Q1. What story does the Water Laser Show present?'**
  String get faqLaserQ1;

  /// No description provided for @faqLaserA1.
  ///
  /// In en, this message translates to:
  /// **'It presents the Maharana Pratap Story in Hindi, highlighting his bravery and legacy.'**
  String get faqLaserA1;

  /// No description provided for @faqLaserQ2.
  ///
  /// In en, this message translates to:
  /// **'Q2. Is the show suitable for children?'**
  String get faqLaserQ2;

  /// No description provided for @faqLaserA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, the visuals and narration are simple and engaging for children.'**
  String get faqLaserA2;

  /// No description provided for @faqLaserQ3.
  ///
  /// In en, this message translates to:
  /// **'Q3. How long does the show last?'**
  String get faqLaserQ3;

  /// No description provided for @faqLaserA3.
  ///
  /// In en, this message translates to:
  /// **'The show runs for about 30–40 minutes.'**
  String get faqLaserA3;

  /// No description provided for @faqLaserQ4.
  ///
  /// In en, this message translates to:
  /// **'Q4. Can non-Hindi speakers enjoy the show?'**
  String get faqLaserQ4;

  /// No description provided for @faqLaserA4.
  ///
  /// In en, this message translates to:
  /// **'Yes, the visuals, music, and effects ensure that the story is understandable even without Hindi knowledge.'**
  String get faqLaserA4;

  /// No description provided for @faqLaserQ5.
  ///
  /// In en, this message translates to:
  /// **'Q5. Where is the Water Laser Show hosted?'**
  String get faqLaserQ5;

  /// No description provided for @faqLaserA5.
  ///
  /// In en, this message translates to:
  /// **'The show is hosted at Pratap Gaurav Kendra, Udaipur.'**
  String get faqLaserA5;

  /// No description provided for @bhaktiDhamDetails.
  ///
  /// In en, this message translates to:
  /// **'Bhakti Dham Details'**
  String get bhaktiDhamDetails;

  /// No description provided for @spiritualNarrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Spiritual Narration: The Significance of Bhakti Dham'**
  String get spiritualNarrationTitle;

  /// No description provided for @whyPgkFamous.
  ///
  /// In en, this message translates to:
  /// **'Why Pratap Gaurav Kendra is Famous'**
  String get whyPgkFamous;

  /// No description provided for @bhaktiDhamNarrationText.
  ///
  /// In en, this message translates to:
  /// **'Udaipur, the city of lakes and royal heritage, is home to many historical sites, but Pratap Gaurav Kendra stands out as a tribute to one of Rajasthan’s greatest warriors. Dedicated to Maharana Pratap, this center offers a unique and immersive experience.'**
  String get bhaktiDhamNarrationText;

  /// No description provided for @pgkFamousDesc.
  ///
  /// In en, this message translates to:
  /// **'Udaipur, the city of lakes and royal heritage, is home to many historical sites, but Pratap Gaurav Kendra stands out as a tribute to one of Rajasthan’s greatest warriors. Dedicated to Maharana Pratap, this center offers a unique and immersive experience that draws history enthusiasts, tourists, students, and locals alike. It beautifully complements the Maharana Pratap Smarak, enriching visitors’ understanding of this legendary Rajput hero.'**
  String get pgkFamousDesc;

  /// No description provided for @celebratingHeroicLegacy.
  ///
  /// In en, this message translates to:
  /// **'Celebrating Maharana Pratap’s Heroic Legacy'**
  String get celebratingHeroicLegacy;

  /// No description provided for @celebratingHeroicLegacyDesc.
  ///
  /// In en, this message translates to:
  /// **'At Pratap Gaurav Kendra, visitors encounter a heartfelt homage to Maharana Pratap’s courage and sacrifice. The exhibits, statues, and detailed battle recreations vividly bring his story to life. This site provides an engaging narrative that enhances the significance of the nearby Maharana Pratap Smarak, making both places essential stops on any historical tour of Udaipur.'**
  String get celebratingHeroicLegacyDesc;

  /// No description provided for @educationalInsights.
  ///
  /// In en, this message translates to:
  /// **'Educational Insights for All Ages'**
  String get educationalInsights;

  /// No description provided for @educationalInsightsDesc.
  ///
  /// In en, this message translates to:
  /// **'Perfect for students, researchers, and history buffs, Pratap Gaurav Kendra offers:\n• In-depth information on Maharana Pratap’s life and times.\n• Multimedia displays and guided tours that explain Rajput history.\n• An educational environment that complements visits to the Maharana Pratap Smarak.\nThese features make it a favored destination for academic groups and cultural tourists. Make your visit memorable by watching the stunning Water Laser Show.'**
  String get educationalInsightsDesc;

  /// No description provided for @scenicSereneEnv.
  ///
  /// In en, this message translates to:
  /// **'Scenic and Serene Environment'**
  String get scenicSereneEnv;

  /// No description provided for @scenicSereneEnvDesc.
  ///
  /// In en, this message translates to:
  /// **'Set in a peaceful location, the Kendra provides a reflective atmosphere for visitors. Just like the Maharana Pratap Smarak, it offers beautiful surroundings that allow guests to connect emotionally with the warrior’s legacy while enjoying scenic views and calmness.'**
  String get scenicSereneEnvDesc;

  /// No description provided for @culturalPrograms.
  ///
  /// In en, this message translates to:
  /// **'Cultural Programs and Community Involvement'**
  String get culturalPrograms;

  /// No description provided for @culturalProgramsDesc.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra also serves as a cultural hub, hosting events that celebrate Rajput traditions and Maharana Pratap’s enduring spirit. These community-driven activities attract locals and tourists, helping preserve and promote Rajasthan’s rich cultural heritage.'**
  String get culturalProgramsDesc;

  /// No description provided for @faqTitleBhakti.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqTitleBhakti;

  /// No description provided for @faqBhaktiQ1.
  ///
  /// In en, this message translates to:
  /// **'Q1: When should I visit Pratap Gaurav Kendra for the best experience?'**
  String get faqBhaktiQ1;

  /// No description provided for @faqBhaktiA1.
  ///
  /// In en, this message translates to:
  /// **'The ideal time is between October and March, especially during early mornings or late afternoons when the weather is pleasant.'**
  String get faqBhaktiA1;

  /// No description provided for @faqBhaktiQ2.
  ///
  /// In en, this message translates to:
  /// **'Q2: Is there an entry fee for the Kendra?'**
  String get faqBhaktiQ2;

  /// No description provided for @faqBhaktiA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, a small entry fee applies, which is affordable for most visitors.'**
  String get faqBhaktiA2;

  /// No description provided for @faqBhaktiQ3.
  ///
  /// In en, this message translates to:
  /// **'Q3: Are guided tours available?'**
  String get faqBhaktiQ3;

  /// No description provided for @faqBhaktiA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, guided tours and audio guides are provided to enrich your visit.'**
  String get faqBhaktiA3;

  /// No description provided for @faqBhaktiQ4.
  ///
  /// In en, this message translates to:
  /// **'Q4: Is the Kendra suitable for families and children?'**
  String get faqBhaktiQ4;

  /// No description provided for @faqBhaktiA4.
  ///
  /// In en, this message translates to:
  /// **'Definitely! The site is family-friendly, with safe walking areas and educational displays.'**
  String get faqBhaktiA4;

  /// No description provided for @templesInBhaktiDham.
  ///
  /// In en, this message translates to:
  /// **'Temples in Bhakti Dham'**
  String get templesInBhaktiDham;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get showLess;

  /// No description provided for @readMoreBtn.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get readMoreBtn;

  /// No description provided for @attractionDetails.
  ///
  /// In en, this message translates to:
  /// **'Attraction Details'**
  String get attractionDetails;

  /// No description provided for @pratapGouravKendra.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gourav Kendra'**
  String get pratapGouravKendra;

  /// No description provided for @waterLaserShowOnly.
  ///
  /// In en, this message translates to:
  /// **'Water Laser Show Only'**
  String get waterLaserShowOnly;

  /// No description provided for @pratapGouravKendraCombo.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gourav Kendra + Water Laser Show Combo'**
  String get pratapGouravKendraCombo;

  /// No description provided for @wantToAddWaterLaserShow.
  ///
  /// In en, this message translates to:
  /// **'Want to add Water Laser Show ticket?'**
  String get wantToAddWaterLaserShow;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get yes;

  /// No description provided for @dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date:'**
  String get dateLabel;

  /// No description provided for @nationalityLabel.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationalityLabel;

  /// No description provided for @indian.
  ///
  /// In en, this message translates to:
  /// **'Indian'**
  String get indian;

  /// No description provided for @foreigner.
  ///
  /// In en, this message translates to:
  /// **'Foreigner'**
  String get foreigner;

  /// No description provided for @selectTickets.
  ///
  /// In en, this message translates to:
  /// **'Select Tickets'**
  String get selectTickets;

  /// No description provided for @infantLabel.
  ///
  /// In en, this message translates to:
  /// **'Infant (0-5 Years)'**
  String get infantLabel;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @kidsLabel.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get kidsLabel;

  /// No description provided for @adultLabel.
  ///
  /// In en, this message translates to:
  /// **'Adult (12+ Years)'**
  String get adultLabel;

  /// No description provided for @totalAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Amount:  '**
  String get totalAmountLabel;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'Contact Details'**
  String get contactDetails;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get enterYourName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get enterYourEmail;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Phone Number'**
  String get enterYourPhoneNumber;

  /// No description provided for @bookNowBtn.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNowBtn;

  /// No description provided for @rulesRegulationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Rules & Regulations'**
  String get rulesRegulationsTitle;

  /// No description provided for @rule1.
  ///
  /// In en, this message translates to:
  /// **'1. Pratap Gaurav Kendra Rashtriya Tirth will open Everyday for Audience.'**
  String get rule1;

  /// No description provided for @rule2.
  ///
  /// In en, this message translates to:
  /// **'2. Ticket window will be opened for audience at 9.30 am to 6.pm.'**
  String get rule2;

  /// No description provided for @rule3.
  ///
  /// In en, this message translates to:
  /// **'3. Duration of all exhibition and robotic show visit in Pratap Gaurav Kendra approx one and half hours.'**
  String get rule3;

  /// No description provided for @rule4.
  ///
  /// In en, this message translates to:
  /// **'4. To maintain Pratap Gaurav Kendra Ticket Per Person above 12 years is 160/- only for General Show and with family 0-5 year child is free and 110/- Ticket for 6-12 year child. Major Attraction Live Water Laser Show, Ticket Per Person above 12 years is 100/- only for General Show and with family 0-5 year child is free and 50/- Ticket for 6-12 year child.'**
  String get rule4;

  /// No description provided for @rule5.
  ///
  /// In en, this message translates to:
  /// **'5. For foreign tourist per person ticket above 12 year is 460 /- and 260/- for 6-12 year child and 0-5 year child free. (All shows and headphone are included.)'**
  String get rule5;

  /// No description provided for @rule6.
  ///
  /// In en, this message translates to:
  /// **'6. Smoking and Alcohol consumption within the parking and campus is strictly prohibited. Carrying alcohol and banned substances in vehicles is strictly prohibited within the parking and campus.'**
  String get rule6;

  /// No description provided for @rule7.
  ///
  /// In en, this message translates to:
  /// **'7. Please switch off the mobile phone and cameras in Pratap Gaurav Kendra.'**
  String get rule7;

  /// No description provided for @rule8.
  ///
  /// In en, this message translates to:
  /// **'8. HUMBLE REQUEST – Your visit to Pratap Gaurav Kendra Rashtriya Tirtha is a pilgrimage to a sacred centre of Bharat’s Cultural traditions and values. We request your support to maintain the peace, dignity and divinity of the complex.'**
  String get rule8;

  /// No description provided for @rule9.
  ///
  /// In en, this message translates to:
  /// **'9. The management reserves all rights to entry. We apologize for any inconvenience.'**
  String get rule9;

  /// No description provided for @mevadSphurtiDirghaTitle.
  ///
  /// In en, this message translates to:
  /// **'Mevad Sphurti Dirgha'**
  String get mevadSphurtiDirghaTitle;

  /// No description provided for @roboticShowLabel.
  ///
  /// In en, this message translates to:
  /// **'Robotic Show'**
  String get roboticShowLabel;

  /// No description provided for @durationTBA.
  ///
  /// In en, this message translates to:
  /// **'Duration: TBA'**
  String get durationTBA;

  /// No description provided for @mevadSphurtiDirghaDesc.
  ///
  /// In en, this message translates to:
  /// **'This show uses mechanical models to narrate various stories of Mevad. It provides a cinematic experience, showcasing events like the victory of Hammir Chittorgarh.'**
  String get mevadSphurtiDirghaDesc;

  /// No description provided for @yeGathaHaiMevadKiTitle.
  ///
  /// In en, this message translates to:
  /// **'Ye Gatha Hai Mevad Ki'**
  String get yeGathaHaiMevadKiTitle;

  /// No description provided for @duration18Mins.
  ///
  /// In en, this message translates to:
  /// **'18 Minutes'**
  String get duration18Mins;

  /// No description provided for @documentaryShowLabel.
  ///
  /// In en, this message translates to:
  /// **'Documentary Show'**
  String get documentaryShowLabel;

  /// No description provided for @overviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overviewTitle;

  /// No description provided for @docShowOverviewDesc.
  ///
  /// In en, this message translates to:
  /// **'This documentary show provides a comprehensive overview of the entire history of Mevad in 18 minutes. It offers insights into the sacrifices and continuous dedication to the nation by Mevad.'**
  String get docShowOverviewDesc;

  /// No description provided for @proudHistoryMewarTitle.
  ///
  /// In en, this message translates to:
  /// **'The Proud History of Mewar'**
  String get proudHistoryMewarTitle;

  /// No description provided for @proudHistoryMewarDesc.
  ///
  /// In en, this message translates to:
  /// **'The history of Mewar is a saga of unmatched courage, sacrifice, and loyalty to the motherland. At Pratap Gaurav Kendra in Udaipur, visitors can explore this incredible journey through immersive exhibits and engaging presentations. Unlike any other museum in Udaipur, this heritage center offers a unique way to experience the pride and valor that shaped India’s cultural and historical identity.'**
  String get proudHistoryMewarDesc;

  /// No description provided for @whatMakesPgkSpecialTitle.
  ///
  /// In en, this message translates to:
  /// **'What Makes Pratap Gaurav Kendra Special?'**
  String get whatMakesPgkSpecialTitle;

  /// No description provided for @whatMakesPgkSpecialDesc.
  ///
  /// In en, this message translates to:
  /// **'Unlike a traditional museum in Udaipur that focuses only on artifacts, this center blends technology and storytelling. Here, the history of Mewar is showcased with:'**
  String get whatMakesPgkSpecialDesc;

  /// No description provided for @specialBullet1.
  ///
  /// In en, this message translates to:
  /// **'Engaging visuals that recreate significant battles and sacrifices.'**
  String get specialBullet1;

  /// No description provided for @specialBullet2.
  ///
  /// In en, this message translates to:
  /// **'Concise narratives that summarize centuries of history in minutes.'**
  String get specialBullet2;

  /// No description provided for @specialBullet3.
  ///
  /// In en, this message translates to:
  /// **'Emotional depth that connects visitors with the spirit of the land.'**
  String get specialBullet3;

  /// No description provided for @specialBullet4.
  ///
  /// In en, this message translates to:
  /// **'National significance highlighting Mewar’s contribution to Indian identity.'**
  String get specialBullet4;

  /// No description provided for @whyVisitTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Visit?'**
  String get whyVisitTitle;

  /// No description provided for @whyVisitDesc.
  ///
  /// In en, this message translates to:
  /// **'If you are planning to explore a museum in Udaipur, here’s why this center should top your list:'**
  String get whyVisitDesc;

  /// No description provided for @whyVisitBullet1.
  ///
  /// In en, this message translates to:
  /// **'It presents the history of Mewar in an interactive and inspiring way.'**
  String get whyVisitBullet1;

  /// No description provided for @whyVisitBullet2.
  ///
  /// In en, this message translates to:
  /// **'Families, students, and tourists gain both knowledge and pride.'**
  String get whyVisitBullet2;

  /// No description provided for @whyVisitBullet3.
  ///
  /// In en, this message translates to:
  /// **'It is more than a museum—it is a living tribute to courage and culture.'**
  String get whyVisitBullet3;

  /// No description provided for @conclusionTitle.
  ///
  /// In en, this message translates to:
  /// **'Conclusion'**
  String get conclusionTitle;

  /// No description provided for @conclusionDesc.
  ///
  /// In en, this message translates to:
  /// **'The history of Mewar is a timeless tale of bravery and honor. Pratap Gaurav Kendra ensures that every visitor not only learns about this history but also feels connected to its spirit. For anyone planning to visit a museum in Udaipur, this center offers a unique opportunity to go beyond artifacts and step into the living legacy of Mewar.\n\nVisit Pratap Gaurav Kendra and experience the proud history of Mewar.'**
  String get conclusionDesc;

  /// No description provided for @faqTitleStandard.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqTitleStandard;

  /// No description provided for @faqDocQ1.
  ///
  /// In en, this message translates to:
  /// **'What does the history of Mewar include?'**
  String get faqDocQ1;

  /// No description provided for @faqDocA1.
  ///
  /// In en, this message translates to:
  /// **'It covers the origins, architectural achievements, cultural values, and the timeless traditions of bravery and sacrifice that continue to inspire generations.'**
  String get faqDocA1;

  /// No description provided for @faqDocQ2.
  ///
  /// In en, this message translates to:
  /// **'How is it different from a traditional museum?'**
  String get faqDocQ2;

  /// No description provided for @faqDocA2.
  ///
  /// In en, this message translates to:
  /// **'While regular museums focus on displaying objects, Pratap Gaurav Kendra brings the history of Mewar alive with visuals, sound, and storytelling.'**
  String get faqDocA2;

  /// No description provided for @faqDocQ3.
  ///
  /// In en, this message translates to:
  /// **'Is this place suitable for children and students?'**
  String get faqDocQ3;

  /// No description provided for @faqDocA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, it simplifies the history of Mewar into engaging formats that young learners can understand easily.'**
  String get faqDocA3;

  /// No description provided for @faqDocQ4.
  ///
  /// In en, this message translates to:
  /// **'Where is it located?'**
  String get faqDocQ4;

  /// No description provided for @faqDocA4.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra is situated in Udaipur, Rajasthan, making it a top alternative to a traditional museum in Udaipur.'**
  String get faqDocA4;

  /// No description provided for @rajasthanDirghaTitle.
  ///
  /// In en, this message translates to:
  /// **'Rajasthan Dirgha'**
  String get rajasthanDirghaTitle;

  /// No description provided for @rajasthanDirghaNarrationText.
  ///
  /// In en, this message translates to:
  /// **'In this epic, statues of 25 selected warriors, great personalities, saints, and local deities of Rajasthan are showcased...'**
  String get rajasthanDirghaNarrationText;

  /// No description provided for @rajasthanDirghaNarrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Rajasthan Dirgha Narration'**
  String get rajasthanDirghaNarrationLabel;

  /// No description provided for @audioGuideLabel.
  ///
  /// In en, this message translates to:
  /// **'Audio Guide'**
  String get audioGuideLabel;

  /// No description provided for @greatPersonalitiesTitle.
  ///
  /// In en, this message translates to:
  /// **'The Great Personalities of Rajasthan'**
  String get greatPersonalitiesTitle;

  /// No description provided for @greatPersonalitiesDesc1.
  ///
  /// In en, this message translates to:
  /// **'In this epic, breathtaking statues of 25 selected warriors, great personalities, saints, and local deities of Rajasthan are proudly showcased. The exhibit serves as a cultural archive, offering a glimpse into the diverse spiritual and martial history of the region.'**
  String get greatPersonalitiesDesc1;

  /// No description provided for @prominentLocalDeitiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Prominent Local Deities'**
  String get prominentLocalDeitiesTitle;

  /// No description provided for @deity1.
  ///
  /// In en, this message translates to:
  /// **'Ramdevji'**
  String get deity1;

  /// No description provided for @deity2.
  ///
  /// In en, this message translates to:
  /// **'Tejaji'**
  String get deity2;

  /// No description provided for @deity3.
  ///
  /// In en, this message translates to:
  /// **'Gogaji'**
  String get deity3;

  /// No description provided for @heroicFiguresTitle.
  ///
  /// In en, this message translates to:
  /// **'Heroic Figures & Warriors'**
  String get heroicFiguresTitle;

  /// No description provided for @warrior1.
  ///
  /// In en, this message translates to:
  /// **'Durgadas Rathore'**
  String get warrior1;

  /// No description provided for @warrior2.
  ///
  /// In en, this message translates to:
  /// **'Hamir Chauhan'**
  String get warrior2;

  /// No description provided for @warrior3.
  ///
  /// In en, this message translates to:
  /// **'Rao Chandrasen'**
  String get warrior3;

  /// No description provided for @warrior4.
  ///
  /// In en, this message translates to:
  /// **'Rao Shekha Ji'**
  String get warrior4;

  /// No description provided for @moreLegendaryFigures.
  ///
  /// In en, this message translates to:
  /// **'And many more legendary figures.'**
  String get moreLegendaryFigures;

  /// No description provided for @greatPersonalitiesDesc2.
  ///
  /// In en, this message translates to:
  /// **'More than just a visual display, this epic dirgha provides thoroughly documented records of the life stories, teachings, and monumental sacrifices of these local deities, saints, and warriors.'**
  String get greatPersonalitiesDesc2;

  /// No description provided for @pratapHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap: The Lion of\nMewar'**
  String get pratapHeroTitle;

  /// No description provided for @narrationBattleOfHaldighati.
  ///
  /// In en, this message translates to:
  /// **'Narration: The Battle of Haldighati'**
  String get narrationBattleOfHaldighati;

  /// No description provided for @keyEventsTitle.
  ///
  /// In en, this message translates to:
  /// **'Key Events'**
  String get keyEventsTitle;

  /// No description provided for @haldighatiRecreation.
  ///
  /// In en, this message translates to:
  /// **'Haldighati Battle\nRecreation'**
  String get haldighatiRecreation;

  /// No description provided for @chetaksSacrifice.
  ///
  /// In en, this message translates to:
  /// **'Chetak\'s Sacrifice'**
  String get chetaksSacrifice;

  /// No description provided for @pratapsCoronation.
  ///
  /// In en, this message translates to:
  /// **'Pratap\'s Coronation'**
  String get pratapsCoronation;

  /// No description provided for @mewadRatanDirghaTitle.
  ///
  /// In en, this message translates to:
  /// **'Mewad Ratan Dirgha'**
  String get mewadRatanDirghaTitle;

  /// No description provided for @mewadRatanNarrationText.
  ///
  /// In en, this message translates to:
  /// **'The major warriors and heroic women of Mewar are displayed in this epic. Starting with Bappa Rawal, it extends to the warriors, saints, and heroic women...'**
  String get mewadRatanNarrationText;

  /// No description provided for @mewadRatanNarrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Mewad Ratan Dirgha Narration'**
  String get mewadRatanNarrationLabel;

  /// No description provided for @prideOfMewarTitle.
  ///
  /// In en, this message translates to:
  /// **'The Pride of Mewar'**
  String get prideOfMewarTitle;

  /// No description provided for @prideOfMewarDesc1.
  ///
  /// In en, this message translates to:
  /// **'The major warriors and heroic women of Mewar are displayed in this epic exhibit. Starting with Bappa Rawal, it extends to the warriors, saints, and heroic women during the reign of Maharana Raj Singh. The epic showcases the military valor and spiritual inclinations of Mewar’s army.'**
  String get prideOfMewarDesc1;

  /// No description provided for @prideOfMewarDesc2.
  ///
  /// In en, this message translates to:
  /// **'It provides concise information about the history and culture of the Guhilots’ kingdom in Mewar from its inception to the 18th century.'**
  String get prideOfMewarDesc2;

  /// No description provided for @significantFiguresTitle.
  ///
  /// In en, this message translates to:
  /// **'Significant Figures Displayed'**
  String get significantFiguresTitle;

  /// No description provided for @significantFiguresDesc.
  ///
  /// In en, this message translates to:
  /// **'The dirgha includes majestic statues and depictions of the following historical icons:'**
  String get significantFiguresDesc;

  /// No description provided for @mewadFigure1.
  ///
  /// In en, this message translates to:
  /// **'Bappa Rawal & Harit Rashi'**
  String get mewadFigure1;

  /// No description provided for @mewadFigure2.
  ///
  /// In en, this message translates to:
  /// **'Padmavati, Gaura & Badal'**
  String get mewadFigure2;

  /// No description provided for @mewadFigure3.
  ///
  /// In en, this message translates to:
  /// **'Satyavrat Chunda'**
  String get mewadFigure3;

  /// No description provided for @mewadFigure4.
  ///
  /// In en, this message translates to:
  /// **'Maharana Kumbhakarna (Rana Kumbha)'**
  String get mewadFigure4;

  /// No description provided for @mewadFigure5.
  ///
  /// In en, this message translates to:
  /// **'Maharana Sangram Singh I (Rana Sanga)'**
  String get mewadFigure5;

  /// No description provided for @mewadFigure6.
  ///
  /// In en, this message translates to:
  /// **'Panna Dhay'**
  String get mewadFigure6;

  /// No description provided for @mewadFigure7.
  ///
  /// In en, this message translates to:
  /// **'Jaymal Medtia & Patta Sisodia'**
  String get mewadFigure7;

  /// No description provided for @mewadFigure8.
  ///
  /// In en, this message translates to:
  /// **'Kalla Rathore'**
  String get mewadFigure8;

  /// No description provided for @mewadFigure9.
  ///
  /// In en, this message translates to:
  /// **'Meera Bai'**
  String get mewadFigure9;

  /// No description provided for @mewadFigure10.
  ///
  /// In en, this message translates to:
  /// **'Maharana Uday Singh II'**
  String get mewadFigure10;

  /// No description provided for @mewadFigure11.
  ///
  /// In en, this message translates to:
  /// **'Bhamashah & Rana Punja'**
  String get mewadFigure11;

  /// No description provided for @mewadFigure12.
  ///
  /// In en, this message translates to:
  /// **'Hakeem Khan Sur'**
  String get mewadFigure12;

  /// No description provided for @mewadFigure13.
  ///
  /// In en, this message translates to:
  /// **'Maharana Amar Singh & Maharana Raj Singh'**
  String get mewadFigure13;

  /// No description provided for @mewadFigure14.
  ///
  /// In en, this message translates to:
  /// **'Hadi Rani'**
  String get mewadFigure14;

  /// No description provided for @krantikariDirghaTitle.
  ///
  /// In en, this message translates to:
  /// **'Krantikari Dirgha'**
  String get krantikariDirghaTitle;

  /// No description provided for @krantikariNarrationText.
  ///
  /// In en, this message translates to:
  /// **'This epic, located in the center of the Pratap Gaurav Kendra, showcases the stories of brave warriors from the Indian independence struggle...'**
  String get krantikariNarrationText;

  /// No description provided for @krantikariNarrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Krantikari Dirgha Narration'**
  String get krantikariNarrationLabel;

  /// No description provided for @heroesOfIndependenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Heroes of the Independence Struggle'**
  String get heroesOfIndependenceTitle;

  /// No description provided for @heroesOfIndependenceDesc1.
  ///
  /// In en, this message translates to:
  /// **'Located in the center of the Pratap Gaurav Kendra, this epic exhibit showcases the stories of brave warriors from the Indian independence struggle using magnificent statues.'**
  String get heroesOfIndependenceDesc1;

  /// No description provided for @heroesOfIndependenceDesc2.
  ///
  /// In en, this message translates to:
  /// **'The epic covers the crucial period from 1857 to 1947, presenting the timeless tales of valor and sacrifice through stunning sculptural representations.'**
  String get heroesOfIndependenceDesc2;

  /// No description provided for @keyHighlightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Key Highlights'**
  String get keyHighlightsTitle;

  /// No description provided for @krantikariHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Central Location: Situated prominently at the heart of the Kendra.'**
  String get krantikariHighlight1;

  /// No description provided for @krantikariHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Historical Timeline: Covers the monumental era from the First War of Independence (1857) to India\'s Freedom (1947).'**
  String get krantikariHighlight2;

  /// No description provided for @krantikariHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Sculptural Storytelling: Tales of valor brought to life through incredibly detailed, lifelike statues.'**
  String get krantikariHighlight3;

  /// No description provided for @krantikariHighlight4.
  ///
  /// In en, this message translates to:
  /// **'Tribute to Martyrs: Dedicated entirely to the brave revolutionaries who fought against colonial rule.'**
  String get krantikariHighlight4;

  /// No description provided for @haldighatiDirghaTitle.
  ///
  /// In en, this message translates to:
  /// **'Haldighati Vijay Yudh Dirgha'**
  String get haldighatiDirghaTitle;

  /// No description provided for @haldighatiNarrationText1.
  ///
  /// In en, this message translates to:
  /// **'The Haldighati Vijay Yuddh Dirgha presents a powerful visual narration of the historic Battle of Haldighati...'**
  String get haldighatiNarrationText1;

  /// No description provided for @haldighatiNarrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Battle of Haldighati Narration'**
  String get haldighatiNarrationLabel;

  /// No description provided for @exploreLegacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore the Legacy of Maharana Pratap'**
  String get exploreLegacyTitle;

  /// No description provided for @exploreLegacyDesc1.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra Udaipur offers a unique journey into the heroic life and achievements of Maharana Pratap, a symbol of courage and resilience in Indian history. This site is highly relevant for history lovers, tourists, and students keen on exploring the rich heritage of Rajasthan. As a prominent museum in Udaipur, the Maharana Pratap Museum Udaipur provides immersive exhibits that highlight the king’s struggles and victories, making it an essential destination for cultural exploration.'**
  String get exploreLegacyDesc1;

  /// No description provided for @highlightsMuseumTitle.
  ///
  /// In en, this message translates to:
  /// **'Highlights of the Museum'**
  String get highlightsMuseumTitle;

  /// No description provided for @highlightMuseum1.
  ///
  /// In en, this message translates to:
  /// **'The Maharana Pratap Museum displays a curated collection of historic artifacts, paintings, and weaponry.'**
  String get highlightMuseum1;

  /// No description provided for @highlightMuseum2.
  ///
  /// In en, this message translates to:
  /// **'Themed galleries recreate significant moments from Maharana Pratap’s battles and court life.'**
  String get highlightMuseum2;

  /// No description provided for @highlightMuseum3.
  ///
  /// In en, this message translates to:
  /// **'Rare manuscripts and photographs offer insights into 16th-century Rajput culture.'**
  String get highlightMuseum3;

  /// No description provided for @highlightMuseum4.
  ///
  /// In en, this message translates to:
  /// **'Interactive touchscreens provide engaging narratives and detailed information.'**
  String get highlightMuseum4;

  /// No description provided for @highlightMuseum5.
  ///
  /// In en, this message translates to:
  /// **'Planning a city tour? Don’t miss these essential Udaipur City Tour Places.'**
  String get highlightMuseum5;

  /// No description provided for @visitorTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Visitor Tips and Experience'**
  String get visitorTipsTitle;

  /// No description provided for @visitorTip1.
  ///
  /// In en, this message translates to:
  /// **'Visit early in the morning or late afternoon to enjoy a quieter, more personalized experience.'**
  String get visitorTip1;

  /// No description provided for @visitorTip2.
  ///
  /// In en, this message translates to:
  /// **'Photography enthusiasts will find many scenic and historically rich spots for capturing unique shots.'**
  String get visitorTip2;

  /// No description provided for @visitorTip3.
  ///
  /// In en, this message translates to:
  /// **'Local guides and tour operators offer special heritage tours including Pratap Gaurav Kendra and nearby attractions.'**
  String get visitorTip3;

  /// No description provided for @exploreLegacyDesc2.
  ///
  /// In en, this message translates to:
  /// **'The Haldighati Vijay Yuddh Dirgha presents a powerful visual narration of the historic Battle of Haldighati fought between Maharana Pratap of Mewar and the Mughal forces. This gallery beautifully showcases the courage, military strategy, and unbreakable determination of the Rajput warriors who defended their homeland against a powerful empire. Through lifelike installations and artistic storytelling, the Dirgha preserves a proud chapter of Indian history and brings the spirit of honor and resistance to life.'**
  String get exploreLegacyDesc2;

  /// No description provided for @faqHaldighatiQ1.
  ///
  /// In en, this message translates to:
  /// **'What time does Pratap Gaurav Kendra open and close?'**
  String get faqHaldighatiQ1;

  /// No description provided for @faqHaldighatiA1.
  ///
  /// In en, this message translates to:
  /// **'Visitors can explore the museum from 10:00 AM to 5:30 PM every day except on select holidays.'**
  String get faqHaldighatiA1;

  /// No description provided for @faqHaldighatiQ2.
  ///
  /// In en, this message translates to:
  /// **'Is the Museum accessible for visitors with disabilities?'**
  String get faqHaldighatiQ2;

  /// No description provided for @faqHaldighatiA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, the museum is designed to be inclusive with features like ramps and assistance services.'**
  String get faqHaldighatiA2;

  /// No description provided for @faqHaldighatiQ3.
  ///
  /// In en, this message translates to:
  /// **'Are guided tours available at the museum?'**
  String get faqHaldighatiQ3;

  /// No description provided for @faqHaldighatiA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, guided tours are offered in various languages and can be booked in advance.'**
  String get faqHaldighatiA3;

  /// No description provided for @faqHaldighatiQ4.
  ///
  /// In en, this message translates to:
  /// **'Can school groups participate in educational programs?'**
  String get faqHaldighatiQ4;

  /// No description provided for @faqHaldighatiA4.
  ///
  /// In en, this message translates to:
  /// **'Definitely, the museum regularly organizes tailored educational visits for students of all ages.'**
  String get faqHaldighatiA4;

  /// No description provided for @faqHaldighatiQ5.
  ///
  /// In en, this message translates to:
  /// **'Is photography permitted inside?'**
  String get faqHaldighatiQ5;

  /// No description provided for @faqHaldighatiA5.
  ///
  /// In en, this message translates to:
  /// **'Photography is allowed in designated areas, but flash and video recording may be restricted as per museum rules.'**
  String get faqHaldighatiA5;

  /// No description provided for @charitraPradarshaneeTitle.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap Charitra Pradarshanee'**
  String get charitraPradarshaneeTitle;

  /// No description provided for @charitraNarrationText1.
  ///
  /// In en, this message translates to:
  /// **'The life story of Maharana Pratap from birth to death is displayed through paintings in five rooms. Whether it is the birthplace of Pratap...'**
  String get charitraNarrationText1;

  /// No description provided for @charitraNarrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Charitra Pradarshanee Narration'**
  String get charitraNarrationLabel;

  /// No description provided for @journeyThroughLegendTitle.
  ///
  /// In en, this message translates to:
  /// **'A Journey Through a Legend’s Life'**
  String get journeyThroughLegendTitle;

  /// No description provided for @charitraDesc1.
  ///
  /// In en, this message translates to:
  /// **'The life story of Maharana Pratap from birth to death is displayed through paintings in five rooms. Whether it is the birthplace of Pratap in Kumbhalgarh or scenes depicting Pratap freeing Abdul Rahim Khan-Khana’s family or the sacrifice of his loyal horse Chetak, these scenes provide a vivid portrayal through paintings, offering viewers an immersive experience.'**
  String get charitraDesc1;

  /// No description provided for @charitraDesc2.
  ///
  /// In en, this message translates to:
  /// **'A striking highlight is the Maharana Pratap statue that stands tall, symbolizing his unwavering spirit and bravery. The Charitra Pradarshanee offers a visually captivating and educational experience that brings the legendary Rajput warrior’s life to light.'**
  String get charitraDesc2;

  /// No description provided for @grandStatueTitle.
  ///
  /// In en, this message translates to:
  /// **'The Grand Maharana Pratap Statue'**
  String get grandStatueTitle;

  /// No description provided for @grandStatueDesc.
  ///
  /// In en, this message translates to:
  /// **'Standing tall inside the Pradarshanee, this magnificent statue depicts Maharana Pratap mounted on his loyal horse, Chetak. It is a true tribute to the indomitable Rajput spirit.'**
  String get grandStatueDesc;

  /// No description provided for @statueBullet1.
  ///
  /// In en, this message translates to:
  /// **'Represents courage, sacrifice, and honor.'**
  String get statueBullet1;

  /// No description provided for @statueBullet2.
  ///
  /// In en, this message translates to:
  /// **'Serves as an inspiration for future generations.'**
  String get statueBullet2;

  /// No description provided for @statueBullet3.
  ///
  /// In en, this message translates to:
  /// **'A landmark that draws visitors from across India.'**
  String get statueBullet3;

  /// No description provided for @charitraHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Battle Dioramas: Life-like displays narrating the Battle of Haldighati and other decisive moments.'**
  String get charitraHighlight1;

  /// No description provided for @charitraHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Weapons and Artifacts: Replicas of the swords, shields, and armors used by Rajput warriors.'**
  String get charitraHighlight2;

  /// No description provided for @charitraHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Cultural Galleries: Exhibits showcasing Rajputana lifestyle, costumes, and traditions.'**
  String get charitraHighlight3;

  /// No description provided for @charitraHighlight4.
  ///
  /// In en, this message translates to:
  /// **'Freedom Fighters Section: Honoring India’s heroes who followed Maharana Pratap’s path of courage.'**
  String get charitraHighlight4;

  /// No description provided for @whyVisitUdaipurTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Visit During Your Udaipur Trip?'**
  String get whyVisitUdaipurTitle;

  /// No description provided for @visitBullet1.
  ///
  /// In en, this message translates to:
  /// **'Establish a deeper connection with Rajasthan’s history.'**
  String get visitBullet1;

  /// No description provided for @visitBullet2.
  ///
  /// In en, this message translates to:
  /// **'A chance to learn about Maharana Pratap’s unmatched spirit of freedom.'**
  String get visitBullet2;

  /// No description provided for @visitBullet3.
  ///
  /// In en, this message translates to:
  /// **'An inspiring cultural experience unlike any other tourist site.'**
  String get visitBullet3;

  /// No description provided for @charitraConclusion.
  ///
  /// In en, this message translates to:
  /// **'More than a museum, the Maharana Pratap Charitra Pradarshanee is a place of inspiration. The exhibits and the statue ignite a sense of patriotism and pride in every visitor. It is a reminder that true leadership lies in selflessness, resilience, and honor.'**
  String get charitraConclusion;

  /// No description provided for @faqCharitraQ1.
  ///
  /// In en, this message translates to:
  /// **'What is the Charitra Pradarshanee famous for?'**
  String get faqCharitraQ1;

  /// No description provided for @faqCharitraA1.
  ///
  /// In en, this message translates to:
  /// **'It is famous for its magnificent Maharana Pratap statue and detailed galleries that bring to life the legacy of Maharana Pratap and the history of Mewar.'**
  String get faqCharitraA1;

  /// No description provided for @faqCharitraQ2.
  ///
  /// In en, this message translates to:
  /// **'Where is the Maharana Pratap Statue located?'**
  String get faqCharitraQ2;

  /// No description provided for @faqCharitraA2.
  ///
  /// In en, this message translates to:
  /// **'The grand Maharana Pratap statue is located at the Charitra Pradarshanee inside Pratap Gaurav Kendra, Udaipur.'**
  String get faqCharitraA2;

  /// No description provided for @faqCharitraQ3.
  ///
  /// In en, this message translates to:
  /// **'How long does it take to explore?'**
  String get faqCharitraQ3;

  /// No description provided for @faqCharitraA3.
  ///
  /// In en, this message translates to:
  /// **'Visitors usually spend 2–3 hours exploring the museum, statue, and exhibits in detail.'**
  String get faqCharitraA3;

  /// No description provided for @faqCharitraQ4.
  ///
  /// In en, this message translates to:
  /// **'Is it suitable for families and children?'**
  String get faqCharitraQ4;

  /// No description provided for @faqCharitraA4.
  ///
  /// In en, this message translates to:
  /// **'Yes, the museum is family-friendly and offers a wonderful educational experience for children and adults alike.'**
  String get faqCharitraA4;

  /// No description provided for @faqCharitraQ5.
  ///
  /// In en, this message translates to:
  /// **'Why is the Maharana Pratap Statue important?'**
  String get faqCharitraQ5;

  /// No description provided for @faqCharitraA5.
  ///
  /// In en, this message translates to:
  /// **'It is a cultural landmark that symbolizes bravery and sacrifice, keeping alive the story of Maharana Pratap for generations.'**
  String get faqCharitraA5;

  /// No description provided for @bharatMataMandirTitle.
  ///
  /// In en, this message translates to:
  /// **'Bharat Mata Mandir'**
  String get bharatMataMandirTitle;

  /// No description provided for @bharatMataNarrationText.
  ///
  /// In en, this message translates to:
  /// **'In India, the tradition of worshiping Gram Devi, Sthan Dev, and Matru Devi has been ancient. In Mewar, Jagadamba is worshiped as Rashtra Shyamala, and a temple dedicated to her is located on the way to Kailashpuri...'**
  String get bharatMataNarrationText;

  /// No description provided for @bharatMataNarrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Bharat Mata Mandir Narration'**
  String get bharatMataNarrationLabel;

  /// No description provided for @worshipingRashtraDeviTitle.
  ///
  /// In en, this message translates to:
  /// **'Worshiping the Rashtra Devi'**
  String get worshipingRashtraDeviTitle;

  /// No description provided for @bharatMataDesc1.
  ///
  /// In en, this message translates to:
  /// **'In India, the tradition of worshiping Gram Devi, Sthan Dev, and Matru Devi (Mother Goddess) has been ancient. In Mewar, Jagadamba is worshiped as Rashtra Shyamala, and a temple dedicated to her is located on the way to Kailashpuri near Udaipur. In local tradition, she is referred to as Rathasena Mata.'**
  String get bharatMataDesc1;

  /// No description provided for @bharatMataDesc2.
  ///
  /// In en, this message translates to:
  /// **'This is possibly the oldest temple dedicated to the Rashtra Devi (Mother of India) in the country. During the struggle for independence, Bankim Chandra Chattopadhyay, in his novel \"Anandamath,\" first called for the worship of Bharat Mata and presented an image of the Rashtra Devi, with the anthem \"Vande Mataram\" taking the form of the national song.'**
  String get bharatMataDesc2;

  /// No description provided for @appearanceArchitectureTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance & Architecture'**
  String get appearanceArchitectureTitle;

  /// No description provided for @bharatMataBullet1.
  ///
  /// In en, this message translates to:
  /// **'Adorned in an orange-colored sari, holding a saffron flag in her hand.'**
  String get bharatMataBullet1;

  /// No description provided for @bharatMataBullet2.
  ///
  /// In en, this message translates to:
  /// **'Installed majestically on her vehicle, a lion.'**
  String get bharatMataBullet2;

  /// No description provided for @bharatMataBullet3.
  ///
  /// In en, this message translates to:
  /// **'The temple’s sanctum sanctorum is uniquely octagonal and situated at an elevation.'**
  String get bharatMataBullet3;

  /// No description provided for @bharatMataBullet4.
  ///
  /// In en, this message translates to:
  /// **'Visitors must climb 71 stairs to reach the temple, symbolizing the ascent to national glory and instilling a deep sense of pride.'**
  String get bharatMataBullet4;

  /// No description provided for @meditationRoomTitle.
  ///
  /// In en, this message translates to:
  /// **'Meditation Room'**
  String get meditationRoomTitle;

  /// No description provided for @meditationRoomDesc.
  ///
  /// In en, this message translates to:
  /// **'Just below the temple, a serene meditation room has been set up. After exploring the Pratap Gaurav Kendra, visitors can meditate and contemplate in this beautiful blue-white space, experiencing otherworldly and spiritual bliss.'**
  String get meditationRoomDesc;

  /// No description provided for @guestUser.
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get guestUser;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @bluetoothConnectivity.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth Connectivity'**
  String get bluetoothConnectivity;

  /// No description provided for @connectAudioGuides.
  ///
  /// In en, this message translates to:
  /// **'Connect audio guides'**
  String get connectAudioGuides;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of the application?'**
  String get logoutConfirmationMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @refundReturnsTitle.
  ///
  /// In en, this message translates to:
  /// **'Refund & Returns'**
  String get refundReturnsTitle;

  /// No description provided for @refundPolicyHeader.
  ///
  /// In en, this message translates to:
  /// **'Refund and Returns Policy'**
  String get refundPolicyHeader;

  /// No description provided for @refundPolicyP1.
  ///
  /// In en, this message translates to:
  /// **'Our refund and returns policy lasts 30 days. If 30 days have passed since your purchase, we can’t offer you a full refund or exchange.'**
  String get refundPolicyP1;

  /// No description provided for @refundPolicyP2.
  ///
  /// In en, this message translates to:
  /// **'To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.'**
  String get refundPolicyP2;

  /// No description provided for @refundPolicyP3.
  ///
  /// In en, this message translates to:
  /// **'Several types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.'**
  String get refundPolicyP3;

  /// No description provided for @nonReturnableItemsHeader.
  ///
  /// In en, this message translates to:
  /// **'Additional non-returnable items:'**
  String get nonReturnableItemsHeader;

  /// No description provided for @nonReturnable1.
  ///
  /// In en, this message translates to:
  /// **'Gift cards'**
  String get nonReturnable1;

  /// No description provided for @nonReturnable2.
  ///
  /// In en, this message translates to:
  /// **'Downloadable software products'**
  String get nonReturnable2;

  /// No description provided for @nonReturnable3.
  ///
  /// In en, this message translates to:
  /// **'Some health and personal care items'**
  String get nonReturnable3;

  /// No description provided for @proofOfPurchaseText.
  ///
  /// In en, this message translates to:
  /// **'To complete your return, we require a receipt or proof of purchase. Please do not send your purchase back to the manufacturer.'**
  String get proofOfPurchaseText;

  /// No description provided for @partialRefundsHeader.
  ///
  /// In en, this message translates to:
  /// **'There are certain situations where only partial refunds are granted:'**
  String get partialRefundsHeader;

  /// No description provided for @partialRefund1.
  ///
  /// In en, this message translates to:
  /// **'Book with obvious signs of use.'**
  String get partialRefund1;

  /// No description provided for @partialRefund2.
  ///
  /// In en, this message translates to:
  /// **'CD, DVD, VHS tape, software, video game, cassette tape, or vinyl record that has been opened.'**
  String get partialRefund2;

  /// No description provided for @partialRefund3.
  ///
  /// In en, this message translates to:
  /// **'Any item not in its original condition, is damaged or missing parts for reasons not due to our error.'**
  String get partialRefund3;

  /// No description provided for @partialRefund4.
  ///
  /// In en, this message translates to:
  /// **'Any item that is returned more than 30 days after delivery.'**
  String get partialRefund4;

  /// No description provided for @refundsHeader.
  ///
  /// In en, this message translates to:
  /// **'Refunds'**
  String get refundsHeader;

  /// No description provided for @refundsP1.
  ///
  /// In en, this message translates to:
  /// **'Once your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.'**
  String get refundsP1;

  /// No description provided for @refundsP2.
  ///
  /// In en, this message translates to:
  /// **'If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.'**
  String get refundsP2;

  /// No description provided for @lateMissingRefundsHeader.
  ///
  /// In en, this message translates to:
  /// **'Late or missing refunds'**
  String get lateMissingRefundsHeader;

  /// No description provided for @lateRefund1.
  ///
  /// In en, this message translates to:
  /// **'If you haven’t received a refund yet, first check your bank account again.'**
  String get lateRefund1;

  /// No description provided for @lateRefund2.
  ///
  /// In en, this message translates to:
  /// **'Then contact your credit card company, it may take some time before your refund is officially posted.'**
  String get lateRefund2;

  /// No description provided for @lateRefund3.
  ///
  /// In en, this message translates to:
  /// **'Next contact your bank. There is often some processing time before a refund is posted.'**
  String get lateRefund3;

  /// No description provided for @lateRefund4.
  ///
  /// In en, this message translates to:
  /// **'If you’ve done all of this and you still have not received your refund yet, please contact us at support@pratapgauravkendra.org.'**
  String get lateRefund4;

  /// No description provided for @saleItemsHeader.
  ///
  /// In en, this message translates to:
  /// **'Sale items'**
  String get saleItemsHeader;

  /// No description provided for @saleItemsText.
  ///
  /// In en, this message translates to:
  /// **'Only regular priced items may be refunded. Sale items cannot be refunded.'**
  String get saleItemsText;

  /// No description provided for @exchangesHeader.
  ///
  /// In en, this message translates to:
  /// **'Exchanges'**
  String get exchangesHeader;

  /// No description provided for @exchangesText.
  ///
  /// In en, this message translates to:
  /// **'We only replace items if they are defective or damaged. If you need to exchange it for the same item, send us an email at support@pratapgauravkendra.org and send your item to: Pratap Gaurav Kendra, Udaipur, Rajasthan.'**
  String get exchangesText;

  /// No description provided for @needHelpHeader.
  ///
  /// In en, this message translates to:
  /// **'Need help?'**
  String get needHelpHeader;

  /// No description provided for @needHelpText.
  ///
  /// In en, this message translates to:
  /// **'Contact us at support@pratapgauravkendra.org for questions related to refunds and returns.'**
  String get needHelpText;

  /// No description provided for @cancellationPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Policy'**
  String get cancellationPolicyTitle;

  /// No description provided for @cancellationHeader.
  ///
  /// In en, this message translates to:
  /// **'Cancellation'**
  String get cancellationHeader;

  /// No description provided for @cancellationIntro.
  ///
  /// In en, this message translates to:
  /// **'Veer Shiromani Maharana Pratap Samiti believes in helping its customers as far as possible, and has therefore a liberal cancellation policy. Under this policy:'**
  String get cancellationIntro;

  /// No description provided for @cancellationPoint1.
  ///
  /// In en, this message translates to:
  /// **'Cancellations will be considered only if the request is made immediately after placing the order. However, the cancellation request may not be entertained if the orders have been communicated to the vendors/merchants and they have initiated the process of shipping them.'**
  String get cancellationPoint1;

  /// No description provided for @cancellationPoint2.
  ///
  /// In en, this message translates to:
  /// **'We do not accept cancellation requests for perishable items like flowers, eatables etc. However, refund/replacement can be made if the customer establishes that the quality of product delivered is not good.'**
  String get cancellationPoint2;

  /// No description provided for @cancellationPoint3.
  ///
  /// In en, this message translates to:
  /// **'In case of receipt of damaged or defective items please report the same to our Customer Service team. The request will, however, be entertained once the merchant has checked and determined the same at his own end. This should be reported within 7 days of receipt of the products.'**
  String get cancellationPoint3;

  /// No description provided for @cancellationPoint4.
  ///
  /// In en, this message translates to:
  /// **'In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within 7 days of receiving the product. The Customer Service Team after looking into your complaint will take an appropriate decision.'**
  String get cancellationPoint4;

  /// No description provided for @cancellationPoint5.
  ///
  /// In en, this message translates to:
  /// **'In case of complaints regarding products that come with a warranty from manufacturers, please refer the issue to them.'**
  String get cancellationPoint5;

  /// No description provided for @cancellationPoint6.
  ///
  /// In en, this message translates to:
  /// **'In case of any Refunds approved by the Veer Shiromani Maharana Pratap Samiti, it’ll take 3-5 days for the refund to be processed to the end customer.'**
  String get cancellationPoint6;

  /// No description provided for @editProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfileTitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'FULL NAME'**
  String get fullNameLabel;

  /// No description provided for @enterFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullNameHint;

  /// No description provided for @nameEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get nameEmptyError;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @enterEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmailHint;

  /// No description provided for @invalidEmailError.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get invalidEmailError;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneLabel;

  /// No description provided for @enterPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneHint;

  /// No description provided for @saveChangesBtn.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesBtn;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @languagePreferences.
  ///
  /// In en, this message translates to:
  /// **'Language Preferences'**
  String get languagePreferences;

  /// No description provided for @paymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment History'**
  String get paymentHistory;

  /// No description provided for @refundPolicy.
  ///
  /// In en, this message translates to:
  /// **'Refund Policy'**
  String get refundPolicy;

  /// No description provided for @cancellationPolicy.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Policy'**
  String get cancellationPolicy;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditions;

  /// No description provided for @logoutPrompt.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutPrompt;

  /// No description provided for @navQrScan.
  ///
  /// In en, this message translates to:
  /// **'QR Scan'**
  String get navQrScan;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navShows.
  ///
  /// In en, this message translates to:
  /// **'Shows'**
  String get navShows;

  /// No description provided for @navTickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get navTickets;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @myTicketsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Tickets'**
  String get myTicketsTitle;

  /// No description provided for @bookNewTicketTooltip.
  ///
  /// In en, this message translates to:
  /// **'Book New Ticket'**
  String get bookNewTicketTooltip;

  /// No description provided for @noTicketsYet.
  ///
  /// In en, this message translates to:
  /// **'No Tickets Yet'**
  String get noTicketsYet;

  /// No description provided for @noTicketsDesc.
  ///
  /// In en, this message translates to:
  /// **'Looks like you haven\'t booked any tickets yet. Explore attractions and plan your next visit!'**
  String get noTicketsDesc;

  /// No description provided for @bookATicketBtn.
  ///
  /// In en, this message translates to:
  /// **'Book a Ticket'**
  String get bookATicketBtn;

  /// No description provided for @generalWord.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get generalWord;

  /// No description provided for @ticketWord.
  ///
  /// In en, this message translates to:
  /// **'Ticket'**
  String get ticketWord;

  /// No description provided for @upcomingStatus.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcomingStatus;

  /// No description provided for @pendingStatus.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingStatus;

  /// No description provided for @visitDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Visit Date'**
  String get visitDateLabel;

  /// No description provided for @ticketsLabel.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get ticketsLabel;

  /// No description provided for @personsLabel.
  ///
  /// In en, this message translates to:
  /// **'Persons'**
  String get personsLabel;

  /// No description provided for @totalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalLabel;

  /// No description provided for @ticketDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Ticket Detail'**
  String get ticketDetailTitle;

  /// No description provided for @attractionNameFallback.
  ///
  /// In en, this message translates to:
  /// **'Attraction Name'**
  String get attractionNameFallback;

  /// No description provided for @notAvailableFallback.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailableFallback;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @statusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusLabel;

  /// No description provided for @bookingDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Booking Date'**
  String get bookingDateLabel;

  /// No description provided for @totalPaidLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Paid'**
  String get totalPaidLabel;

  /// No description provided for @ticketsBreakupLabel.
  ///
  /// In en, this message translates to:
  /// **'Tickets Breakup'**
  String get ticketsBreakupLabel;

  /// No description provided for @totalWord.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalWord;

  /// No description provided for @adultsLabel.
  ///
  /// In en, this message translates to:
  /// **'Adults'**
  String get adultsLabel;

  /// No description provided for @infantsLabel.
  ///
  /// In en, this message translates to:
  /// **'Infants'**
  String get infantsLabel;

  /// No description provided for @museumShowsTitle.
  ///
  /// In en, this message translates to:
  /// **'Museum Shows'**
  String get museumShowsTitle;

  /// No description provided for @showsViewWaterLaserTitle.
  ///
  /// In en, this message translates to:
  /// **'Water Laser Show'**
  String get showsViewWaterLaserTitle;

  /// No description provided for @showsViewWaterLaserDesc.
  ///
  /// In en, this message translates to:
  /// **'Experience Panna\'s sacrifice and the historic Battle of Diwer brought to life through a mesmerizing water and laser spectacle.'**
  String get showsViewWaterLaserDesc;

  /// No description provided for @showsViewPopularTag.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get showsViewPopularTag;

  /// No description provided for @showsViewRoboticTitle.
  ///
  /// In en, this message translates to:
  /// **'Robotic Show'**
  String get showsViewRoboticTitle;

  /// No description provided for @showsViewRoboticDesc.
  ///
  /// In en, this message translates to:
  /// **'This show uses advanced mechanical models to narrate various historical tales in an engaging and interactive format.'**
  String get showsViewRoboticDesc;

  /// No description provided for @showsViewDocTitle.
  ///
  /// In en, this message translates to:
  /// **'Documentary Show'**
  String get showsViewDocTitle;

  /// No description provided for @showsViewDocDesc.
  ///
  /// In en, this message translates to:
  /// **'Watch the inspiring documentary of Maharana Pratap, detailing his life, struggles, and ultimate victories.'**
  String get showsViewDocDesc;

  /// No description provided for @showsViewLightSoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Light And Sound Show'**
  String get showsViewLightSoundTitle;

  /// No description provided for @showsViewLightSoundDesc.
  ///
  /// In en, this message translates to:
  /// **'Experience the glorious history of Mewar through an immersive outdoor light and sound narration.'**
  String get showsViewLightSoundDesc;

  /// No description provided for @showsViewEveningTag.
  ///
  /// In en, this message translates to:
  /// **'Evening Only'**
  String get showsViewEveningTag;

  /// No description provided for @showsViewDetailsBtn.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get showsViewDetailsBtn;

  /// No description provided for @diverMahotsavTitle.
  ///
  /// In en, this message translates to:
  /// **'Diwer Vijay Mahotsav 2025'**
  String get diverMahotsavTitle;

  /// No description provided for @vikramSamvat.
  ///
  /// In en, this message translates to:
  /// **'Vikram Samvat: 2082'**
  String get vikramSamvat;

  /// No description provided for @historicalBackground.
  ///
  /// In en, this message translates to:
  /// **'Historical Background'**
  String get historicalBackground;

  /// No description provided for @historyDesc.
  ///
  /// In en, this message translates to:
  /// **'The Battle of Diwer, fought on Vijayadashami in Vikram Samvat 1640, is an epoch-making war in Indian history. Following the Diwer victory under Maharana Pratap\'s leadership, all Mughal outposts were dismantled in the next two to three years. Maharana Pratap re-established his rule over almost the entire Mewar, Wagad, Godwad, up to Malwa. Peace prevailed in Mewar for the next 20-22 years.'**
  String get historyDesc;

  /// No description provided for @upcomingHighlights.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Special Events'**
  String get upcomingHighlights;

  /// No description provided for @event1Date.
  ///
  /// In en, this message translates to:
  /// **'26 September 2025'**
  String get event1Date;

  /// No description provided for @event1Time.
  ///
  /// In en, this message translates to:
  /// **'From 4 PM onwards'**
  String get event1Time;

  /// No description provided for @event1Title.
  ///
  /// In en, this message translates to:
  /// **'Diwer Public Event'**
  String get event1Title;

  /// No description provided for @event2Date.
  ///
  /// In en, this message translates to:
  /// **'12 October 2025'**
  String get event2Date;

  /// No description provided for @event2Time.
  ///
  /// In en, this message translates to:
  /// **'Special for Influencers'**
  String get event2Time;

  /// No description provided for @event2Title.
  ///
  /// In en, this message translates to:
  /// **'Social Media Influencer Meet'**
  String get event2Title;

  /// No description provided for @event2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Digital Marketing & Content Strategy'**
  String get event2Subtitle;

  /// No description provided for @competitionsPrograms.
  ///
  /// In en, this message translates to:
  /// **'Competitions & Programs'**
  String get competitionsPrograms;

  /// No description provided for @quizTitle.
  ///
  /// In en, this message translates to:
  /// **'Online Quiz Competition'**
  String get quizTitle;

  /// No description provided for @quizSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Topic – Maharana Pratap: From Haldighati to Diwer'**
  String get quizSubtitle;

  /// No description provided for @prize1st.
  ///
  /// In en, this message translates to:
  /// **'1st Prize'**
  String get prize1st;

  /// No description provided for @prize2nd.
  ///
  /// In en, this message translates to:
  /// **'2nd Prize'**
  String get prize2nd;

  /// No description provided for @prize3rd.
  ///
  /// In en, this message translates to:
  /// **'3rd Prize'**
  String get prize3rd;

  /// No description provided for @prizeConsolation.
  ///
  /// In en, this message translates to:
  /// **'Consolation (2)'**
  String get prizeConsolation;

  /// No description provided for @quizRules.
  ///
  /// In en, this message translates to:
  /// **'• Sponsor: Nirman Career Academy, Udaipur\n• 3 Categories: Classes 6-8, 9-12, and College.\n• Format: 100 MCQs (1 Hour).\n• Material: Available on the website in PDF format.\n• Registration: Excel sheet upload by Head of Institution.\n\nContact: 9829260309, 9461834208, 8700705071'**
  String get quizRules;

  /// No description provided for @essayTitle.
  ///
  /// In en, this message translates to:
  /// **'Essay Competition'**
  String get essayTitle;

  /// No description provided for @essaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Based on 5 different topics'**
  String get essaySubtitle;

  /// No description provided for @essayTopics.
  ///
  /// In en, this message translates to:
  /// **'Topics:\n1. Maharana Pratap: From Haldighati to Diwer\n2. Battle of Diwer: Festival of Victory\n3. War Strategy of Maharana Pratap\n4. Hero of the Masses: Maharana Pratap\n5. Maharana Pratap: The Great Hero of Social Harmony\n'**
  String get essayTopics;

  /// No description provided for @essayRules.
  ///
  /// In en, this message translates to:
  /// **'• Language: Hindi or English (1500-2000 words).\n• Format: Handwritten, left margin on foolscap paper.\n• Submit: Upload PDF on the website or WhatsApp (9468545516).\n\nContact: 8005816971, 9414156547'**
  String get essayRules;

  /// No description provided for @paintTitle.
  ///
  /// In en, this message translates to:
  /// **'Painting Competition'**
  String get paintTitle;

  /// No description provided for @paintSubtitle.
  ///
  /// In en, this message translates to:
  /// **'From Secondary to Higher Education level'**
  String get paintSubtitle;

  /// No description provided for @prizeSec.
  ///
  /// In en, this message translates to:
  /// **'Secondary Level (Top 5)'**
  String get prizeSec;

  /// No description provided for @prizeSrSec.
  ///
  /// In en, this message translates to:
  /// **'Higher Secondary (Top 5)'**
  String get prizeSrSec;

  /// No description provided for @prizeHigher.
  ///
  /// In en, this message translates to:
  /// **'Higher Education (Top 5)'**
  String get prizeHigher;

  /// No description provided for @eachWord.
  ///
  /// In en, this message translates to:
  /// **'each'**
  String get eachWord;

  /// No description provided for @paintRules.
  ///
  /// In en, this message translates to:
  /// **'• Colors: Watercolors / Oil / Pastels (Bring your own).\n• Sheets: Provided by the committee.\n• Selection: Institutions to send names of top 3 participants to Info@pratapgauravkendra.org or WhatsApp (9468545516). Selected paintings will be displayed in the art gallery.\n\nContact: 9414234955, 9414385701'**
  String get paintRules;

  /// No description provided for @filmTitle.
  ///
  /// In en, this message translates to:
  /// **'Short Film Making Competition'**
  String get filmTitle;

  /// No description provided for @filmSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Topic – Personality and Works of Maharana Pratap'**
  String get filmSubtitle;

  /// No description provided for @filmNSS.
  ///
  /// In en, this message translates to:
  /// **'Co-organizer: National Service Scheme (NSS)'**
  String get filmNSS;

  /// No description provided for @filmRules.
  ///
  /// In en, this message translates to:
  /// **'• Levels: University/College, Division, State Level.\n• Organized through NSS in all universities across Rajasthan.\n\nContact: 9829260309, 7087400453, 8005802574'**
  String get filmRules;

  /// No description provided for @lectureTitle.
  ///
  /// In en, this message translates to:
  /// **'Lecture Series Program'**
  String get lectureTitle;

  /// No description provided for @lectureSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Organized in Udaipur, Chittorgarh, and Rajsamand'**
  String get lectureSubtitle;

  /// No description provided for @lectureRules.
  ///
  /// In en, this message translates to:
  /// **'Lectures by subject experts on the personality of Maharana Pratap and the Battle of Diwer in educational institutions and hostels. A pledge of patriotism will be administered to the new generation.\n\nContact: 9785172992, 9660090556, 9414711071'**
  String get lectureRules;

  /// No description provided for @closingTitle.
  ///
  /// In en, this message translates to:
  /// **'Public Closing Ceremony'**
  String get closingTitle;

  /// No description provided for @closingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Felicitation of Winners'**
  String get closingSubtitle;

  /// No description provided for @closingRules.
  ///
  /// In en, this message translates to:
  /// **'In the program, the top selected participants of the competitions held under the Diwer Vijay Mahotsav will be felicitated.\n\nCoordinator: Ashok Singh Metwala (8209529107)\nCo-coordinator: Paras Singhvi (9414167776)\nCo-coordinator: Jaideep Ameta (9509470784)'**
  String get closingRules;

  /// No description provided for @eventDetailAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Haldighati Vijay 450 Years'**
  String get eventDetailAppBarTitle;

  /// No description provided for @historicalEventLabel.
  ///
  /// In en, this message translates to:
  /// **'Historical Event'**
  String get historicalEventLabel;

  /// No description provided for @eventWelcomeText.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the grand ceremony organized to commemorate the completion of 450 years of the Haldighati victory of Veer Shiromani Maharana Pratap.'**
  String get eventWelcomeText;

  /// No description provided for @eventDateValue.
  ///
  /// In en, this message translates to:
  /// **'17 June 2026'**
  String get eventDateValue;

  /// No description provided for @eventTimeValue.
  ///
  /// In en, this message translates to:
  /// **'09:30 AM'**
  String get eventTimeValue;

  /// No description provided for @eventVenueValue.
  ///
  /// In en, this message translates to:
  /// **'Gandhi Ground, Udaipur'**
  String get eventVenueValue;

  /// No description provided for @lifeJourneyTitle.
  ///
  /// In en, this message translates to:
  /// **'Maharana Pratap: Life Journey'**
  String get lifeJourneyTitle;

  /// No description provided for @tlYear1.
  ///
  /// In en, this message translates to:
  /// **'1540'**
  String get tlYear1;

  /// No description provided for @tlTitle1.
  ///
  /// In en, this message translates to:
  /// **'Birth'**
  String get tlTitle1;

  /// No description provided for @tlDesc1.
  ///
  /// In en, this message translates to:
  /// **'Birth in Kumbhalgarh'**
  String get tlDesc1;

  /// No description provided for @tlYear2.
  ///
  /// In en, this message translates to:
  /// **'1559'**
  String get tlYear2;

  /// No description provided for @tlTitle2.
  ///
  /// In en, this message translates to:
  /// **'Amar Singh\'s Birth'**
  String get tlTitle2;

  /// No description provided for @tlDesc2.
  ///
  /// In en, this message translates to:
  /// **'Birth of successor Amar Singh'**
  String get tlDesc2;

  /// No description provided for @tlYear3.
  ///
  /// In en, this message translates to:
  /// **'1572'**
  String get tlYear3;

  /// No description provided for @tlTitle3.
  ///
  /// In en, this message translates to:
  /// **'Coronation'**
  String get tlTitle3;

  /// No description provided for @tlDesc3.
  ///
  /// In en, this message translates to:
  /// **'Coronation in Gogunda and Kumbhalgarh'**
  String get tlDesc3;

  /// No description provided for @tlYear4.
  ///
  /// In en, this message translates to:
  /// **'1576'**
  String get tlYear4;

  /// No description provided for @tlTitle4.
  ///
  /// In en, this message translates to:
  /// **'Battle of Haldighati'**
  String get tlTitle4;

  /// No description provided for @tlDesc4.
  ///
  /// In en, this message translates to:
  /// **'Historic battle against the Mughals'**
  String get tlDesc4;

  /// No description provided for @tlYear5.
  ///
  /// In en, this message translates to:
  /// **'1577'**
  String get tlYear5;

  /// No description provided for @tlTitle5.
  ///
  /// In en, this message translates to:
  /// **'Period of Struggle'**
  String get tlTitle5;

  /// No description provided for @tlDesc5.
  ///
  /// In en, this message translates to:
  /// **'Guerrilla warfare began to defend Mewar'**
  String get tlDesc5;

  /// No description provided for @tlYear6.
  ///
  /// In en, this message translates to:
  /// **'1578'**
  String get tlYear6;

  /// No description provided for @tlTitle6.
  ///
  /// In en, this message translates to:
  /// **'Bhamashah\'s Cooperation'**
  String get tlTitle6;

  /// No description provided for @tlDesc6.
  ///
  /// In en, this message translates to:
  /// **'Financial assistance for army reorganization'**
  String get tlDesc6;

  /// No description provided for @tlYear7.
  ///
  /// In en, this message translates to:
  /// **'1582'**
  String get tlYear7;

  /// No description provided for @tlTitle7.
  ///
  /// In en, this message translates to:
  /// **'Diwer Victory'**
  String get tlTitle7;

  /// No description provided for @tlDesc7.
  ///
  /// In en, this message translates to:
  /// **'Decisive victory for Mewar'**
  String get tlDesc7;

  /// No description provided for @tlYear8.
  ///
  /// In en, this message translates to:
  /// **'1585'**
  String get tlYear8;

  /// No description provided for @tlTitle8.
  ///
  /// In en, this message translates to:
  /// **'Chavand Capital'**
  String get tlTitle8;

  /// No description provided for @tlDesc8.
  ///
  /// In en, this message translates to:
  /// **'Establishment of the new capital'**
  String get tlDesc8;

  /// No description provided for @tlYear9.
  ///
  /// In en, this message translates to:
  /// **'1588'**
  String get tlYear9;

  /// No description provided for @tlTitle9.
  ///
  /// In en, this message translates to:
  /// **'Zawar Victory'**
  String get tlTitle9;

  /// No description provided for @tlDesc9.
  ///
  /// In en, this message translates to:
  /// **'Re-expansion of Mewar'**
  String get tlDesc9;

  /// No description provided for @tlYear10.
  ///
  /// In en, this message translates to:
  /// **'1597'**
  String get tlYear10;

  /// No description provided for @tlTitle10.
  ///
  /// In en, this message translates to:
  /// **'Ascension to Heaven'**
  String get tlTitle10;

  /// No description provided for @tlDesc10.
  ///
  /// In en, this message translates to:
  /// **'National hero Maharana Pratap became immortal'**
  String get tlDesc10;

  /// No description provided for @visitorInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Visitor Information'**
  String get visitorInfoTitle;

  /// No description provided for @tabInstructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions & Tickets'**
  String get tabInstructions;

  /// No description provided for @tabFacilities.
  ///
  /// In en, this message translates to:
  /// **'Facilities'**
  String get tabFacilities;

  /// No description provided for @timingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Timings & Duration'**
  String get timingsTitle;

  /// No description provided for @timing1.
  ///
  /// In en, this message translates to:
  /// **'• Open Everyday for Audience.'**
  String get timing1;

  /// No description provided for @timing2.
  ///
  /// In en, this message translates to:
  /// **'• Ticket Window: 9:30 AM to 6:00 PM'**
  String get timing2;

  /// No description provided for @timing3.
  ///
  /// In en, this message translates to:
  /// **'• Approx. visit duration: 1.5 Hours (Exhibitions & Robotic Show).'**
  String get timing3;

  /// No description provided for @pricingIndianTitle.
  ///
  /// In en, this message translates to:
  /// **'Ticket Pricing (Indian Citizens)'**
  String get pricingIndianTitle;

  /// No description provided for @pricingInd1.
  ///
  /// In en, this message translates to:
  /// **'• Adults (Above 12 yrs): ₹160 (General Show)'**
  String get pricingInd1;

  /// No description provided for @pricingInd2.
  ///
  /// In en, this message translates to:
  /// **'• Children (5-12 yrs): ₹110'**
  String get pricingInd2;

  /// No description provided for @pricingInd3.
  ///
  /// In en, this message translates to:
  /// **'• Infants (0-4 yrs): FREE with family'**
  String get pricingInd3;

  /// No description provided for @pricingInd4.
  ///
  /// In en, this message translates to:
  /// **'• Live Robotic Show: ₹100 per person (No age concession, major attraction)'**
  String get pricingInd4;

  /// No description provided for @pricingForeignTitle.
  ///
  /// In en, this message translates to:
  /// **'Ticket Pricing (Foreign Tourists)'**
  String get pricingForeignTitle;

  /// No description provided for @pricingFor1.
  ///
  /// In en, this message translates to:
  /// **'• Adults (Above 12 yrs): ₹460'**
  String get pricingFor1;

  /// No description provided for @pricingFor2.
  ///
  /// In en, this message translates to:
  /// **'• Children (5-12 yrs): ₹260'**
  String get pricingFor2;

  /// No description provided for @pricingFor3.
  ///
  /// In en, this message translates to:
  /// **'• Infants (0-4 yrs): FREE'**
  String get pricingFor3;

  /// No description provided for @pricingFor4.
  ///
  /// In en, this message translates to:
  /// **'• Note: Includes all shows and headphones.'**
  String get pricingFor4;

  /// No description provided for @schoolGroupsTitle.
  ///
  /// In en, this message translates to:
  /// **'School & College Groups'**
  String get schoolGroupsTitle;

  /// No description provided for @schoolGrp1.
  ///
  /// In en, this message translates to:
  /// **'• Students & Staff: ₹50 per person (General Show)'**
  String get schoolGrp1;

  /// No description provided for @schoolGrp2.
  ///
  /// In en, this message translates to:
  /// **'• Advance booking is strictly required.'**
  String get schoolGrp2;

  /// No description provided for @schoolGrp3.
  ///
  /// In en, this message translates to:
  /// **'• No concession available for the Robotic Show.'**
  String get schoolGrp3;

  /// No description provided for @guidelinesTitle.
  ///
  /// In en, this message translates to:
  /// **'Guidelines & Rules'**
  String get guidelinesTitle;

  /// No description provided for @guideline1.
  ///
  /// In en, this message translates to:
  /// **'• Mobile phones and cameras must be switched off inside the Kendra.'**
  String get guideline1;

  /// No description provided for @guideline2.
  ///
  /// In en, this message translates to:
  /// **'• Smoking, alcohol consumption, and banned substances are strictly prohibited inside the campus and parking.'**
  String get guideline2;

  /// No description provided for @guideline3.
  ///
  /// In en, this message translates to:
  /// **'• The management reserves all rights to entry.'**
  String get guideline3;

  /// No description provided for @humbleRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'A Humble Request'**
  String get humbleRequestTitle;

  /// No description provided for @humbleRequestDesc.
  ///
  /// In en, this message translates to:
  /// **'Your visit to Pratap Gaurav Kendra Rashtriya Tirth is a pilgrimage to a sacred center of Bharat’s Cultural traditions and values. We request your support to maintain the peace, dignity, and divinity of the complex.'**
  String get humbleRequestDesc;

  /// No description provided for @facCanteenTitle.
  ///
  /// In en, this message translates to:
  /// **'Canteen & Dining'**
  String get facCanteenTitle;

  /// No description provided for @facCanteenDesc.
  ///
  /// In en, this message translates to:
  /// **'Paid vegetarian meals and snacks are available. A separate dining hall is operated inside the museum. Prior registration is possible for larger groups.'**
  String get facCanteenDesc;

  /// No description provided for @facRestroomsTitle.
  ///
  /// In en, this message translates to:
  /// **'Restrooms'**
  String get facRestroomsTitle;

  /// No description provided for @facRestroomsDesc.
  ///
  /// In en, this message translates to:
  /// **'Public utility centers are established across the campus with facilities for basic sanitation, toilets, and handwashing.'**
  String get facRestroomsDesc;

  /// No description provided for @facWaterTitle.
  ///
  /// In en, this message translates to:
  /// **'Free Drinking Water'**
  String get facWaterTitle;

  /// No description provided for @facWaterDesc.
  ///
  /// In en, this message translates to:
  /// **'R.O. systems providing cold and ambient water are installed at various locations. No need to buy water upon entering.'**
  String get facWaterDesc;

  /// No description provided for @facMedicalTitle.
  ///
  /// In en, this message translates to:
  /// **'Primary Medical Assistance'**
  String get facMedicalTitle;

  /// No description provided for @facMedicalDesc.
  ///
  /// In en, this message translates to:
  /// **'Basic primary healthcare arrangements are available for emergencies. (Note: No full pharmacy is on-site).'**
  String get facMedicalDesc;

  /// No description provided for @facWheelchairTitle.
  ///
  /// In en, this message translates to:
  /// **'Wheelchair Facility'**
  String get facWheelchairTitle;

  /// No description provided for @facWheelchairDesc.
  ///
  /// In en, this message translates to:
  /// **'Free wheelchairs are provided for differently-abled and elderly visitors. Must be operated by the visitor’s family/caregiver.'**
  String get facWheelchairDesc;

  /// No description provided for @facParkingTitle.
  ///
  /// In en, this message translates to:
  /// **'Parking Space'**
  String get facParkingTitle;

  /// No description provided for @facParkingDesc.
  ///
  /// In en, this message translates to:
  /// **'Paid parking facilities are available on the premises for tourist vehicles.'**
  String get facParkingDesc;

  /// No description provided for @facCookingTitle.
  ///
  /// In en, this message translates to:
  /// **'Group Cooking Area'**
  String get facCookingTitle;

  /// No description provided for @facCookingDesc.
  ///
  /// In en, this message translates to:
  /// **'A paid space is available for groups who wish to cook their own meals. Includes access to a dining hall and water (BYO amenities).'**
  String get facCookingDesc;

  /// No description provided for @profileInstructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get profileInstructions;

  /// No description provided for @showDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Show Details'**
  String get showDetailsTitle;

  /// No description provided for @waterShowTitle.
  ///
  /// In en, this message translates to:
  /// **'Water Laser Show'**
  String get waterShowTitle;

  /// No description provided for @waterShowDuration.
  ///
  /// In en, this message translates to:
  /// **'Approx. 30 Minutes'**
  String get waterShowDuration;

  /// No description provided for @waterShowTiming.
  ///
  /// In en, this message translates to:
  /// **'Starts at 7:30 PM'**
  String get waterShowTiming;

  /// No description provided for @waterShowS1Title.
  ///
  /// In en, this message translates to:
  /// **'Experience the Legend'**
  String get waterShowS1Title;

  /// No description provided for @waterShowS1P1.
  ///
  /// In en, this message translates to:
  /// **'Experience the legendary tale of Maharana Pratap brought to life through an advanced laser projection show on water screens. Witness the heroic moments of Mewar’s history, including Panna’s sacrifice and the Battle of Diwer.'**
  String get waterShowS1P1;

  /// No description provided for @waterShowS1P2.
  ///
  /// In en, this message translates to:
  /// **'Immerse yourself in the glorious past of Mewar as the Maharana Pratap story in Hindi unfolds before your eyes, blending history and technology seamlessly. The show uses cutting-edge visuals and sound to depict the courage and valor of one of India’s greatest warriors. Don’t miss this stunning tribute to the legendary king!'**
  String get waterShowS1P2;

  /// No description provided for @waterShowS2Title.
  ///
  /// In en, this message translates to:
  /// **'Relive Maharana Pratap’s Story'**
  String get waterShowS2Title;

  /// No description provided for @waterShowS2P1.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra Udaipur presents the Water Laser Show, a unique experience where history is displayed through lights, water, and sound. The program highlights the Maharana Pratap Story in Hindi, allowing visitors to connect with the life, bravery, and legacy of the great warrior. With advanced laser projections, traditional music, and powerful narration, the show combines entertainment with cultural learning, making it one of the most engaging evening attractions in Udaipur.'**
  String get waterShowS2P1;

  /// No description provided for @waterShowS3Title.
  ///
  /// In en, this message translates to:
  /// **'One Show That Tourists Shouldn’t Miss'**
  String get waterShowS3Title;

  /// No description provided for @waterShowS3P1.
  ///
  /// In en, this message translates to:
  /// **'The Water Laser Show is designed to take audiences on a journey through Mewar’s history. Each scene showcases important episodes from the Maharana Pratap Story in Hindi, including his struggle for freedom and his dedication to the people of Mewar.'**
  String get waterShowS3P1;

  /// No description provided for @waterShowHighlightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Highlights of the Show'**
  String get waterShowHighlightsTitle;

  /// No description provided for @waterShowHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Laser lights and water projections creating dynamic visuals'**
  String get waterShowHighlight1;

  /// No description provided for @waterShowHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Clear narration in Hindi for cultural connection'**
  String get waterShowHighlight2;

  /// No description provided for @waterShowHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Music inspired by Rajasthan’s heritage'**
  String get waterShowHighlight3;

  /// No description provided for @waterShowHighlight4.
  ///
  /// In en, this message translates to:
  /// **'A meaningful experience for visitors of all ages'**
  String get waterShowHighlight4;

  /// No description provided for @waterShowS4Title.
  ///
  /// In en, this message translates to:
  /// **'Reliving the Legacy of Maharana Pratap'**
  String get waterShowS4Title;

  /// No description provided for @waterShowS4Sub1.
  ///
  /// In en, this message translates to:
  /// **'The Warrior’s Journey'**
  String get waterShowS4Sub1;

  /// No description provided for @waterShowS4P1.
  ///
  /// In en, this message translates to:
  /// **'The show reflects the courage of Maharana Pratap during the Mughal conflicts and his determination to protect Mewar’s independence. Episodes like the Battle of Haldighati are recreated with light and sound to engage the audience.'**
  String get waterShowS4P1;

  /// No description provided for @waterShowS4Sub2.
  ///
  /// In en, this message translates to:
  /// **'A Blend of Learning and Entertainment'**
  String get waterShowS4Sub2;

  /// No description provided for @waterShowS4P2.
  ///
  /// In en, this message translates to:
  /// **'This performance not only entertains but also educates. By presenting the Maharana Pratap Story in Hindi, the Water Laser Show makes history accessible and easy to understand for everyone.'**
  String get waterShowS4P2;

  /// No description provided for @waterShowS5Title.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Pratap Gaurav Kendra?'**
  String get waterShowS5Title;

  /// No description provided for @waterShowS5Point1.
  ///
  /// In en, this message translates to:
  /// **'Dedicated to Maharana Pratap’s life and Mewar’s history'**
  String get waterShowS5Point1;

  /// No description provided for @waterShowS5Point2.
  ///
  /// In en, this message translates to:
  /// **'Use of modern technology to present traditional stories'**
  String get waterShowS5Point2;

  /// No description provided for @waterShowS5Point3.
  ///
  /// In en, this message translates to:
  /// **'Convenient location for travelers in Udaipur'**
  String get waterShowS5Point3;

  /// No description provided for @waterShowS5Point4.
  ///
  /// In en, this message translates to:
  /// **'Ideal evening activity after sightseeing'**
  String get waterShowS5Point4;

  /// No description provided for @waterShowS5Point5.
  ///
  /// In en, this message translates to:
  /// **'Suitable for students, families, and history lovers'**
  String get waterShowS5Point5;

  /// No description provided for @waterShowS6Title.
  ///
  /// In en, this message translates to:
  /// **'Plan Your Visit'**
  String get waterShowS6Title;

  /// No description provided for @waterShowS6P1.
  ///
  /// In en, this message translates to:
  /// **'The Water Laser Show at Pratap Gaurav Kendra is an inspiring way to explore Rajasthan’s cultural and historical heritage. By combining modern visuals with the Maharana Pratap Story in Hindi, the show connects audiences with the legacy of one of India’s greatest warriors.\n\nBook your visit today and experience the story of Maharana Pratap through lights, music, and water in Udaipur.'**
  String get waterShowS6P1;

  /// No description provided for @faqWaterQ1.
  ///
  /// In en, this message translates to:
  /// **'What story does the Water Laser Show present?'**
  String get faqWaterQ1;

  /// No description provided for @faqWaterA1.
  ///
  /// In en, this message translates to:
  /// **'It presents the Maharana Pratap Story in Hindi, highlighting his bravery and legacy.'**
  String get faqWaterA1;

  /// No description provided for @faqWaterQ2.
  ///
  /// In en, this message translates to:
  /// **'Is the show suitable for children?'**
  String get faqWaterQ2;

  /// No description provided for @faqWaterA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, the visuals and narration are simple and engaging for children.'**
  String get faqWaterA2;

  /// No description provided for @faqWaterQ3.
  ///
  /// In en, this message translates to:
  /// **'How long does the show last?'**
  String get faqWaterQ3;

  /// No description provided for @faqWaterA3.
  ///
  /// In en, this message translates to:
  /// **'The show runs for about 30–40 minutes.'**
  String get faqWaterA3;

  /// No description provided for @faqWaterQ4.
  ///
  /// In en, this message translates to:
  /// **'Can non-Hindi speakers enjoy the show?'**
  String get faqWaterQ4;

  /// No description provided for @faqWaterA4.
  ///
  /// In en, this message translates to:
  /// **'Yes, the visuals, music, and effects ensure that the story is understandable even without Hindi knowledge.'**
  String get faqWaterA4;

  /// No description provided for @faqWaterQ5.
  ///
  /// In en, this message translates to:
  /// **'Where is the Water Laser Show hosted?'**
  String get faqWaterQ5;

  /// No description provided for @faqWaterA5.
  ///
  /// In en, this message translates to:
  /// **'The show is hosted at Pratap Gaurav Kendra, Udaipur.'**
  String get faqWaterA5;

  /// No description provided for @bookTicketBtn.
  ///
  /// In en, this message translates to:
  /// **'Book Ticket'**
  String get bookTicketBtn;

  /// No description provided for @templeDetailVinayakTitle.
  ///
  /// In en, this message translates to:
  /// **'Shri Riddhi Siddhi Vinayak Temple'**
  String get templeDetailVinayakTitle;

  /// No description provided for @templeDetailVinayakDesc.
  ///
  /// In en, this message translates to:
  /// **'The first revered temple in Bhaktidham is dedicated to Lord Ganesha and is known as Shri Riddhi Siddhi Vinayak Temple. The founder and bestower of intellect, the temple houses the enchanting idol of Lord Ganesha, accompanied by Riddhi-Siddhi and his vahana (vehicle) Mushak. Visitors desiring to perform special worship and archana for Lord Ganesha can register in advance for the same.'**
  String get templeDetailVinayakDesc;

  /// No description provided for @templeDetailShreenathTitle.
  ///
  /// In en, this message translates to:
  /// **'ShreeNath Ji Mandir'**
  String get templeDetailShreenathTitle;

  /// No description provided for @templeDetailShreenathDesc.
  ///
  /// In en, this message translates to:
  /// **'Located approximately 41 kilometers from Udaipur in the village of Sinhad, now known as Shreenathdwar, Shri Shreenath Ji is the main seat of the Vallabh Sampradaya (Pushtimarg or Shuddhadvaita philosophy) dedicated to the childhood form of Lord Krishna, the beloved Ladle Lal Shri Krishna. The temple houses an image of Shri Shreenath Ji, and the deity’s replica is consecrated in Bhaktidham. The custodians of this temple are followers of Pushtimarg and are devoted to the worship of Shri Thakurji in accordance with the Pushtimarg traditions. Visitors can fulfill their desires by registering in advance for the pilgrimage to fulfill the wishes of Shri Shreenath Ji. According to Pushtimarg literature, orders from Aurangzeb led to the destruction of the idols and temples of both Shri Shreenath Ji and Giriraj Ji. Later, the divine images were brought to Mevad by the Mahant Shri Gusainji Damodarlal Ji from Mathura. Due to Aurangzeb’s fear, no state provided protection to the idols. Finally, Maharana Raj Singh of Mewar invited them to Mewar. In Samvat 1728, during the month of Kartik, Shri Shreenath Ji arrived in Sinhad. The temple was built, and their Patotsav (ceremonial worship) was celebrated on the seventh Saturday of the dark fortnight in the month of Phalgun.'**
  String get templeDetailShreenathDesc;

  /// No description provided for @templeDetailDwarkadhishTitle.
  ///
  /// In en, this message translates to:
  /// **'Shree Dwarkadhish Ji Mandir'**
  String get templeDetailDwarkadhishTitle;

  /// No description provided for @templeDetailDwarkadhishDesc.
  ///
  /// In en, this message translates to:
  /// **'The third seat of Shri Dwarikadheesh Ji, associated with the Vallabh Sampradaya (Path of Grace or Pure Non-dualism Philosophy), is located in the palace on the banks of the Pala in Aasotiya village, 68 kilometers away from Udaipur in the Rajasamand district. Currently, Aasotiya is known as Kankroli, and Rajasamand is the district headquarters. Established in the form of the deity Dwarikadheesh, the mountain associated with the teachings of Shri Vallabhacharya, the third son of Shri Vallabhacharya, Balakrishnalal Ji, is present here in a servitor form. According to the Shrimad Bhagavat Mahapuran, they have previously manifested as a servitor to King Ambarish. They were established here a year prior to the arrival of Shri Nath Ji in Mewar. At this place, one can register their desires and perform manorath by coming here through prior registration.'**
  String get templeDetailDwarkadhishDesc;

  /// No description provided for @templeDetailCharbhujaTitle.
  ///
  /// In en, this message translates to:
  /// **'Shree Charbhuja Ji Mandir'**
  String get templeDetailCharbhujaTitle;

  /// No description provided for @templeDetailCharbhujaDesc.
  ///
  /// In en, this message translates to:
  /// **'Temples of Lord Charbhujanath are established in every village in Mewar, making it clear that the Vaishnav tradition in Mewar has been influenced by the Smarta tradition for about 1000 years and is still prevalent in the local customs. The deity Charbhujanath is enshrined near the village of Sevantri, about 90 kilometers away from Udaipur, in the fort of Gadbore. The worship practices here have evolved by combining Smarta and other traditions according to the time but still show a strong influence of the Smarta tradition. The main festival here is Devjhooleeni Ekadashi, where the deity is taken to the nearby Ganga site (water reservoir) for immersion. On this day, more than 100,000 devotees gather in Gadbore. The preferred deity of the people of Mewar, Charbhujanath, is established in the Prabhu Gorav Kendra of the Bhakti Dham. The main ritual involves taking the festival deity for a bath in the nearby water reservoir. Registration for personal desires can also be done at this location.'**
  String get templeDetailCharbhujaDesc;

  /// No description provided for @templeDetailEklingTitle.
  ///
  /// In en, this message translates to:
  /// **'Shree Ekling Nath Ji Mandir'**
  String get templeDetailEklingTitle;

  /// No description provided for @templeDetailEklingDesc.
  ///
  /// In en, this message translates to:
  /// **'Shri Ekalings Ji is the principal deity of the Mevad region and the main seat of the Lakulish tradition in India. It is located in the village of Kailaspuri, 22 kilometers from Udaipur. It is accepted as the chosen deity of Mevad and is consecrated by Maharaja Adhiraj. According to the records of Bappa Rawal, the temple was built by him in the year 724 AD. At that time, a Ban Ling (Shiva Linga with an arrow-shaped top) was installed. In the 15th century, Maharana Raimal renovated the temple and installed a Panchamukha Shiva Linga according to the traditions of the Lakulish sect. The Panchamukha Shiva Linga represents the five faces of Shiva, with the east facing being Sadyojat (Earth), west facing Vamadeva (Water), south facing Aghor (Fire), north facing Tatpurush (Air), and upward facing Ishan (Sky). In the temple complex, there is also a Vaishnav temple dedicated to Vindhyavasini along with Lakulish. Pratap Gaurav Kendra in Bhakti Dham also has an idol of Panchamukha Ekalings Nath. Rudrabhishek is organized on the occasion of Mahashivratri.'**
  String get templeDetailEklingDesc;

  /// No description provided for @templeDetailSawariyaTitle.
  ///
  /// In en, this message translates to:
  /// **'Shree Sawariya Ji Mandir'**
  String get templeDetailSawariyaTitle;

  /// No description provided for @templeDetailSawariyaDesc.
  ///
  /// In en, this message translates to:
  /// **'Shri Sanwaliya Ji, an ancient manifestation, has been revered by the Ramandi Vairagi Vaishnavas for about 450 years. The temple is located in Mandaphiya village, approximately 79 kilometers from Udaipur. Similar forms of Sanwaliya Ji are also worshipped in other places in Mevad, such as the Lakhad Shyam temple near Jagat-Bambor and Kotdi Charbujanath near Uthrad. The idol of Krishna in the form of Chaturbhuj Vishnu is enshrined here. Sanwaliya Ji is considered the form of Krishna with Chaturbhuj Vishnu. Devotees can register and perform worship and Rudrabhishek on the occasion of Mahashivratri in the Bhakti Dham.'**
  String get templeDetailSawariyaDesc;

  /// No description provided for @templeDetailChamundaTitle.
  ///
  /// In en, this message translates to:
  /// **'Shree Chamunda Mata Mandir'**
  String get templeDetailChamundaTitle;

  /// No description provided for @templeDetailChamundaDesc.
  ///
  /// In en, this message translates to:
  /// **'The worship of Mahishasuramardini has been a tradition in Mevad since ancient times. While Goddess Bayan Mata is considered the Kul Devi of Mevad, Chamunda Mata is the preferred deity of most Maharajas. Maharana Pratap established the Chamunda Mata Temple in Chavand after the battle. Chavand is approximately 64 kilometers away from Udaipur. Various Chamunda Mata temples are present in different locations in Mevad. The Chamunda Mata Temple in Pratap Gaurav Kendra organizes special worship and rituals not only during both Navaratris but also during the Gupta Navratris. Devotees can register for Durga Puja and perform it according to Vaishnav traditions.'**
  String get templeDetailChamundaDesc;

  /// No description provided for @templeDetailKesariyaTitle.
  ///
  /// In en, this message translates to:
  /// **'Shree Kesariya Ji Mandir'**
  String get templeDetailKesariyaTitle;

  /// No description provided for @templeDetailKesariyaDesc.
  ///
  /// In en, this message translates to:
  /// **'In Mevad, there are several Jain Tirths, and one of the prominent ones is the temple of Lord Adinath (Rishabhadev) in Dhulev. Kesharia Ji or Dhulev village is about 65 kilometers away from Udaipur. Lord Rishabhadev is worshipped here by followers of Jain, Vaishnav, and Shaiva traditions. The Bhil community also considers him as Pashupati in the Shaiva tradition. The Jain temple celebrates a grand festival on Chaitra Krishna Saptami, marking the birth anniversary of Lord Rishabhadev. The temple is a unique place where Vedic and non-Vedic worship of the deity takes place. It is a symbol of religious harmony where Lord Rishabhadev is worshipped with saffron paste, symbolizing Jain tradition.'**
  String get templeDetailKesariyaDesc;

  /// No description provided for @templeDetailRamDarbarTitle.
  ///
  /// In en, this message translates to:
  /// **'Shree Ram Darbar Mandir'**
  String get templeDetailRamDarbarTitle;

  /// No description provided for @templeDetailRamDarbarDesc.
  ///
  /// In en, this message translates to:
  /// **'The Bhakti Dham in Pratap Gaurav Kendra houses the Ram Darbar, where idols of Lord Shri Ramchandra Ji, Mata Janaki, Shri Lakshman Ji, and Shri Hanuman Ji are installed.'**
  String get templeDetailRamDarbarDesc;

  /// No description provided for @bharatDarshanTitle.
  ///
  /// In en, this message translates to:
  /// **'Bharat Darshan Light and Sound Show'**
  String get bharatDarshanTitle;

  /// No description provided for @bharatDarshanDesc1.
  ///
  /// In en, this message translates to:
  /// **'The 18-minute light and sound show at Maharana Pratap Memorial Udaipur, located in Pratap Gaurav Kendra, Udaipur, beautifully showcases India’s rich cultural heritage. It highlights the country’s geographical landmarks, including rivers, mountains, and famous pilgrimage sites. The show also honors the greatness of Indian heroes, heroines, and saints, from Kashmir to Kanyakumari and Atak to Cuttack.'**
  String get bharatDarshanDesc1;

  /// No description provided for @bharatDarshanDesc2.
  ///
  /// In en, this message translates to:
  /// **'Located at the historic Maharana Pratap Memorial Udaipur within Pratap Gaurav Kendra, Udaipur, this show inspires visitors by sharing the legacy of brave warriors and the spirit of India’s cultural unity. It’s a must-see experience for those who want to connect with the country’s glorious past.'**
  String get bharatDarshanDesc2;

  /// No description provided for @bharatDarshanDesc3.
  ///
  /// In en, this message translates to:
  /// **'The Bharat Darshan Light and Sound Show at Pratap Gaurav Kendra Udaipur is a breathtaking 18-minute spectacle that celebrates India’s unity in diversity. Through vibrant lights, immersive sound effects, and captivating narration, it showcases the nation’s geographical wonders, spiritual landmarks, and heroic legacy. From the icy peaks of Kashmir to the southern tip of Kanyakumari, the show takes visitors on a mesmerizing journey across the length and breadth of India, honoring warriors, saints, and visionaries who shaped the nation.'**
  String get bharatDarshanDesc3;

  /// No description provided for @visualJourneyTitle.
  ///
  /// In en, this message translates to:
  /// **'A Visual and Emotional Journey Across India'**
  String get visualJourneyTitle;

  /// No description provided for @visualJourneyDesc1.
  ///
  /// In en, this message translates to:
  /// **'The Bharat Darshan Light and Sound Show is more than just a presentation—it’s a heartfelt tribute to India’s timeless heritage. Staged in a darkened hall, the experience combines illuminated 3D models, synchronized lighting, and a powerful audio script to bring India’s history and geography vividly to life.'**
  String get visualJourneyDesc1;

  /// No description provided for @visualJourneyDesc2.
  ///
  /// In en, this message translates to:
  /// **'Learn about the bravery and legacy of Mewar through Maharana Pratap History.'**
  String get visualJourneyDesc2;

  /// No description provided for @significanceTitle.
  ///
  /// In en, this message translates to:
  /// **'The Significance of Pratap Gaurav Kendra Udaipur'**
  String get significanceTitle;

  /// No description provided for @significanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Located in the heart of Udaipur, Pratap Gaurav Kendra is a cultural landmark dedicated to the legendary Rajput king Maharana Pratap. Known for his valor and unyielding spirit during the Battle of Haldighati, Maharana Pratap remains an enduring symbol of courage and patriotism.'**
  String get significanceDesc;

  /// No description provided for @pgkAimsTitle.
  ///
  /// In en, this message translates to:
  /// **'Pratap Gaurav Kendra aims to:'**
  String get pgkAimsTitle;

  /// No description provided for @pgkAim1.
  ///
  /// In en, this message translates to:
  /// **'Educate visitors about the life and legacy of Maharana Pratap.'**
  String get pgkAim1;

  /// No description provided for @pgkAim2.
  ///
  /// In en, this message translates to:
  /// **'Preserve and promote Indian cultural values.'**
  String get pgkAim2;

  /// No description provided for @pgkAim3.
  ///
  /// In en, this message translates to:
  /// **'Foster historical awareness through interactive exhibits and shows like the Bharat Darshan Light and Sound Show.'**
  String get pgkAim3;

  /// No description provided for @whyStandOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Why the Bharat Darshan Show Stands Out'**
  String get whyStandOutTitle;

  /// No description provided for @standOut1Title.
  ///
  /// In en, this message translates to:
  /// **'Immersive Storytelling'**
  String get standOut1Title;

  /// No description provided for @standOut1Desc.
  ///
  /// In en, this message translates to:
  /// **'High-quality visuals and realistic sound effects make you feel as if you are traveling across India in just 18 minutes.'**
  String get standOut1Desc;

  /// No description provided for @standOut2Title.
  ///
  /// In en, this message translates to:
  /// **'Educational Value'**
  String get standOut2Title;

  /// No description provided for @standOut2Desc.
  ///
  /// In en, this message translates to:
  /// **'An engaging way to learn about Indian history, geography, and cultural diversity—perfect for school and college students.'**
  String get standOut2Desc;

  /// No description provided for @standOut3Title.
  ///
  /// In en, this message translates to:
  /// **'Emotional Connection'**
  String get standOut3Title;

  /// No description provided for @standOut3Desc.
  ///
  /// In en, this message translates to:
  /// **'For patriotic visitors, it’s a moving reminder of the sacrifices and contributions that built the nation.'**
  String get standOut3Desc;

  /// No description provided for @planVisitTitle.
  ///
  /// In en, this message translates to:
  /// **'Plan Your Visit Today'**
  String get planVisitTitle;

  /// No description provided for @planVisitDesc1.
  ///
  /// In en, this message translates to:
  /// **'The Bharat Darshan Light and Sound Show at Pratap Gaurav Kendra Udaipur is more than an attraction—it’s an inspiring journey through the heart of India. Whether you are a student, tourist, or history enthusiast, this immersive experience offers a rare opportunity to witness the nation’s beauty, bravery, and unity in a single sitting.'**
  String get planVisitDesc1;

  /// No description provided for @planVisitDesc2.
  ///
  /// In en, this message translates to:
  /// **'Plan your visit today and be part of a show that celebrates India’s glorious past and vibrant present.'**
  String get planVisitDesc2;

  /// No description provided for @faqBharatQ1.
  ///
  /// In en, this message translates to:
  /// **'Where is the Bharat Darshan Light and Sound Show held?'**
  String get faqBharatQ1;

  /// No description provided for @faqBharatA1.
  ///
  /// In en, this message translates to:
  /// **'It is held at Pratap Gaurav Kendra in Udaipur.'**
  String get faqBharatA1;

  /// No description provided for @faqBharatQ2.
  ///
  /// In en, this message translates to:
  /// **'How long is the show?'**
  String get faqBharatQ2;

  /// No description provided for @faqBharatA2.
  ///
  /// In en, this message translates to:
  /// **'The show runs for approximately 18 minutes.'**
  String get faqBharatA2;

  /// No description provided for @faqBharatQ3.
  ///
  /// In en, this message translates to:
  /// **'Is it suitable for children?'**
  String get faqBharatQ3;

  /// No description provided for @faqBharatA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, it’s family-friendly and educational for all age groups.'**
  String get faqBharatA3;
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
