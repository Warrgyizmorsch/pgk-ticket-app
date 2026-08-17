import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final RxBool isPlaying = false.obs;
  final RxDouble audioProgress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  Future<void> _initTts() async {
    // 1. Required for iOS: Bypasses the physical silent switch and configures audio routing
    if (Platform.isIOS) {
      await flutterTts.setSharedInstance(true);
      await flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        ],
        IosTextToSpeechAudioMode.defaultMode,
      );
    }

    // 2. Reset state when audio finishes
    flutterTts.setCompletionHandler(() {
      isPlaying.value = false;
      audioProgress.value = 1.0;
      Future.delayed(const Duration(seconds: 1), () => audioProgress.value = 0.0);
    });

    // 3. Track which word is currently being spoken to update the slider
    flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
      // Prevent division by zero just in case
      if (text.isNotEmpty) {
        audioProgress.value = endOffset / text.length;
      }
    });
  }

  Future<void> toggleNarration(String textToRead) async {
    if (isPlaying.value) {
      // Note: pause() on iOS can sometimes be finicky depending on the OS version.
      // If pause() doesn't resume correctly later, change this to flutterTts.stop()
      await flutterTts.pause();
      isPlaying.value = false;
    } else {
      String currentLang = Get.locale?.languageCode ?? 'en';

      if (currentLang == 'hi') {
        await flutterTts.setLanguage("hi-IN");
      } else if (currentLang == 'gu') {
        await flutterTts.setLanguage("gu-IN");
      } else {
        await flutterTts.setLanguage("en-US");
      }

      await flutterTts.setSpeechRate(0.5);

      isPlaying.value = true;
      await flutterTts.speak(textToRead);
    }
  }

  @override
  void onClose() {
    flutterTts.stop();
    super.onClose();
  }
}