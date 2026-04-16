import 'package:flutter/material.dart';

class EnquiryItem extends StatelessWidget {
  final String? name;
  final String title;
  final String time;
  final bool showDot;

  const EnquiryItem({
    super.key,
    this.name,
    required this.title,
    required this.time,
    this.showDot = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (name != null)
                  Text(
                    name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                Text(
                  title,
                  style: const TextStyle(color: Colors.black87),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          if (showDot)
            Container(
              margin: const EdgeInsets.only(left: 8, top: 6),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}