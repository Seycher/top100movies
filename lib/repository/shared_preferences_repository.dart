import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesRepository {
  final SharedPreferences _prefs;

  SharedPreferencesRepository(this._prefs);

  static const String _isOnboardingCompleted = 'isOnboardingCompleted';
  static const String _currentFilmId = 'currentFilmId';
  static const String _currentFilmDateTime = 'currentFilmDate';
  static const String _listOfRejectedMovies = 'listOfRejectedMovies';

  void setOnboardingCompleted() {
    _prefs.setBool(_isOnboardingCompleted, true);
  }

  void setCurrentFilmId(final int newCurrentFilmId) {
    _prefs.setInt(_currentFilmId, newCurrentFilmId);
  }

  void setCurrentFilmDateTime(final DateTime newCurrentFilmDateTime) {
    _prefs.setString(
        _currentFilmDateTime, newCurrentFilmDateTime?.toIso8601String());
  }

  bool isOnboardingCompleted() {
    return _prefs.getBool(_isOnboardingCompleted) ?? false;
  }

  int getCurrentFilmId() {
    return _prefs.getInt(_currentFilmId) ?? null;
  }

  DateTime getCurrentFilmDateTime() {
    final date = _prefs.getString(_currentFilmDateTime);

    if (date == null) {
      return null;
    } else {
      return DateTime.parse(_prefs.getString(_currentFilmDateTime));
    }
  }

  void setListOfRejectedMoviesId(final List<int> listOfRejectedMovies) {
    _prefs.setStringList(
      _listOfRejectedMovies,
      listOfRejectedMovies.map((movieId) => movieId.toString()).toList(),
    );
  }

  List<int> getListOfRejectedMoviesId() {
    final list = _prefs.getStringList(_listOfRejectedMovies) ?? [];
    return list.map((movieId) => int.parse(movieId)).toList();
  }
}
