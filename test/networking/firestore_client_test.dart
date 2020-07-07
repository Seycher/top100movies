import 'package:applaca/networking/firestore_client.dart';
import 'package:applaca/networking/model/firestore_movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

//This tests DO NOT work
//TODO: Create proper tests

//MockFirestoreInstance _firestoreMock;
//FirestoreClient _firestoreClient;
//
//const String testCollectionName = 'movies';
//
//const int id = 1;
//const String movieTitle = 'title';
//const int year = 1;
//const String category = '';
//const String director = '';
//const int duration = 1;
//const String plot = '';
//const String encouragement = '';
//const String posterUrl = '';
//const String rewardUrl = '';
//
//final firestoreMovie = FirestoreMovie(
//  id: id,
//  title: movieTitle,
//  year: year,
//  category: category,
//  director: director,
//  duration: duration,
//  plot: plot,
//  encouragement: encouragement,
//  posterUrl: posterUrl,
//  rewardUrl: rewardUrl,
//);
//
//final listOfFirestoreMovies = [firestoreMovie, firestoreMovie];
//
//void addMockMovieToFirestore(MockFirestoreInstance firestoreMock) {
//  firestoreMock.collection(testCollectionName).add({
//    'id': id,
//    'title': movieTitle,
//    'year': year,
//    'category': category,
//    'director': director,
//    'duration': duration,
//    'plot': plot,
//    'encouragement': encouragement,
//    'posterUrl': posterUrl,
//    'rewardUrl': rewardUrl,
//  });
//}
//
//main() {
//  setUp(() async {
//    _firestoreMock = MockFirestoreInstance();
//    addMockMovieToFirestore(_firestoreMock);
//    addMockMovieToFirestore(_firestoreMock);
//    _firestoreClient = FirestoreClient();
//  });
//
//  test('getCollectionReference() was called on Instance of Firestore',
//      () async {
//    await _firestoreClient.getCollectionReference();
//
//    verify(_firestoreMock.collection(testCollectionName));
//  });
//
//  test('getCollectionReference() returns data from Firestore', () async {
//    final result = await _firestoreClient.getCollectionReference();
//
//    expect(result, _firestoreMock.collection(testCollectionName));
//  });
//
//  test('getMovieList() was called on Instance of Firestore', () async {
//    await _firestoreClient.getMovieList();
//
//    verify(_firestoreMock.collection(testCollectionName).getDocuments());
//  });
//
//  test('getMovieList() returns list of FirestoreMovies', () async {
//    final result = await _firestoreClient.getMovieList();
//
//    expect(result, listOfFirestoreMovies);
//  });
//}
