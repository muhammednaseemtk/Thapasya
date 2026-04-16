import 'package:flutter/material.dart';

class SearchStatusFilter extends StatelessWidget {
  final String hintText;

  const SearchStatusFilter({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
            TextField(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: "All Status",
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: const [
                  DropdownMenuItem(
                    value: "All Status",
                    child: Text("All Status"),
                  ),
                  DropdownMenuItem(
                    value: "Paid",
                    child: Text("Paid"),
                  ),
                  DropdownMenuItem(
                    value: "Pending",
                    child: Text("Pending"),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}