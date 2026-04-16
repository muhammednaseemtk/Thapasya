import 'package:flutter/material.dart';
import 'package:thapasya/core/widget/common_data_table.dart';

class StaffSalaryTable extends StatelessWidget {
  const StaffSalaryTable({super.key});

  static final List<Map<String, String>> staff = [
    {
      "name": "Dr. Anjali Verma",
      "dept": "Mathematics",
      "salary": "₹45,000",
      "date": "30/3/2024",
      "status": "Paid",
    },
    {
      "name": "Rajesh Kumar",
      "dept": "Science",
      "salary": "₹38,000",
      "date": "30/3/2024",
      "status": "Paid",
    },
    {
      "name": "Meena Patel",
      "dept": "English",
      "salary": "₹42,000",
      "date": "28/2/2024",
      "status": "Pending",
    },
    {
      "name": "Suresh Nair",
      "dept": "Physical Education",
      "salary": "₹35,000",
      "date": "30/3/2024",
      "status": "Paid",
    },
    {
      "name": "Kavita Singh",
      "dept": "Administration",
      "salary": "₹32,000",
      "date": "28/2/2024",
      "status": "Pending",
    },
    {
      "name": "Amit Sharma",
      "dept": "History",
      "salary": "₹36,000",
      "date": "30/3/2024",
      "status": "Paid",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CommonDataTable(
      columns: const [
        DataColumn(label: Text("STAFF NAME")),
        DataColumn(label: Text("DEPARTMENT")),
        DataColumn(label: Text("MONTHLY SALARY")),
        DataColumn(label: Text("LAST PAID")),
        DataColumn(label: Text("STATUS")),
        DataColumn(label: Text("ACTIONS")),
      ],

      rows: staff.map((data) {
        final isPaid = data['status'] == "Paid";

        return DataRow(
          cells: [
            DataCell(
              Text(
                data['name']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            DataCell(Text(data['dept']!)),

            DataCell(
              Text(
                data['salary']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            DataCell(Text(data['date']!)),

            DataCell(
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isPaid
                      ? Colors.green.shade100
                      : Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  data['status']!,
                  style: TextStyle(
                    color: isPaid ? Colors.green : Colors.orange,
                  ),
                ),
              ),
            ),

            DataCell(
              InkWell(
                onTap: () {},
                child: Text(
                  isPaid ? "View Details" : "Process Payment",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}