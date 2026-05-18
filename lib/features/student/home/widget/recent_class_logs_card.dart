import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/student/home/model/student_class_log_model.dart';
import 'class_log_tile.dart';
import 'class_log_shimmer.dart';

class RecentClassLogsCard extends StatelessWidget {
  final List<StudentClassLogModel> logs;
  final bool isLoading;

  const RecentClassLogsCard({
    super.key,
    required this.logs,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 10),
              Text(
                "Recent Class Logs",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Updates from your instructor",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          const Divider(height: 1),
          if (isLoading)
            const ClassLogShimmer()
          else if (logs.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("No logs available"),
            )
          else
            ...logs.map(
              (log) => Column(
                children: [
                  ClassLogTile(
                    date: log.date,
                    title: log.title,
                  ),
                  const Divider(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
