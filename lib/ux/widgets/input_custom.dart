import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  const InputCustom({
    super.key,
    required this.label,
    this.image, this.bottomPadding = true,
  });
  final String label;
  final String? image;
  final bool bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: bottomPadding ? 10 : 0),
      child: Column(
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
                prefixIcon: image != null ? Image.asset(image!) : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              ),
              cursorColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
