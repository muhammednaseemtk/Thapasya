import 'package:flutter/material.dart';

class EmptyEnquiryView extends StatelessWidget {
  final String text;

  const EmptyEnquiryView({
    super.key,
    this.text = "Select an enquiry to view details",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}