import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttendanceCard extends StatelessWidget {
  final int percentage;
  final int present;
  final int total;

  const AttendanceCard({
    super.key,
    required this.percentage,
    required this.present,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:  AppColors.brightRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 40,
            lineWidth: 8,
            percent: percentage / 100,
            center: Text(
              "$percentage%",
              style:  TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            progressColor: AppColors.white,
            backgroundColor: Colors.white24,
            circularStrokeCap: CircularStrokeCap.round,
          ),

           SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Overall Attendance",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                 SizedBox(height: 6),

                Text(
                  "$present present out of $total classes",
                  style:  TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),

                 SizedBox(height: 10),

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check, color: AppColors.white, size: 14),
                      SizedBox(width: 4),
                      Text(
                        "Good Standing",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}