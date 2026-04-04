import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StudentProgressCard extends StatelessWidget {
  final Color progressColor; 

  const StudentProgressCard({
    super.key,
   required this.progressColor, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F5F7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF2F5D82),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: Text(
                  "PK",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
      
            const SizedBox(width: 12),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Priya Krishnamurthy",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 4),
      
                  const Text(
                    "TSA-001 • Level 3",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
      
                  const SizedBox(height: 10),
      
                  Row(
                    children: [
                      Expanded(
                        child: LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          lineHeight: 6,
                          percent: 0.87,
                          barRadius: const Radius.circular(10),
                          backgroundColor: const Color(0xFFE0E0E0),
                          progressColor: progressColor, 
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "87%",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: progressColor, 
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      
            const SizedBox(width: 8),
      
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}