import 'package:flutter/material.dart';

class ProgrammeTabBar extends StatelessWidget {
  const ProgrammeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const TabBar(
              isScrollable: true,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blue,
              indicatorWeight: 2,
              tabs: [
                Tab(text: "Booking Requests"),
                Tab(text: "Completed Programmes"),
              ],
            ),
          ),

          SizedBox(
            height: 400, 
            child: TabBarView(
              children: [
                Center(child: Text("Booking Requests List")),
                Center(child: Text("Completed Programmes List")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}