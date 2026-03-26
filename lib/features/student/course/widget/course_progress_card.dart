import 'package:Thapasya/features/student/course/model/course_item.dart';
import 'package:Thapasya/features/student/course/widget/course_progress_items.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CourseProgressCard extends StatelessWidget {
  final double progress; 
  final List<CourseItem> items;

  const CourseProgressCard({
    super.key,
    required this.progress,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:  EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:  Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
             Text(
              "Course Progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
      
             SizedBox(height: 10),
      
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Overall Progress"),
                Text(
                  "${(progress * 100).toInt()}%",
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
      
            const SizedBox(height: 8),
      
            /// Progress Bar
            LinearPercentIndicator(
              lineHeight: 8,
              percent: progress,
              backgroundColor: Colors.grey.shade300,
              linearGradient: const LinearGradient(
                colors: [Colors.red, Colors.orange, Colors.amber],
              ),
              barRadius: const Radius.circular(10),
            ),
      
            const SizedBox(height: 20),
      
            /// Course List
            ...items.map((e) => CourseProgressItems(item: e)).toList(),
          ],
        ),
      ),
    );
  }
}