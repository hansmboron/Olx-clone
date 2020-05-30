import 'package:rxdart/subjects.dart';

class HomeBloc {
  final BehaviorSubject<String> _searchCtrl = BehaviorSubject<String>();

  Stream<String> get outSearch => _searchCtrl.stream;

  void setSearch(String search) {
    _searchCtrl.add(search);
  }

  void dispose() {
    _searchCtrl.close();
  }
}
