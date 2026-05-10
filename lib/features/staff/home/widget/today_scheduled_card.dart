import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/staff/home/controller/schedule_controller.dart';
import 'package:thapasya/features/staff/home/widget/schedule_shimmer.dart';
import 'package:thapasya/features/staff/home/widget/shedule_item.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final padding = screenWidth * 0.04;
    final spacing = screenWidth * 0.04;

    return Consumer<ScheduleController>(
      builder: (context, controller, _) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
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
              SizedBox(height: spacing),
              if (controller.isLoading)
                const ScheduleShimmer()
              else if (controller.schedules.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("No Schedule"),
                  ),
                )
              else
                Column(
                  children: List.generate(controller.schedules.length, (index) {
                    final item = controller.schedules[index];
                    return Column(
                      children: [
                        ScheduleItem(
                          title: item.course,
                          date: item.classDate,
                          time: item.classTime,
                        ),

                        if (index != controller.schedules.length - 1)
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
