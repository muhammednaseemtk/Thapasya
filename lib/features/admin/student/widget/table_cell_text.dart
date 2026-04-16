import 'package:flutter/material.dart';

class TableCellText extends StatelessWidget {
  final String text;
  final bool isBold;
  final bool isLink;

  const TableCellText(
    this.text, {
    super.key,
    this.isBold = false,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110, 
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          color: isLink ? Colors.blue : Colors.black,
        ),
      ),
    );
  }
}