import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
// Import your generated localization file
import 'package:pgk_ticket_app/l10n/app_localizations.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "PGK Ticket App",

      // -- GetX Routing Setup --
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      // -- Localization Setup --
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Set the default starting language ('en' for English, 'hi' for Hindi)
      locale: const Locale('en'),

      // The fallback language if the device's locale is not supported
      fallbackLocale: const Locale('en'),

      // Removes the debug banner in the top right corner
      debugShowCheckedModeBanner: false,
    ),
  );
}