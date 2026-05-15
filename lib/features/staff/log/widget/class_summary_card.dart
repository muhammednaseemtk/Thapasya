import 'package:flutter/material.dart';

class ClassSummaryCard extends StatelessWidget {
  final String txt;
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;

  const ClassSummaryCard({
    super.key,
    required this.txt,
    required this.controller,
    required this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F5F7),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C2C2C),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFEDE7DD),
              borderRadius: BorderRadius.circular(16),
            ),

            child: TextFormField(
              controller: controller,
              maxLines: 2,
              validator: validator,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                errorStyle: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
