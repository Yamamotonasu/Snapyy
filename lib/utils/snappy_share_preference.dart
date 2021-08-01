import 'package:shared_preferences/shared_preferences.dart';

class SnappySharePreference {

  Future<void> setValue() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('counter');
    if (count != null) {
      await prefs.setInt('counter', count + 1);
    } else {
      prefs.setInt('counter', 0);
    }
    print(count);
  } 
}