import 'package:flutter/material.dart';

class CompletedProgrammeCard extends StatelessWidget {
  final String title;
  final String date;
  final String attendees;
  final String images;

  const CompletedProgrammeCard({
    super.key,
    required this.title,
    required this.date,
    required this.attendees,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check, size: 14, color: Colors.green),
                    SizedBox(width: 4),
                    Text(
                      "Completed",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            date,
            style: const TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.people_outline,
                  size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(attendees),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(Icons.upload_outlined,
                  size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(images),
            ],
          ),

          const SizedBox(height: 12),

          const Divider(),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "View Details",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}