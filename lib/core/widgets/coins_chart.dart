import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:tminus1/core/theme/app_colors.dart';

class CoinsChart extends StatelessWidget {
  final List<double> prices;

  const CoinsChart({required this.prices, super.key});

  Color getColor() {
    if (prices.isEmpty) return AppColors.grey;
    return prices.last >= prices.first ? AppColors.primary : AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                prices.length,
                    (index) => FlSpot(index.toDouble(), prices[index]),
              ),
              isCurved: true,
              color: getColor(),
              barWidth: 2,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}