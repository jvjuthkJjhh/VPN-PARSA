import 'package:flutter/material.dart';
import '../models/stats_model.dart';
import '../theme/colors.dart';

class SpeedChart extends StatelessWidget {
  final List<SpeedDataPoint> data;
  final double height;

  const SpeedChart({
    super.key,
    required this.data,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: data.isEmpty
          ? const Center(
              child: Text(
                'داده‌ای موجود نیست',
                style: TextStyle(color: AppColors.textMuted, fontSize: 11),
              ),
            )
          : CustomPaint(
              size: Size.infinite,
              painter: _ChartPainter(data),
            ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<SpeedDataPoint> data;

  _ChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final maxSpeed = data.fold<int>(
      0,
      (max, p) => p.download > max ? p.download : max,
    );

    if (maxSpeed == 0) return;

    final stepX = size.width / (data.length - 1).clamp(1, 100);

    // Line
    final linePaint = Paint()
      ..color = AppColors.neon
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Fill
    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          AppColors.neon.withOpacity(0.3),
          AppColors.neon.withOpacity(0.0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final linePath = Path();
    final fillPath = Path();

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = size.height - (data[i].download / maxSpeed) * size.height;

      if (i == 0) {
        linePath.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        linePath.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant _ChartPainter oldDelegate) => true;
}ت
