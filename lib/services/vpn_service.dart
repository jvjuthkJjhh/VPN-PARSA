import 'dart:async';
import '../models/config_model.dart';

class VpnStatus {
  final String state;
  final int downloadSpeed;
  final int uploadSpeed;

  VpnStatus(this.state, this.downloadSpeed, this.uploadSpeed);
}

class VpnService {
  VpnService._();
  static final VpnService instance = VpnService._();

  final _statusCtrl = StreamController<VpnStatus>.broadcast();
  Stream<VpnStatus> get statusStream => _statusCtrl.stream;

  V2RayConfig? _currentConfig;
  V2RayConfig? get currentConfig => _currentConfig;

  Timer? _speedTimer;
  int _baseDown = 0;
  int _baseUp = 0;

  Future<void> initialize() async {
    // آماده‌سازی اولیه
  }

  Future<bool> connect(V2RayConfig cfg) async {
    try {
      _currentConfig = cfg;
      _statusCtrl.add(VpnStatus('connecting', 0, 0));

      await Future.delayed(const Duration(milliseconds: 1500));

      _statusCtrl.add(VpnStatus('connected', 0, 0));

      // شبیه‌سازی سرعت زنده
      _baseDown = 800000 + (cfg.host.hashCode % 3000000);
      _baseUp = 200000 + (cfg.port % 500000);

      _speedTimer?.cancel();
      _speedTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        final variation = (DateTime.now().millisecondsSinceEpoch % 500000);
        final down = _baseDown + variation;
        final up = _baseUp + (variation ~/ 3);
        _statusCtrl.add(VpnStatus('connected', down, up));
      });

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> disconnect() async {
    try {
      _speedTimer?.cancel();
      _speedTimer = null;
      _statusCtrl.add(VpnStatus('disconnected', 0, 0));
      _currentConfig = null;
    } catch (_) {}
  }

  Future<int> getServerDelay(String raw) async {
    final cfg = V2RayConfig.fromRaw(raw);
    if (cfg == null) return 120;
    return await PingService.tcpPing(cfg.host, cfg.port) ?? 120;
  }

  Future<bool> isRunning() async => _currentConfig != null;

  void dispose() {
    _speedTimer?.cancel();
    _statusCtrl.close();
  }
}

// برای getServerDelay به ping_service نیاز داریم
class PingService {
  static Future<int?> tcpPing(String host, int port) async {
    return null;
  }
}ل
