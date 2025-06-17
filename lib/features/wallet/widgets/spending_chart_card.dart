import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Point {
  final double x;
  final double y;
  Point(this.x, this.y);
}

class SpendingChartCard extends StatefulWidget {
  final String title;
  final String selectedPeriod;
  final double percentChange;
  final double amountChange;
  final List<Point> points;
  final VoidCallback? onPeriodChange;

  const SpendingChartCard({
    super.key,
    this.title = 'Spending',
    this.selectedPeriod = 'This Month',
    required this.percentChange,
    required this.amountChange,
    required this.points,
    this.onPeriodChange,
  });

  @override
  State<SpendingChartCard> createState() => _SpendingChartCardState();
}

class _SpendingChartCardState extends State<SpendingChartCard> {
  // State to hold the index of the touched/selected spot
  int? _selectedIndex;
  late List<FlSpot> _spots;

  @override
  void initState() {
    super.initState();
    _updateSpots();
  }

  // When the widget's data is updated, we need to reflect the changes
  @override
  void didUpdateWidget(SpendingChartCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.points != oldWidget.points) {
      _updateSpots();
    }
  }

  void _updateSpots() {
    setState(() {
      _spots = widget.points.map((point) => FlSpot(point.x, point.y)).toList();
      // Set the initial selected index to the last spot
      if (_spots.isNotEmpty) {
        _selectedIndex = _spots.length - 1;
      } else {
        _selectedIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPositive = widget.percentChange >= 0;

    // Fallback for when there's no data
    if (_selectedIndex == null || _spots.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E), // A dark grey color from the image
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'No spending data available.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E), // Dark grey similar to the image
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildValueDisplay(),
          const SizedBox(height: 16),
          _buildChart(),
          const SizedBox(height: 20),
          _buildSummary(isPositive),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(50),
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: widget.onPeriodChange,
            child: Row(
              children: [
                Text(
                  widget.selectedPeriod,
                  style: TextStyle(color: Colors.grey[300]),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey[300],
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildValueDisplay() {
    return Text(
      // Formatting the currency value
      '₹${_spots[_selectedIndex!].y.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: 150,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
            touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
              if (response == null || response.lineBarSpots == null) {
                return;
              }
              if (event is FlPointerHoverEvent || event is FlTapDownEvent) {
                setState(() {
                  _selectedIndex = response.lineBarSpots!.first.spotIndex;
                });
              }
            },
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
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  return null; // Returning null to disable default tooltip
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
                  // *** THIS IS THE CORRECT FIX FOR YOUR VERSION ***
                  return SideTitleWidget(
                    meta: meta, // Pass the entire meta object
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
              spots: _spots,
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
              showingIndicators:
                  _selectedIndex != null ? [_selectedIndex!] : [],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary(bool isPositive) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                '${isPositive ? '+' : ''}${widget.percentChange.toStringAsFixed(1)}% (${isPositive ? '+' : ''}₹${widget.amountChange.toStringAsFixed(0)}) ',
            style: TextStyle(
              color: isPositive ? Colors.greenAccent : Colors.redAccent,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'more than last month',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
