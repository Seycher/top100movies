import 'package:applaca/networking/model/firestore_movie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirestoreClient {
  static const String moviesCollectionName = 'movies';

  Future<CollectionReference> getCollectionReference(
      {String collectionName}) async {
    return Firestore.instance.collection('$collectionName');
  }

  Future<List<FirestoreMovie>> getMovieList() async {
    final movieCollection =
        await getCollectionReference(collectionName: moviesCollectionName);

    List<FirestoreMovie> firestoreMovieList = List<FirestoreMovie>();

    await movieCollection.getDocuments().then(
          (value) => value.documents.forEach(
            (map) {
              firestoreMovieList.add(FirestoreMovie.fromMap(map.data));
            },
          ),
        );

    return firestoreMovieList;
  }
}
