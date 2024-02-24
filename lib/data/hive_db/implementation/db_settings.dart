import '../repository/db_hive.dart';

class SettingsDB extends DataBaseHive<dynamic> {
  SettingsDB() : super(nameTable: 'settings');
}
