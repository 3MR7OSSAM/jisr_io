import 'package:flutter/material.dart';
import 'package:jisr/core/common/widgets/custom_button.dart';

import '../../../core/configs/theme/app_colors.dart';

class WorkingTimeWidget extends StatefulWidget {
  final VoidCallback onBack;

  const WorkingTimeWidget({super.key, required this.onBack});

  @override
  State<WorkingTimeWidget> createState() => _WorkingTimeWidgetState();
}

class _WorkingTimeWidgetState extends State<WorkingTimeWidget> {
  final Map<String, TimeOfDay> startTimes = {
    for (var day in ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'])
      day: const TimeOfDay(hour: 6, minute: 0),
  };

  final Map<String, TimeOfDay> endTimes = {
    for (var day in ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'])
      day: const TimeOfDay(hour: 18, minute: 0),
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onBack,
              ),
              const Text(
                "Working Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(),
          for (var day in ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'])
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      _timeButton(onPress:  () => _selectTime(context, day, true),time: startTimes[day]!.format(context)),
                      const SizedBox(width: 10),
                      _timeButton(onPress:  () => _selectTime(context, day, false),time: endTimes[day]!.format(context)),

                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          const CustomButton(bgColor:AppColors.primary, child: Text("Save",style: TextStyle(color: AppColors.whiteColor,fontSize: 16),) ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: widget.onBack,
              child: const Text("Back to settings",style: TextStyle(color: AppColors.primary),),
            ),
          ),
        ],
      ),
    );
  }
  _timeButton ({required String time ,void Function()? onPress})  {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
          child: Text(time,style: const TextStyle(color: Colors.black54),),
        ),

      ),
    );
  }
  Future<void> _selectTime(BuildContext context, String day, bool isStartTime) async {
    final initialTime = isStartTime ? startTimes[day]! : endTimes[day]!;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            dialogBackgroundColor: Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTimes[day] = pickedTime;
        } else {
          endTimes[day] = pickedTime;
        }
      });
    }
  }

}
