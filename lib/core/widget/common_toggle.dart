import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class CommonToggle extends StatelessWidget {
  final List<String> items;

  const CommonToggle({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: items.map((item) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                item,
                style: AppFonts.poppinsSemiBold2.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}