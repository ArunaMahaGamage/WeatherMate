import 'package:hive_flutter/hive_flutter.dart';

class FavoritesRepository {
  static const boxName = 'favorites';
  final Box<String> _box = Hive.box<String>(boxName);

  Future<List<String>> list() async => _box.values.toList();

  Future<void> add(String city) async {
    if (!_box.values.contains(city)) {
      await _box.add(city);
    }
  }

  Future<void> update(int index, String newCity) async {
    await _box.putAt(index, newCity);
  }

  Future<void> removeAt(int index) async {
    await _box.deleteAt(index);
  }

  Future<void> clear() async => _box.clear();
}
