import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SpendingInsightsChart extends StatefulWidget {
  final List<FlSpot> spots;

  const SpendingInsightsChart({super.key, required this.spots});

  @override
  State<SpendingInsightsChart> createState() => _SpendingInsightsChartState();
}

class _SpendingInsightsChartState extends State<SpendingInsightsChart> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
            getTouchedSpotIndicator: (
              LineChartBarData barData,
              List<int> spotIndexes,
            ) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  FlLine(color: Colors.white.withAlpha(125), strokeWidth: 1),
                  FlDotData(
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: Colors.white,
                        strokeWidth: 2,
                        strokeColor: const Color(0xFF007BFF),
                      );
                    },
                  ),
                );
              }).toList();
            },

            touchTooltipData: LineTouchTooltipData(

              // This function builds the tooltip content
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  // Style for the text inside the tooltip
                  final TextStyle textStyle = TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  );

                  // Create the text to display, formatting the Y-value as currency
                  final String tooltipText =
                      '₹${touchedSpot.y.toStringAsFixed(2)}';

                  // Return the fully styled tooltip item
                  return LineTooltipItem(tooltipText, textStyle);
                }).toList();
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withAlpha(75),
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 2,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(color: Colors.grey, fontSize: 12);
                  String text;
                  switch (value.toInt()) {
                    case 0:
                      text = 'Jan';
                      break;
                    case 2:
                      text = 'Mar';
                      break;
                    case 4:
                      text = 'May';
                      break;
                    case 6:
                      text = 'Jul';
                      break;
                    case 8:
                      text = 'Sep';
                      break;
                    case 10:
                      text = 'Nov';
                      break;
                    default:
                      return Container();
                  }
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(text, style: style),
                  );
                },
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: widget.spots,
              isCurved: false,
              color: const Color(0xFF007BFF),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF007BFF).withAlpha(100),
                    const Color(0xFF007BFF).withAlpha(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
