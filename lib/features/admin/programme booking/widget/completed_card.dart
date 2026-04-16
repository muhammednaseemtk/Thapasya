import 'package:flutter/material.dart';
import 'package:thapasya/features/admin/programme%20booking/widget/complete_programme_dialog.dart';

class CompletedCard extends StatelessWidget {
  final String title;
  final String committee;
  final String date;
  final String location;
  final String attendees;
  final String requestedDate;
  final String status;

  const CompletedCard({
    super.key,
    required this.title,
    required this.committee,
    required this.date,
    required this.location,
    required this.attendees,
    required this.requestedDate,
    this.status = "Accepted",
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text("by $committee", style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(date),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(location),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(Icons.people_outline, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(attendees),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text("Requested on $requestedDate"),
            ],
          ),

          const SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const CompleteProgrammeDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Mark as Completed",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
