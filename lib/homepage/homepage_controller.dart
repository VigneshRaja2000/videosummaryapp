import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video/constants/path.dart';
import 'package:video/homepage/homepage_variables.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeController extends GetxController with HomeVariables {
  init() async {}
  convert() async {
    // Get.toNamed(AppPaths.summary);

    String? videoId = YoutubePlayer.convertUrlToId(url.text);
    await getCaptions(videoId!);

    // await fetchCaptionTracks();
    // await main();
    // speakText(url.text);
    // getSubtitle();/\
  }

  Future<void> getCaptions(String videoId) async {
    var yt = YoutubeExplode();
    try {
      // Get the manifest that contains all available closed caption tracks
      var manifest = await yt.videos.closedCaptions.getManifest(videoId);
      print(manifest.tracks);
      if (manifest.tracks.isNotEmpty) {
        // Just for example, we'll take the first track
        var trackInfo = manifest.tracks[40];
        print(
            trackInfo); // Get the actual closed caption track which contains all the captions
        var track = await yt.videos.closedCaptions.get(trackInfo);

        // Print all captions
        String concatenatedString = "";
        int index = 0;

        for (var caption in track.captions) {
          concatenatedString += caption.text;

          // Check if index is over 10
          if (++index > 10) {
            break;
          }
        }

        // generateSummary(concatenatedString);
        _downloadAndExtractFrames(videoId);
        speakText(concatenatedString);
      } else {
        print('No captions found for video ID: $videoId');
      }
    } catch (e) {
      print('Failed to fetch captions: $e');
    } finally {
      yt.close();
    }
  }

// Future<void> getSubtitle() async {
//   final yt = YoutubeExplode();

//   try {
//     final videoId = 'd2om_PGtwWY'; // Specify the video ID for which you want to fetch captions

//     // Get the list of available subtitle tracks for the video
//     final tracks = await yt.captions.getTracks(videoId);

//     // Check if there are available subtitle tracks
//     if (tracks.isNotEmpty) {
//       // Loop through each subtitle track and fetch its content
//       for (var track in tracks) {
//         print('Subtitle track: ${track.language.name} (${track.format})');

//         // Download and print the content of the current subtitle track
//         final captions = await yt.captions.get(track.url);
//         print('Subtitle content for ${track.language.name}:');
//         print(captions);
//       }
//     } else {
//       print('No subtitles available for the video.');
//     }
//   } catch (e) {
//     // Handle errors
//     print('Error fetching subtitles: $e');
//   } finally {
//     // Close the YoutubeExplode instance
//     yt.close();
//   }
// }

  void generateSummary(text) async {
    var url = Uri.parse("https://api.openai.com/v1/chat/completions");
    var apiKey = "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";
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    };
    var te =
        "i have some subtitles and i need a short summary ,Clean up this subtitles and summaries this " +
            text;
    var data = {
      "model": "gpt-4-1106-preview",
      "messages": [
        {"role": "user", "content": te}
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

  Future<void> speakText(String text) async {
    try {
      FlutterTts flutterTts = FlutterTts();
      await flutterTts
          .setPitch(10); // Increase pitch (range usually between 0.5 and 2.0)
      await flutterTts.setVoice(
          {"name": "en-us-x-sfg#male_1-local"}); // Change voice to male

      await flutterTts.setLanguage("en-US");

      // Speak the text5
      await flutterTts.speak(text);
      // Directory directory = await getApplicationDocumentsDirectory();

      // String filePath = '${directory.path}/audio.mp3';
      // print(filePath);

      // // Save synthesized speech as an audio file
      // await flutterTts.synthesizeToFile(text, filePath);
    } catch (e) {
      // Handle the exception here
      print("Error during text-to-speech: $e");
      // You can choose to handle the exception in a different way, like showing a dialog or logging it.
    }
  }

  Future<void> _downloadAndExtractFrames(videoId) async {
    final String apiKey = 'AIzaSyDX4XhyKC2UmOXSRzxIcxgJUlDnPr8NwCE';

    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/youtube/v3/videos?part=snippet&id=$videoId&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      thumbnailUrl.value = json.decode(response.body)['items'][0]['snippet']
          ['thumbnails']['high']['url'];

      print('thumbnailUrl: $thumbnailUrl');
    }
  }
}
