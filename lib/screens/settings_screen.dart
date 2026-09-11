import 'package:flutter/material.dart';
import '../theme/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _autoConnect = false;
  bool _showNotification = true;
  bool _autoSort = true;
  bool _realPing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('تنظیمات'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.neon),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection('عمومی'),
          _buildSwitch(
            'اتصال خودکار',
            'اتصال به آخرین سرور در شروع',
            _autoConnect,
            (v) => setState(() => _autoConnect = v),
          ),
          _buildSwitch(
            'نمایش نوتیفیکیشن',
            'نمایش وضعیت در نوار اعلان',
            _showNotification,
            (v) => setState(() => _showNotification = v),
          ),
          const SizedBox(height: 20),
          _buildSection('پینگ'),
          _buildSwitch(
            'مرتب‌سازی خودکار',
            'مرتب‌سازی سرورها بر اساس پینگ',
            _autoSort,
            (v) => setState(() => _autoSort = v),
          ),
          _buildSwitch(
            'پینگ دقیق',
            'پینگ واقعی با هسته Xray',
            _realPing,
            (v) => setState(() => _realPing = v),
          ),
          const SizedBox(height: 20),
          _buildSection('درباره'),
          _buildItem('نسخه', '3.0.0'),
          _buildItem('سازنده', 'Parsa Team'),
          _buildItem('مجوز', 'MIT License'),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.neon,
          fontSize: 13,
          fontWeight:
