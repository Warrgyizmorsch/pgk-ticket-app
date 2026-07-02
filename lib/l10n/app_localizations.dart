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

  /// No description provided for @temple1Title.
  ///
  /// In en, this message translates to:
  /// **'Shri Riddhi Siddhi Vinayak Temple'**
  String get temple1Title;

  /// No description provided for @temple1Desc.
  ///
  /// In en, this message translates to:
  /// **'The first revered temple in Bhaktidham is dedicated to Lord Ganesha, the remover of obstacles. This beautifully crafted shrine marks the auspicious beginning of the spiritual journey within the complex. Visitors always start their prayers here to ensure a blessed and peaceful visit.'**
  String get temple1Desc;

  /// No description provided for @temple2Title.
  ///
  /// In en, this message translates to:
  /// **'ShreeNath Ji Mandir'**
  String get temple2Title;

  /// No description provided for @temple2Desc.
  ///
  /// In en, this message translates to:
  /// **'Located approximately 41 kilometers from Udaipur in the village of Nathdwara, this replica pays homage to the primary deity of the Pushtimarg sect. The idol reflects intricate art, devotion, and the deep-rooted faith of the Vallabh Sampradaya followers across India.'**
  String get temple2Desc;

  /// No description provided for @temple3Title.
  ///
  /// In en, this message translates to:
  /// **'Shree Dwarkadhish Ji Mandir'**
  String get temple3Title;

  /// No description provided for @temple3Desc.
  ///
  /// In en, this message translates to:
  /// **'The third seat of Shri Dwarkadheesh Ji, closely associated with the Vallabh tradition. This gorgeous temple recreation captures the spiritual essence of the famous shrine located in Kankroli, near Rajsamand Lake, allowing devotees to experience its divine presence.'**
  String get temple3Desc;

  /// No description provided for @temple4Title.
  ///
  /// In en, this message translates to:
  /// **'Shree Charbhuja Ji Mandir'**
  String get temple4Title;

  /// No description provided for @temple4Desc.
  ///
  /// In en, this message translates to:
  /// **'Temples of Lord Charbhujanath are established in almost every village in Mewar. This particular shrine honors the four-armed deity, who is deeply revered by the local Rajput community for bringing protection, prosperity, and peace to their families and land.'**
  String get temple4Desc;

  /// No description provided for @temple5Title.
  ///
  /// In en, this message translates to:
  /// **'Shree Ekling Nath Ji Mandir'**
  String get temple5Title;

  /// No description provided for @temple5Desc.
  ///
  /// In en, this message translates to:
  /// **'Shri Ekaling Ji is the principal deity of the Mewad region and the ruling deity of the Maharana themselves. This monumental replica brings the magnificent architectural grandeur of the original ancient Kailashpuri temple directly to the visitors of Bhakti Dham.'**
  String get temple5Desc;

  /// No description provided for @temple6Title.
  ///
  /// In en, this message translates to:
  /// **'Shree Sawariya Ji Mandir'**
  String get temple6Title;

  /// No description provided for @temple6Desc.
  ///
  /// In en, this message translates to:
  /// **'Shri Sanwaliya ji, a highly revered ancient manifestation of Lord Krishna, has been worshipped by merchants and traders for centuries. This vibrant shrine beautifully reflects the immense faith, wealth, and cultural richness of the Mewar trading community.'**
  String get temple6Desc;

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
  /// **'Nationality:'**
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
  /// **'Kids (6-12 Years)'**
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
  /// **'BOOK NOW'**
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
