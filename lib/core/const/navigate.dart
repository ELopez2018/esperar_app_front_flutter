import 'package:flutter/material.dart';

push(BuildContext context, String route, dynamic args) async {
  return await Navigator.of(context).pushNamed(route, arguments: args);
}

pushReplacement(BuildContext context, String route, dynamic args) async {
  return  await Navigator.of(context).pushReplacementNamed(route, arguments: args);
}

pop(BuildContext context, bool? state) async {
  return  Navigator.of(context).pop(state);
}