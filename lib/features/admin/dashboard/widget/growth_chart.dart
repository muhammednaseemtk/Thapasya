import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrowthChart extends StatelessWidget {
  const GrowthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Growth Statistics",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 220,
            child: BarChart(
              BarChartData(
                maxY: 600,
                alignment: BarChartAlignment.spaceAround,

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 150,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade300,
                      strokeWidth: 1,
                      dashArray: [4, 4],
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade200,
                      strokeWidth: 1,
                      dashArray: [4, 4],
                    );
                  },
                ),

                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade400),
                    bottom: BorderSide(color: Colors.grey.shade400),
                  ),
                ),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 150,
                      reservedSize: 35,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 11),
                        );
                      },
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                        ];
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            months[value.toInt()],
                            style: const TextStyle(fontSize: 11),
                          ),
                        );
                      },
                    ),
                  ),

                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                barGroups: [
                  bar(0, 450),
                  bar(1, 480),
                  bar(2, 500),
                  bar(3, 520),
                  bar(4, 550),
                  bar(5, 580),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData bar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 10,
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xFF10B981),
        ),
      ],
    );
  }
}
