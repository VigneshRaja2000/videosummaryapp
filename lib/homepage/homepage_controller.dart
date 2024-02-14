import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:video/constants/path.dart';
import 'package:video/homepage/homepage_variables.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeController extends GetxController with HomeVariables {
  init() async {}
  convert() async {
    // Get.toNamed(AppPaths.summary);
    await fetchCaptionTracks();
    // await main();
    // speakText(url.text);
  }

  Future<void> fetchCaptionTracks() async {
    final String apiKey =
        'AIzaSyDX4XhyKC2UmOXSRzxIcxgJUlDnPr8NwCE'; // Replace with your actual YouTube Data API key
    final String videoId =
        'd2om_PGtwWY'; // Replace with the actual ID of the video
    String _captionTracksInfo = 'Caption tracks info will appear here';
    final Uri url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/captions/AUieDaYJusRvxR9ydp-sTa7M2hmKcr9CtalHNNz0UiJg5x9DWrk?tfmt=srt&key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the JSON response

      _captionTracksInfo = response.body;
      print(response.body);
      // Contains info about available caption tracks
    } else {
      _captionTracksInfo = 'Failed to load caption tracks';
    }
  }

  main() async {
    var url = Uri.parse("https://api.openai.com/v1/chat/completions");
    var apiKey = "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";
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    };
    var json = [
      {
        'text': 'a few years ago i broke into my own',
        'start': 13.28,
        'duration': 5.12
      }
    ];
    var data = {
      "model": "gpt-4-1106-preview",
      "messages": [
        {
          "role": "user",
          "content":
              "i have a json string with subtitles ,Clean up this subtitles and summaries this " +
                  jsonEncode(json)
        }
      ]
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print(response.body);
      // Handle response
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  // Future<void> speakText(text) async {
  //   //   try {
  //   //     await flutterTts.speak(text);
  //   //   } catch (e) {
  //   //     // Handle the exception here
  //   //     print("Error during text-to-speech: $e");
  //   //     // You can choose to handle the exception in a different way, like showing a dialog or logging it.
  //   //   }
  //   // }

  Future<void> speakText(String text) async {
    try {
      FlutterTts flutterTts = FlutterTts();
      await flutterTts
          .setPitch(10); // Increase pitch (range usually between 0.5 and 2.0)
      await flutterTts.setVoice(
          {"name": "en-us-x-sfg#male_1-local"}); // Change voice to male

      await flutterTts.setLanguage("en-US");

      // Speak the text
      await flutterTts.speak(text);
    } catch (e) {
      // Handle the exception here
      print("Error during text-to-speech: $e");
      // You can choose to handle the exception in a different way, like showing a dialog or logging it.
    }
  }
}
