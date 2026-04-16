import 'package:flutter/material.dart';
import 'package:thapasya/core/widget/common_data_table.dart';

class FeesTable extends StatelessWidget {
  const FeesTable({super.key});

  static final List<Map<String, String>> fees = [
    {
      "roll": "2024001",
      "name": "Priya Sharma",
      "class": "Class 10-A",
      "total": "₹45,000",
      "paid": "₹30,000",
      "pending": "₹15,000",
      "status": "Partial",
    },
    {
      "roll": "2024002",
      "name": "Rahul Kumar",
      "class": "Class 9-B",
      "total": "₹42,000",
      "paid": "₹0",
      "pending": "₹42,000",
      "status": "Pending",
    },
    {
      "roll": "2024003",
      "name": "Ananya Reddy",
      "class": "Class 11-A",
      "total": "₹48,000",
      "paid": "₹48,000",
      "pending": "₹0",
      "status": "Paid",
    },
    {
      "roll": "2024004",
      "name": "Arjun Patel",
      "class": "Class 8-C",
      "total": "₹40,000",
      "paid": "₹40,000",
      "pending": "₹0",
      "status": "Paid",
    },
    {
      "roll": "2024001",
      "name": "Priya Sharma",
      "class": "Class 10-A",
      "total": "₹45,000",
      "paid": "₹30,000",
      "pending": "₹15,000",
      "status": "Partial",
    },
    {
      "roll": "2024002",
      "name": "Rahul Kumar",
      "class": "Class 9-B",
      "total": "₹42,000",
      "paid": "₹0",
      "pending": "₹42,000",
      "status": "Pending",
    },
    {
      "roll": "2024003",
      "name": "Ananya Reddy",
      "class": "Class 11-A",
      "total": "₹48,000",
      "paid": "₹48,000",
      "pending": "₹0",
      "status": "Paid",
    },
    {
      "roll": "2024004",
      "name": "Arjun Patel",
      "class": "Class 8-C",
      "total": "₹40,000",
      "paid": "₹40,000",
      "pending": "₹0",
      "status": "Paid",
    },
    {
      "roll": "2024004",
      "name": "Arjun Patel",
      "class": "Class 8-C",
      "total": "₹40,000",
      "paid": "₹40,000",
      "pending": "₹0",
      "status": "Paid",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CommonDataTable(
      columns: const [
        DataColumn(label: Text("ROLL NO")),
        DataColumn(label: Text("STUDENT NAME")),
        DataColumn(label: Text("CLASS")),
        DataColumn(label: Text("TOTAL FEES")),
        DataColumn(label: Text("PAID")),
        DataColumn(label: Text("PENDING")),
        DataColumn(label: Text("STATUS")),
        DataColumn(label: Text("ACTIONS")),
      ],

      rows: fees.map((data) {
        final status = data['status'];

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

            DataCell(Text(data['total']!)),

            DataCell(
              Text(
                data['paid']!,
                style: const TextStyle(color: Colors.green),
              ),
            ),

            DataCell(
              Text(
                data['pending']!,
                style: const TextStyle(color: Colors.red),
              ),
            ),

            DataCell(
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: status == "Paid"
                      ? Colors.green.shade100
                      : status == "Partial"
                          ? Colors.orange.shade100
                          : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status!,
                  style: TextStyle(
                    color: status == "Paid"
                        ? Colors.green
                        : status == "Partial"
                            ? Colors.orange
                            : Colors.red,
                  ),
                ),
              ),
            ),

            DataCell(
              InkWell(
                onTap: () {},
                child: Text(
                  status == "Paid"
                      ? "View Receipt"
                      : "Collect Payment",
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