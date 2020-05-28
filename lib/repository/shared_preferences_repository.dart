import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  final SharedPreferences _prefs;

  SharedPreferencesRepository(this._prefs);

  static const String _isOnboardingCompleted = 'isOnboardingCompleted';
  static const String _currentFilmId = 'currentFilmId';
  static const String _currentFilmDateTime = 'currentFilmDate';

  void setOnboardingCompleted() {
    _prefs.setBool(_isOnboardingCompleted, true);
  }

  void setCurrentFilmId(int newCurrentFilmId) {
    _prefs.setInt(_currentFilmId, newCurrentFilmId);
  }

  void setCurrentFilmDateTime(DateTime newCurrentFilmDateTime) {
    _prefs.setString(
        _currentFilmDateTime, newCurrentFilmDateTime.toIso8601String());
  }

  bool isOnboardingCompleted() {
    return _prefs.getBool(_isOnboardingCompleted) ?? false;
  }

  int getCurrentFilmId() {
    return _prefs.getInt(_currentFilmId) ?? null;
  }

  DateTime getCurrentFilmDateTime() {
    return DateTime.parse(_prefs.getString(_currentFilmDateTime) ??
        DateTime(1997).toIso8601String());
  }
}
