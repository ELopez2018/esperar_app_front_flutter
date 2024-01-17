import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  const InputCustom({
    super.key,
    required this.label,
    required this.image,
  });
  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        Container(
          height: 50,
          decoration: BoxDecoration(border: Border.all()),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Image.asset(image), border: InputBorder.none),
            cursorColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
