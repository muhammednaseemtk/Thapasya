import 'package:flutter/material.dart';

class FeesAlertCard extends StatelessWidget {
  final String title;
  final String message;

  const FeesAlertCard({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFDECEA), 
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.red.shade200,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Icon
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red),
              ),
              child: const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 18,
              ),
            ),
      
            const SizedBox(width: 12),
      
            /// Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
      
                  const SizedBox(height: 4),
      
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}