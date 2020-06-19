import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesMock extends Mock implements SharedPreferences {}

const String _isOnboardingCompleted = 'isOnboardingCompleted';
const String _currentFilmId = 'currentFilmId';
const String _currentFilmDateTime = 'currentFilmDate';
const int filmId = 1;
final DateTime filmWatchedDateTime = DateTime.now();

SharedPreferencesMock _sharedPreferencesMock;
SharedPreferencesRepository _sharedPreferencesRepository;

main() {
  setUp(() {
    _sharedPreferencesMock = SharedPreferencesMock();
    _sharedPreferencesRepository =
        SharedPreferencesRepository(_sharedPreferencesMock);
  });

  test('setOnboardingCompleted() was called on Instance of SharedPreferences',
      () {
    _sharedPreferencesRepository.setOnboardingCompleted();

    verify(_sharedPreferencesMock.setBool(_isOnboardingCompleted, any));
  });

  test('setCurrentFilmId() was called on Instance of SharedPreferences', () {
    _sharedPreferencesRepository.setCurrentFilmId(filmId);

    verify(_sharedPreferencesMock.setInt(_currentFilmId, filmId));
  });

  test('setCurrentFilmDateTime() was called on Instance of SharedPreferences',
      () {
    _sharedPreferencesRepository.setCurrentFilmDateTime(filmWatchedDateTime);

    verify(_sharedPreferencesMock.setString(
        _currentFilmDateTime, filmWatchedDateTime.toIso8601String()));
  });

  test(
      'isOnboardingCompleted() returns false from SharedPreferences when there is no value inside',
      () {
    final result = _sharedPreferencesRepository.isOnboardingCompleted();

    expect(result, false);
  });

  test('isOnboardingCompleted() returns true from SharedPreferences', () {
    when(_sharedPreferencesMock.getBool(_isOnboardingCompleted)).thenAnswer(
      (_) => true,
    );

    final result = _sharedPreferencesRepository.isOnboardingCompleted();

    expect(result, true);
  });

  test('isOnboardingCompleted() was called on Instance of SharedPreferences',
      () {
    _sharedPreferencesRepository.isOnboardingCompleted();

    verify(_sharedPreferencesMock.getBool(_isOnboardingCompleted));
  });

  test(
      'getCurrentFilmId() returns null from SharedPreferences when there is no value inside',
      () {
    final result = _sharedPreferencesRepository.getCurrentFilmId();

    expect(result, null);
  });

  test('getCurrentFilmId() returns data from SharedPreferences', () {
    when(_sharedPreferencesMock.getInt(_currentFilmId))
        .thenAnswer((_) => filmId);

    final result = _sharedPreferencesRepository.getCurrentFilmId();

    expect(result, filmId);
  });

  test('getCurrentFilmId() was called on Instance of SharedPreferences', () {
    _sharedPreferencesRepository.getCurrentFilmId();

    verify(_sharedPreferencesMock.getInt(_currentFilmId));
  });

  test(
      'getCurrentFilmDateTime() returns null from SharedPreferences when there is no value inside',
      () {
    final result = _sharedPreferencesRepository.getCurrentFilmDateTime();

    expect(result, null);
  });

  test('getCurrentFilmDateTime() returns data from SharedPreferences', () {
    when(_sharedPreferencesMock.getString(_currentFilmDateTime))
        .thenAnswer((_) => filmWatchedDateTime.toIso8601String());

    final result = _sharedPreferencesRepository.getCurrentFilmDateTime();

    expect(result, filmWatchedDateTime);
  });

  test('getCurrentFilmDateTime() was called on Instance of SharedPreferences',
      () {
    _sharedPreferencesRepository.getCurrentFilmDateTime();

    verify(_sharedPreferencesMock.getString(_currentFilmDateTime));
  });
}
