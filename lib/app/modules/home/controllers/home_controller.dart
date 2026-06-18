import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeController extends GetxController {
  // ─── TTS State Variables ───
  final FlutterTts flutterTts = FlutterTts();
  final RxBool isPlaying = false.obs;
  final RxDouble audioProgress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  void _initTts() {
    // Reset state when audio finishes
    flutterTts.setCompletionHandler(() {
      isPlaying.value = false;
      audioProgress.value = 1.0;
      Future.delayed(const Duration(seconds: 1), () => audioProgress.value = 0.0);
    });

    // Track which word is currently being spoken to update the slider
    flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
      audioProgress.value = endOffset / text.length;
    });
  }

  /// Toggles the audio playback and automatically sets the correct language
  Future<void> toggleNarration(String textToRead) async {
    if (isPlaying.value) {
      await flutterTts.pause();
      isPlaying.value = false;
    } else {
      // 1. Detect current app language and configure TTS voice
      String currentLang = Get.locale?.languageCode ?? 'en';

      if (currentLang == 'hi') {
        await flutterTts.setLanguage("hi-IN");
      } else if (currentLang == 'gu') {
        await flutterTts.setLanguage("gu-IN");
      } else {
        await flutterTts.setLanguage("en-US");
      }

      // Optional: Adjust speech rate (0.0 to 1.0)
      await flutterTts.setSpeechRate(0.5);

      // 2. Start playing
      isPlaying.value = true;
      await flutterTts.speak(textToRead);
    }
  }

  @override
  void onClose() {
    flutterTts.stop(); // Stop audio if the user leaves the screen
    super.onClose();
  }
}