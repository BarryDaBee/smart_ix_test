import 'package:flutter/material.dart';
import 'package:smart_home/features/home/presentation/widgets/weekday_chip.dart';

class WeekdaysPicker extends StatefulWidget {
  const WeekdaysPicker({
    super.key,
    required this.onDaySelected,
    this.selectedDates = const [],
  });
  final List<String> selectedDates;
  final ValueChanged<List<String>> onDaySelected;

  @override
  State<WeekdaysPicker> createState() => _DaysOfWeekPickerState();
}

class _DaysOfWeekPickerState extends State<WeekdaysPicker> {

  late final List<String> _selectedDays = [...widget.selectedDates];

  final List<String> weekdays = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];

  @override
  void initState() {

    if (_selectedDays.isEmpty){
      final weekdayIndex = DateTime.now().weekday - 1;
      widget.onDaySelected(_selectedDays);
      _addDay(weekdays[weekdayIndex]);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(7, (index) {
        final weekday = weekdays[index];
        final isSelected = _selectedDays.contains(weekday);
        return InkWell(
          onTap: () {
            if (isSelected) {
              _removeDay(weekday);
            } else {
              _addDay(weekday);
            }
            widget.onDaySelected(_selectedDays);
          },
          child: WeekdayChip(
            data: weekday,
            isActive: isSelected,
          ),
        );
      }),
    );
  }

  void _addDay(String day) {
    setState(() {
      _selectedDays.add(day);
    });
  }

  void _removeDay(String day) {
    setState(() {
      _selectedDays.remove(day);
    });
  }
}
