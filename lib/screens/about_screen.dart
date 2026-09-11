import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/vpn_logo.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('درباره'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.neon),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const VpnLogo(size: 120),
            const SizedBox(height: 24),
            const Text(
              'Parsa VPN',
              style: TextStyle(
                color: AppColors.neon,
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'نسخه ۳.۰.۰',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 40),
            _buildInfoCard('امکانات', [
              'جستجو از ۱۰+ مخزن کانفیگ',
              'پینگ دو مرحله‌ای',
              '۱۰ کانفیگ VIP',
              'سیستم لایسنس',
              'پنل مدیریت',
              'رابط کاربری نئون',
            ]),
            const SizedBox(height: 16),
            _buildInfoCard('اطلاعات', [
              'سازنده: Parsa Team',
              'مجوز: MIT',
              'زبان: Dart / Flutter',
              'پلتفرم: Android',
            ]),
            const SizedBox(height: 30),
            const Text(
              '© 2025 Parsa VPN',
              style: TextStyle(
                color: AppColors.textDisabled,
                fontSize: 11,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<String> items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.neon,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.success,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}غ
