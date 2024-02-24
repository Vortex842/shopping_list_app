import 'package:hive/hive.dart';

class DataBaseHive<T> {
  final String nameTable;

  DataBaseHive({required this.nameTable});

  ///Get all the data map
  ///
  Future<Map<dynamic, T>> get dataMap async {
    final box = await Hive.openBox<T>(nameTable);
    return box.toMap();
  }

  ///Save or delete individual data
  ///
  Future<void> save(String id, T data) async {
    final box = await Hive.openBox<T>(nameTable);
    box.put(id, data);
  }

  Future<void> delete(String id) async {
    final box = await Hive.openBox<T>(nameTable);

    box.delete(id);
  }

  ///Save multiple data
  ///
  Future<void> saveAll(Map<String, T> dataMap) async {
    final box = await Hive.openBox<T>(nameTable);
    box.putAll(dataMap);
  }

  /// Delete multiple data totally or by ids
  ///
  Future<void> deleteAll() async {
    final box = await Hive.openBox<T>(nameTable);

    box.clear();
  }

  Future<void> deleteAllByIDs(List<String> ids) async {
    final box = await Hive.openBox<T>(nameTable);

    box.deleteAll(ids);
  }
}
