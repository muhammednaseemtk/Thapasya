import 'package:flutter/material.dart';
import 'package:thapasya/features/admin/student/widget/fees_badge.dart';
import 'package:thapasya/features/admin/student/widget/status_badge.dart';
import 'package:thapasya/features/admin/student/widget/table_cell_text.dart';

class StudentTable extends StatelessWidget {
  const StudentTable({super.key});

  static final List<Map<String, String>> students = [
    {
      "roll": "2024001",
      "name": "Priya Sharma",
      "class": "Class 10-A",
      "status": "Active",
      "fees": "Paid",
    },
    {
      "roll": "2024002",
      "name": "Rahul Kumar",
      "class": "Class 9-B",
      "status": "Active",
      "fees": "Pending",
    },
    {
      "roll": "2024003",
      "name": "Ananya Reddy",
      "class": "Class 11-A",
      "status": "Active",
      "fees": "Paid",
    },
    {
      "roll": "2024002",
      "name": "Rahul Kumar",
      "class": "Class 9-B",
      "status": "Active",
      "fees": "Pending",
    },
    {
      "roll": "2024002",
      "name": "Rahul Kumar",
      "class": "Class 9-B",
      "status": "Active",
      "fees": "Pending",
    },
    {
      "roll": "2024002",
      "name": "Rahul Kumar",
      "class": "Class 9-B",
      "status": "Active",
      "fees": "Pending",
    },
    {
      "roll": "2024004",
      "name": "Arjun Patel",
      "class": "Class 8-C",
      "status": "Active",
      "fees": "Paid",
    },
    {
      "roll": "2024005",
      "name": "Sneha Iyer",
      "class": "Class 12-A",
      "status": "Active",
      "fees": "Pending",
    },
    {
      "roll": "2024006",
      "name": "Karan Singh",
      "class": "Class 10-B",
      "status": "Active",
      "fees": "Paid",
    },
    {
      "roll": "2024007",
      "name": "Diya Nair",
      "class": "Class 9-A",
      "status": "Active",
      "fees": "Paid",
    },
    {
      "roll": "2024008",
      "name": "Vivek Menon",
      "class": "Class 11-B",
      "status": "Active",
      "fees": "Pending",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 720, 

          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    TableCellText("ROLL NO"),
                    TableCellText("NAME"),
                    TableCellText("CLASS"),
                    SizedBox(width: 10),
                    TableCellText("STATUS"),
                    SizedBox(width: 20),
                    TableCellText("FEES STATUS"),
                    SizedBox(width: 20),
                    TableCellText("ACTIONS"),
                  ],
                ),
              ),

              ...students.map((data) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      TableCellText(data['roll']!),
                      TableCellText(data['name']!, isBold: true),
                      TableCellText(data['class']!),
                      StatusBadge(text: data['status']!),
                      SizedBox(width: 20),
                      FeeBadge(text: data['fees']!),
                      SizedBox(width: 20),

                      SizedBox(
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${data['name']} clicked"),
                              ),
                            );
                          },
                          child: const Text(
                            "View Details",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
