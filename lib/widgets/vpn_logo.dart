import 'package:flutter/material.dart';
import '../theme/colors.dart';

class VpnLogo extends StatelessWidget {
  final double size;
  final bool glow;

  const VpnLogo({super.key, this.size = 120, this.glow = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            AppColors.neon.withOpacity(0.25),
            AppColors.neon.withOpacity(0.05),
          ],
        ),
        border: Border.all(color: AppColors.neon, width: 2),
        boxShadow: glow
            ? [
                BoxShadow(
                  color: AppColors.neon.withOpacity(0.5),
                  blurRadius: 40,
                  spreadRadius: 4,
                ),
              ]
            : null,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shield,
              color: AppColors.neon,
              size: size * 0.32,
              shadows: [
                Shadow(color: AppColors.neon, blurRadius: 15),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              'VPN',
              style: TextStyle(
                color: AppColors.neon,
                fontSize: size * 0.16,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                shadows: const [
                  Shadow(color: AppColors.neon, blurRadius: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
