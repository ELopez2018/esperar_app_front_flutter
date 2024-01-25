import 'package:flutter/foundation.dart';

class LayoutProvider extends ChangeNotifier {
  int _page = 0;

  void setPage(int value) {
    _page = value;
    notifyListeners();
  }

  int getPage() => _page;
}