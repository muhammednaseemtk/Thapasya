import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/features/admin/programme%20booking/controller/number_stepper_controller.dart';

class NumberStepperField extends StatelessWidget {
  const NumberStepperField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberStepperController>(
      builder: (context, controller, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    controller.value.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),

              Column(
                children: [
                  InkWell(
                    onTap: controller.increment,
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.keyboard_arrow_up, size: 18),
                    ),
                  ),
                  InkWell(
                    onTap: controller.decrement,
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.keyboard_arrow_down, size: 18),
                    ),
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