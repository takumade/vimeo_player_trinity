import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import "dart:collection";

class QualityLinks {
  String? videoId;

  QualityLinks(this.videoId);

  getQualitiesSync() {
    return getQualitiesAsync();
  }

  Future<SplayTreeMap?> getQualitiesAsync() async {
    try {
      final vimeoLink =
          Uri.tryParse('https://player.vimeo.com/video/${videoId!}/config');
      var response = await http.get(vimeoLink!);

      final jsonData = jsonDecode(response.body)['request']['files'];
      final dashData = jsonData['dash'];
      final hlsData = jsonData['hls'];
      final defaultCDN = hlsData['default_cdn'];
      final cdnVideoUrl = (hlsData['cdns'][defaultCDN]['url'] as String?) ?? '';
      final rawStreamUrls =
          (dashData['streams'] as List<dynamic>?) ?? <dynamic>[];

      final sepList = cdnVideoUrl.split('/sep/video/');
      final firstUrlPiece = sepList.firstOrNull ?? '';
      final lastUrlPiece = ((sepList.lastOrNull ?? '').split('/').lastOrNull) ??
          (sepList.lastOrNull ?? '');

      final SplayTreeMap videoList = SplayTreeMap();

      for (final item in rawStreamUrls) {
        final urlId =
            ((item['id'] ?? '') as String).split('-').firstOrNull ?? '';

        videoList.putIfAbsent(
          "${item['quality']} ${item['fps']}",
          () => '$firstUrlPiece/sep/video/$urlId/$lastUrlPiece',
        );
      }

      if (videoList.isEmpty) {
        videoList.putIfAbsent(
          '720 30',
          () => cdnVideoUrl,
        );
      }

      return videoList;
    } catch (error) {
      log('=====> REQUEST ERROR: $error');
      return null;
    }
  }
}
