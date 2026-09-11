import 'package:flutter/material.dart';
import '../theme/colors.dart';

class LoadingOverlay extends StatelessWidget {
  final bool visible;
  final String message;

  const LoadingOverlay({
    super.key,
    required this.visible,
    this.message = 'در حال پردازش...',
  });

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox();

    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.7),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.neon, width: 1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neon.withOpacity(0.3),
                  blurRadius: 30,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(AppColors.neon),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
