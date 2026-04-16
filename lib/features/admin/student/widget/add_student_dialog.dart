import 'package:flutter/material.dart';

class AddStudentDialog extends StatelessWidget {
  const AddStudentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.all(16),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create Student Account",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          const Text("Full Name"),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter student name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text("Roll Number"),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter roll number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text("Class"),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter class",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Create Account"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}