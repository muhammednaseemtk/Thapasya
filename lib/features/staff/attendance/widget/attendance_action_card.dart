import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import '../controller/attendance_controller.dart';
import 'attendance_dot.dart';

class AttendanceActionCard extends StatelessWidget {
  final String name;
  final int index;

  const AttendanceActionCard({
    super.key,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final initials = name.length >= 2
        ? name.substring(0, 2).toUpperCase()
        : name.toUpperCase();

    return Consumer<AttendanceController>(
      builder: (context, controller, _) {

        if (controller.statusList.length <= index) {
          return const SizedBox();
        }

        final status = controller.statusList[index];

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F5F7),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.black10,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2F5D82),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Row(
                children: [
                  AttendanceDot(
                    isActive: status == 1,
                    color: Colors.green,
                    onTap: () {
                      controller.setStatus(index, 1);
                    },
                  ),
                  const SizedBox(width: 8),

                  AttendanceDot(
                    isActive: status == 2,
                    color: Colors.red,
                    onTap: () {
                      controller.setStatus(index, 2);
                    },
                  ),
                  const SizedBox(width: 8),

                  AttendanceDot(
                    isActive: status == 3,
                    color: Colors.orange,
                    onTap: () {
                      controller.setStatus(index, 3);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}