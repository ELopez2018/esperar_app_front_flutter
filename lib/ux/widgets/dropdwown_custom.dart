import 'package:flutter/material.dart';

class DropdownCustom extends StatefulWidget {
  const DropdownCustom({
    super.key,
    required this.items,
    this.width,
    this.label,
    this.bottomPadding = true,
    this.onChanged,
    this.error,
  });
  final List<DropdownMenuItem<String>> items;
  final double? width;
  final String? label;
  final bool bottomPadding;
  final ValueChanged<String?>? onChanged;
  final bool? error;

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  String? driverState;

  @override
  void initState() {
    driverState =  widget.items.isNotEmpty ? widget.items[0].value : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ? 10 : 0),
      child: SizedBox(
        width: widget.width ?? double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) Text(widget.label!),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              items: widget.items,
              onChanged: (String? value) {
                driverState = value!;
                widget.onChanged!(value);
              },
              value: driverState,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              validator: (value) {
                if(value == widget.items[0].value){
                  return 'Este campo es requerido';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
      
          ],
        ),
      ),
    );
  }
}
