import 'package:flutter/material.dart';
import 'booking_requests_tab.dart';
import 'completed_programmes_tab.dart';

class ProgrammeTabBar extends StatelessWidget {
  const ProgrammeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            indicatorWeight: 2,
            tabs: [
              Tab(text: "Booking Requests"),
              Tab(text: "Completed Programmes"),
            ],
          ),

          const Expanded(
            child: TabBarView(
              children: [
                BookingRequestsTab(),
                CompletedProgrammesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}