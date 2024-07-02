import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medhome/generated/assets.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    super.key,
    required this.isStartDate,
  });
  final bool isStartDate;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime _endDate = DateTime.now();
  Future<void> _selectedDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: widget.isStartDate
          ? DateTime(2023)
          : _startDate.add(
              const Duration(days: 1),
            ),
      lastDate: widget.isStartDate ? _startDate : _endDate,
      initialDate: widget.isStartDate ? _startDate : _endDate,
    );
    if (date != null) {
      if (widget.isStartDate) {
        setState(() {
          _startDate = date;
        });
      } else {
        setState(() {
          _endDate = date;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _selectedDate();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.isStartDate
                  ? DateFormat('d.MM.yyyy').format(_startDate)
                  : DateFormat('d.MM.yyyy').format(_endDate),
              style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SvgPicture.asset(
              Assets.imagesCalendar,
              width: 28,
              fit: BoxFit.contain,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: Size(double.infinity, 50),
          elevation: 3,
        ),
      ),
    );
  }
}