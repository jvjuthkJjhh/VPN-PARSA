import 'package:flutter/material.dart';
import 'colors.dart';

class AppText {
  AppText._();

  static const TextStyle logo = TextStyle(
    color: AppColors.neon,
    fontSize: 26,
    fontWeight: FontWeight.w900,
    letterSpacing: 4,
    shadows: [
      Shadow(color: AppColors.neon, blurRadius: 20),
      Shadow(color: AppColors.neon, blurRadius: 40),
    ],
  );

  static const TextStyle h1 = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h2 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h3 = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 13,
  );

  static const TextStyle small = TextStyle(
    color: AppColors.textMuted,
    fontSize: 11,
  );

  static const TextStyle tiny = TextStyle(
    color: AppColors.textMuted,
    fontSize: 10,
  );

  static const TextStyle neon = TextStyle(
    color: AppColors.neon,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle mono = TextStyle(
    color: AppColors.neon,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 2,
  );

  static const TextStyle button = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
} in
