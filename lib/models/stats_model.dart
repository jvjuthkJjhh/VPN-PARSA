class VpnStats {
  int downloadSpeed;
  int uploadSpeed;
  int totalDownload;
  int totalUpload;
  DateTime? connectedAt;

  VpnStats({
    this.downloadSpeed = 0,
    this.uploadSpeed = 0,
    this.totalDownload = 0,
    this.totalUpload = 0,
    this.connectedAt,
  });

  Duration get duration {
    if (connectedAt == null) return Duration.zero;
    return DateTime.now().difference(connectedAt!);
  }

  String get formattedDuration {
    final d = duration;
    final h = d.inHours.toString().padLeft(2, '0');
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  static String formatSpeed(int bps) {
    if (bps < 1024) return '$bps B/s';
    if (bps < 1024 * 1024) return '${(bps / 1024).toStringAsFixed(1)} KB/s';
    return '${(bps / 1024 / 1024).toStringAsFixed(2)} MB/s';
  }

  static String formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / 1024 / 1024).toStringAsFixed(2)} MB';
    }
    return '${(bytes / 1024 / 1024 / 1024).toStringAsFixed(2)} GB';
  }

  void reset() {
    downloadSpeed = 0;
    uploadSpeed = 0;
    totalDownload = 0;
    totalUpload = 0;
    connectedAt = null;
  }
}

class SpeedDataPoint {
  final DateTime time;
  final int download;
  final int upload;

  SpeedDataPoint({
    required this.time,
    required this.download,
    required this.upload,
  });
} 
