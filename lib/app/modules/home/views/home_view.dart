import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import 'package:pgk_ticket_app/l10n/app_localizations.dart';




class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a handy variable to make calling the localized text cleaner
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        // Using the localized 'Home' string
        title: Text(l10n.home),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using the localized App Title
            Text(
              l10n.appTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            // Using the localized Tagline
            Text(
              l10n.tagline,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}