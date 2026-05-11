import 'package:flutter/material.dart';

class AttendanceState extends StatelessWidget {
  final bool isLoading;
  final bool isEmpty;

  const AttendanceState({
    super.key,
    required this.isLoading,
    required this.isEmpty,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (isEmpty) {
      return const Center(
        child: Padding(padding: EdgeInsets.all(20), child: Text("No Students")),
      );
    }

    return const SizedBox();
  }
}
