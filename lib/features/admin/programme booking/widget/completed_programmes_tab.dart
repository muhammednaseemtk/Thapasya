import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/admin/programme%20booking/widget/completed_programme_card.dart';

class CompletedProgrammesTab extends StatelessWidget {
  const CompletedProgrammesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CompletedProgrammeCard(
                title: "Independence Day Celebration",
                date: "15 August 2024",
                attendees: "550 attendees",
                images: "15 images uploaded",
              ),
              CompletedProgrammeCard(
                title: "Independence Day Celebration",
                date: "15 August 2024",
                attendees: "550 attendees",
                images: "15 images uploaded",
              ),
              CompletedProgrammeCard(
                title: "Independence Day Celebration",
                date: "15 August 2024",
                attendees: "550 attendees",
                images: "15 images uploaded",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
