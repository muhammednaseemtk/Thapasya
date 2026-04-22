import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'class_log_tile.dart';

class RecentClassLogsCard extends StatelessWidget {
  const RecentClassLogsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),
            ],
          ),

          const Divider(height: 1),

          const ClassLogTile(
            date: "Apr 17, 2026",
            title: "Shabdam Practice - Sequences 1-4",
          ),

          const Divider(),

          const ClassLogTile(
            date: "Apr 14, 2026",
            title: "Theory Session - Tala System",
          ),

          const Divider(),

          const ClassLogTile(
            date: "Apr 10, 2026",
            title: "Jatiswaram Review & Assessment",
          ),
        ],
      ),
    );
  }
}