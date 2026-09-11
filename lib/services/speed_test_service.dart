import 'dart:async';
import 'dart:io';

class SpeedTestService {
  static final _client = HttpClient();

  static Future<int> testDownload() async {
    final sw = Stopwatch()..start();
    int totalBytes = 0;
    try {
      final req = await _client
          .getUrl(Uri.parse('https://speed.cloudflare.com/__down?bytes=1000000'))
          .timeout(const Duration(seconds: 15));
      final res = await req.close();
      await for (final chunk in res) {
        totalBytes += chunk.length;
        if (sw.elapsedMilliseconds > 15000) break;
      }
    } catch (_) {}
    sw.stop();
    if (sw.elapsedMilliseconds == 0) return 0;
    return ((totalBytes * 8) / (sw.elapsedMilliseconds / 1000)).round();
  }

  static Future<int> testLatency() async {
    final sw = Stopwatch()..start();
    try {
      final req = await _client
          .getUrl(Uri.parse('https://speed.cloudflare.com/__down?bytes=100'))
          .timeout(const Duration(seconds: 5));
      final res = await req.close();
      await res.drain();
      sw.stop();
      return sw.elapsedMilliseconds;
    } catch (_) {
      return -1;
    }
  }

  static String formatSpeed(int bps) {
    if (bps <= 0) return '0 KB/s';
    final kb = bps / 1024;
    if (kb < 1024) return '${kb.toStringAsFixed(0)} KB/s';
    return '${(kb / 1024).toStringAsFixed(1)} MB/s';
  }
}
