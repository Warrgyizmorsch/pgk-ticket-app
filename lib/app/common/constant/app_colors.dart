import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Brand ────────────────────────────────────────────────────────────────────
  static const Color primary   = Color(0xFFE75B22);
  static const Color secondary = Color(0xFFC64515);

  // ── Neutrals ─────────────────────────────────────────────────────────────────
  static const Color transparent = Colors.transparent;
  static const Color white       = Color(0xFFFFFFFF);
  static const Color black       = Color(0xFF000000);

  // ── Text ─────────────────────────────────────────────────────────────────────
  static const Color textPrimary        = Color(0xFF2C1C16);
  static const Color textSecondary      = Color(0xFF7A6B65);
  static const Color lightTextSecondary = Color(0xFF8D7C75);
  static const Color lightTextHint      = Color(0xFFBCAAA4);
  static const Color lightTextDisabled  = Color(0xFF9CA3AF);

  // ── Borders & Dividers ───────────────────────────────────────────────────────
  static const Color lightDivider = Color(0xFFEFE4DF);

  // ── Surfaces ─────────────────────────────────────────────────────────────────
  static const Color background    = Color(0xFFFFF9F6);
  static const Color lightDisabled = Color(0xFFD7CCC8);
  static const Color lightShadow   = Color(0x1A000000);

  // ── Semantic ─────────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error   = Color(0xFFEF4444);

  // ── Special UI ───────────────────────────────────────────────────────────────
  static const Color tagBg        = Color(0xFFFDECE5);
  static const Color tagText      = Color(0xFFC64515);
  static const Color priceBg      = Color(0xFFFFF2EC);
  static const Color priceDivider = Color(0xFFFCDCCF);

  // ── Gradients ────────────────────────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, Color(0xFFFF7A3D)],
  );

  static const LinearGradient discountGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFD84A1B), Color(0xFFFF9A5C)],
  );
}