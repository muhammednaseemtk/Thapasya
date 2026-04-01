import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thapasya/features/student/attendance/model/monthly_data.dart';

class MonthlyProgressItem extends StatelessWidget {
  final MonthlyData data;

  const MonthlyProgressItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Text(data.month),
        ),
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 8,
            percent: data.percentage,
            backgroundColor: Colors.grey.shade300,
            progressColor: Colors.green,
            barRadius:  Radius.circular(10),
            padding:  EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            "${data.present}/${data.total}",
            textAlign: TextAlign.end,
            style:  TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}