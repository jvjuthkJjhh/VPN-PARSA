import 'package:flutter/material.dart';
import '../models/config_model.dart';
import '../theme/colors.dart';
import '../widgets/config_tile.dart';

class ConfigsScreen extends StatefulWidget {
  final List<V2RayConfig> configs;
  final V2RayConfig? selected;
  final Function(V2RayConfig) onSelect;

  const ConfigsScreen({
    super.key,
    required this.configs,
    required this.selected,
    required this.onSelect,
  });

  @override
  State<ConfigsScreen> createState() => _ConfigsScreenState();
}

class _ConfigsScreenState extends State<ConfigsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('کانفیگ‌های Parsa VIP'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.neon),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: widget.configs.isEmpty
          ? _emptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.configs.length,
              itemBuilder: (_, i) {
                final c = widget.configs[i];
                return ConfigTile(
                  config: c,
                  isSelected: widget.selected?.raw == c.raw,
                  onTap: () {
                    widget.onSelect(c);
                    Navigator.pop(context);
                  },
                );
              },
            ),
    );
  }

  Widget _emptyState() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.dns_outlined, color: AppColors.textDisabled, size: 60),
          SizedBox(height: 12),
          Text(
            'هنوز کانفیگی نداری',
            style: TextStyle(color: AppColors.textMuted, fontSize: 14),
          ),
          SizedBox(height: 6),
          Text(
            'از صفحه اصلی «جستجوی VIP» رو بزن',
            style: TextStyle(color: AppColors.textDisabled, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
