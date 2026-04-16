import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/admin/programme%20booking/widget/booking_request_card.dart';
import 'package:thapasya/features/admin/programme%20booking/widget/completed_card.dart';

class BookingRequestsTab extends StatelessWidget {
  const BookingRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BookingRequestCard(
                title: "Annual Day Celebration",
                committee: "Cultural Committee",
                date: "15 May 2024",
                location: "Main Auditorium",
                attendees: "500 expected attendees",
                requestedDate: "1/4/2024",
              ),
              BookingRequestCard(
                title: "Annual Day Celebration",
                committee: "Cultural Committee",
                date: "15 May 2024",
                location: "Main Auditorium",
                attendees: "500 expected attendees",
                requestedDate: "1/4/2024",
              ),

              CompletedCard(
                title: "Sports Day",
                committee: "Sports Committee",
                date: "10 June 2024",
                location: "Stadium",
                attendees: "600 expected attendees",
                requestedDate: "20/3/2024",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
