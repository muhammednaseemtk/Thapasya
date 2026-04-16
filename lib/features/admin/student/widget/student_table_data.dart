import 'package:flutter/material.dart';
import 'package:thapasya/core/widget/common_data_table.dart';

class StudentTableData extends StatelessWidget {
  const StudentTableData({super.key});

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
    
  ];

  @override
  Widget build(BuildContext context) {
    return CommonDataTable(
      columns: const [
        DataColumn(label: Text("ROLL NO")),
        DataColumn(label: Text("NAME")),
        DataColumn(label: Text("CLASS")),
        DataColumn(label: Text("STATUS")),
        DataColumn(label: Text("FEES STATUS")),
        DataColumn(label: Text("ACTIONS")),
      ],

      rows: students.map((data) {
        return DataRow(
          cells: [
            DataCell(Text(data['roll']!)),

            DataCell(
              Text(
                data['name']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            DataCell(Text(data['class']!)),

            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Active",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),

            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: data['fees'] == "Paid"
                      ? Colors.blue.shade100
                      : Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  data['fees']!,
                  style: TextStyle(
                    color: data['fees'] == "Paid"
                        ? Colors.blue
                        : Colors.orange,
                  ),
                ),
              ),
            ),

            DataCell(
              InkWell(
                onTap: () {},
                child: const Text(
                  "View Details",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}