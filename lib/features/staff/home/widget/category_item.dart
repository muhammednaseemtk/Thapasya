import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final int students;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.students,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFE2E8F0)
            : const Color(0xFFEDE9E4),
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: Colors.blue.shade200)
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "$students students",
              style: const TextStyle(fontSize: 12),
            ),
          ),

          const SizedBox(width: 8),

          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: Colors.blue,
              size: 18,
            ),
        ],
      ),
    );
  }
}