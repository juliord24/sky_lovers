import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<SunriseSunset> favorites = <SunriseSunset>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void addFavorite(SunriseSunset event) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .doc(event.id)
          .set(event.toJson());

      favorites.add(event);
    }
  }

  void removeFavorite(SunriseSunset event) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .doc(event.id)
          .delete();

      favorites.remove(event);
    }
  }

  void loadFavorites() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .get();

      favorites.value = snapshot.docs
          .map((doc) =>
              SunriseSunset.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    }
  }

  bool isFavorite(SunriseSunset event) {
    return favorites.any((item) => item.id == event.id);
  }
}

class SunriseSunset {
  final String id;
  final String type; // 'sunrise' o 'sunset'
  final String time; // Cambiado a String
  final DateTime date;

  SunriseSunset({
    required this.id,
    required this.type,
    required this.time,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'time': time, // Ahora es un String
        'date': date.toIso8601String(),
      };

  factory SunriseSunset.fromJson(Map<String, dynamic> json) => SunriseSunset(
        id: json['id'],
        type: json['type'],
        time: json['time'], // Ahora es un String
        date: DateTime.parse(json['date']),
      );
}
