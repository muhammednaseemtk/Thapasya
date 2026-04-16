import 'package:flutter/material.dart';
import 'number_stepper_field.dart';

class CompleteProgrammeDialog extends StatelessWidget {
  const CompleteProgrammeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(16),

      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Complete Programme",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            const Text("Number of Attendees"),
            const SizedBox(height: 6),
            const NumberStepperField(),

            const SizedBox(height: 14),

            const Text("Upload Images"),
            const SizedBox(height: 6),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Column(
                children: [
                  Icon(Icons.upload, size: 28, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    "Click to upload programme images",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            const Text("Additional Notes"),
            const SizedBox(height: 6),

            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Add any notes about the programme",
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Complete"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
