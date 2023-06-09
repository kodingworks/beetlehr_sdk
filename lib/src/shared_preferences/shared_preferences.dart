import 'package:shared_preferences/shared_preferences.dart';

/// Save the provided token to shared preferences
void saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

/// Retrieve the saved token from shared preferences
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

/// Check if a token exists in shared preferences
Future<bool> isToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token') != null;
}

/// Remove the saved token from shared preferences
Future<bool> removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  return true;
}
