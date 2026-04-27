import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/staff/home/controller/schedule_controller.dart';
import 'shedule_item.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleController>(
      builder: (context, c, _) {
        

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black10,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Today's Schedule", style: AppFonts.poppinsSemiBold7),
              const SizedBox(height: 16),

              if (c.isLoading)
                const Center(
                  child: CircularProgressIndicator(color: AppColors.deepBlue),
                )
              else if (c.schedules.isEmpty)
                const Text("No Schedule")
              else
                Column(
                  children: List.generate(c.schedules.length, (index) {
                    final item = c.schedules[index];

                    return Column(
                      children: [
                        ScheduleItem(
                          title: item.course,
                          date: item.classDate,
                          time: item.classTime,
                        ),
                        if (index != c.schedules.length - 1)
                          const Divider(height: 24),
                      ],
                    );
                  }),
                ),
            ],
          ),
        );
      },
    );
  }
}
