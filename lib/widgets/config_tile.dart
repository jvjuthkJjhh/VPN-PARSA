import 'package:flutter/material.dart';
import '../models/config_model.dart';
import '../theme/colors.dart';

class ConfigTile extends StatelessWidget {
  final V2RayConfig config;
  final bool isSelected;
  final VoidCallback onTap;

  const ConfigTile({
    super.key,
    required this.config,
    required this.isSelected,
    required this.onTap,
  });

  Color _protocolColor(String p) {
    switch (p) {
      case 'VLESS':
        return AppColors.vless;
      case 'VMess':
        return AppColors.vmess;
      case 'Trojan':
        return AppColors.trojan;
      case 'Shadowsocks':
        return AppColors.shadowsocks;
      default:
        return Colors.grey;
    }
  }

  Color _pingColor(int? ping) {
    if (ping == null) return AppColors.danger;
    if (ping < 200) return AppColors.success;
    if (ping < 500) return AppColors.warning;
    return AppColors.danger;
  }

  @override
  Widget build(BuildContext context) {
    final ping = config.bestPing;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.neon.withOpacity(0.15)
              : AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.neon : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.neon.withOpacity(0.3),
                    blurRadius: 15,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _protocolColor(config.protocol).withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  config.protocolShort,
                  style: TextStyle(
                    color: _protocolColor(config.protocol),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    config.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    config.protocol,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ping == null ? '✕' : '$ping',
                  style: TextStyle(
                    color: _pingColor(ping),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'ms',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.neon,
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
