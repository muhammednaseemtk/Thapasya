import 'package:flutter/material.dart';

class AddStaffDialog extends StatelessWidget {
  const AddStaffDialog({super.key});

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
            "Add Staff",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          const Text("Staff Name"),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter staff name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text("Role"),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter role",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text("Salary"),
          const SizedBox(height: 6),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter salary",
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
              ElevatedButton(
                onPressed: () {
                },
                child: const Text("Add Staff",),
              ),
            ],
          ),
        ],
      ),
    );
  }
}