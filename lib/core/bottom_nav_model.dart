import 'package:todyapp/screens/inbox_page.dart';

import '../utils/all_packages.dart';

class BottomNavModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _children = [
    const HomePage(),
    const InboxPage(),
    Container(),
    Container(),
    Container(),
  ];

  List<Widget> get children => _children;

  updateIndex(int index, context) {
    _currentIndex = index;
    notifyListeners();
  }
}
