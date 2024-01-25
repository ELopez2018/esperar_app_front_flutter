import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom(
      {super.key, required this.title, this.action, this.suffixWidget});

  final Widget title;
  final Widget? action;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
                alignment: Alignment.center, child: action ?? const SizedBox()),
            title,
            suffixWidget ??
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                      ),
                      const Text(
                        'LOGO APP',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                
          ],
        ),
      ),
    );
  }
}
