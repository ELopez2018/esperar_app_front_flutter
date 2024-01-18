
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key, required this.text, required this.onTap, this.width,
  });

  final String text;
  final GestureTapCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:  BoxConstraints(
          minWidth: 200, maxWidth: width ?? 200),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child:  Text(text, style: const TextStyle(fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }
}
