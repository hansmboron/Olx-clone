import 'package:rxdart/rxdart.dart';

class DrawerBlock {
  final BehaviorSubject<int> _pageCtrl = BehaviorSubject<int>.seeded(0);

  Stream<int> get outPage => _pageCtrl.stream;

  int _page = 0;

  void setPage(int page) {
    if (page == _page) return;
    _page = page;
    _pageCtrl.add(page);
  }

  void dispose() {
    _pageCtrl.close();
  }
}
