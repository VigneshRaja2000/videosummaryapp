import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video/constants/path.dart';
import 'package:video/homepage/homepage_variables.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class HomeController extends GetxController with HomeVariables {
  init() async {}
  convert() async {
    // Get.toNamed(AppPaths.summary);
    await getCaptions('8jPQjjsBbIc');
  }

  Future<void> getCaptions(String videoId) async {
    var yt = YoutubeExplode();
    try {
      // Get the manifest that contains all available closed caption tracks
      var manifest = await yt.videos.closedCaptions.getManifest(videoId);
      print(manifest.tracks);
      if (manifest.tracks.isNotEmpty) {
        // Just for example, we'll take the first track
        var trackInfo = manifest.tracks.first;

        // Get the actual closed caption track which contains all the captions
        var track = await yt.videos.closedCaptions.get(trackInfo);

        // Print all captions
        for (var caption in track.captions) {
          print('${caption.text} (${caption.offset})');
        }
      } else {
        print('No captions found for video ID: $videoId');
      }
    } catch (e) {
      print('Failed to fetch captions: $e');
    } finally {
      yt.close();
    }
  }
}
