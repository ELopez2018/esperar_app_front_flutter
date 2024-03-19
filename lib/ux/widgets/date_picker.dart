import 'package:flutter/material.dart';

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({
    Key? key,
    this.width,
    this.label,
    this.bottomPadding = true,
    required this.controller,
  }) : super(key: key);
  final double? width;
  final String? label;
  final bool bottomPadding;
  final TextEditingController controller;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePickerCustom> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
String formattedDate =
    '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}';

    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ? 10 : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) Text(widget.label!),
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            width: widget.width ?? double.infinity,
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: formattedDate,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  prefixIcon: const Icon(Icons.calendar_month_rounded),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(0),
                  )),
              readOnly: true,
              onTap: _selectDate,
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }

Future<void> _selectDate() async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2024),
    lastDate: DateTime.now(),
  );

  if (picked != null) {
    setState(() {
      String formattedDate = formatDate(picked); // Utilizar la función formatDate
      widget.controller.text = formattedDate;
    });
  }
}

String formatDate(DateTime date) {
  // Obtener el día, mes y año de la fecha
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();

  // Construir la cadena de fecha en el formato día-mes-año
  return '$day-$month-$year';
}
}
