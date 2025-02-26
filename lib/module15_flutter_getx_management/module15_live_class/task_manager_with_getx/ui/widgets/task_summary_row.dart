import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/colors.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/ui/widgets/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TaskSummaryRow extends StatelessWidget {
  const TaskSummaryRow(
      {super.key,
      required this.newTaskCount,
      required this.progressTaskCount,
      required this.canceledTaskCount,
      required this.completedTaskCount});

  final int newTaskCount,
      progressTaskCount,
      canceledTaskCount,
      completedTaskCount;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: AnimateList(
      interval: 100.ms,
      effects: [SlideEffect(duration: 200.ms, curve: Curves.easeInOut)],
      children: [
        Expanded(
          child: SummaryCard(
            taskCount: newTaskCount,
            taskType: 'New Task',
            textColor: newTaskColor,
          ),
        ),
        Expanded(
          child: SummaryCard(
            taskCount: progressTaskCount,
            taskType: 'Progress',
            textColor: progressTaskColor,
          ),
        ),
        Expanded(
          child: SummaryCard(
            taskCount: canceledTaskCount,
            taskType: 'Cancelled',
            textColor: canceledTaskColor,
          ),
        ),
        Expanded(
          child: SummaryCard(
            taskCount: completedTaskCount,
            taskType: 'Completed',
            textColor: completedTaskColor,
          ),
        ),
      ],
    ));
  }
}
