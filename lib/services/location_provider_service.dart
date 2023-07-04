import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/profile.dart';

class LocationProviderService with ChangeNotifier {
  List<Profile> profiles = [];

  Future<void> initializeProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final profileData = prefs.getStringList('profiles');

    if (profileData != null) {
      profiles = profileData
          .map((data) {
            final profileValues = data.split(',');
            return Profile(
              name: profileValues[0],
              latitude: double.parse(profileValues[1]),
              longitude: double.parse(profileValues[2]),
            );
          })
          .toList();
    }

    notifyListeners();
  }

  Future<void> saveProfile(Profile profile) async {
    profiles.add(profile);

    final prefs = await SharedPreferences.getInstance();
    final profileData = profiles
        .map((profile) =>
            '${profile.name},${profile.latitude.toStringAsFixed(6)},${profile.longitude.toStringAsFixed(6)}')
        .toList();

    await prefs.setStringList('profiles', profileData);

    notifyListeners();
  }

  Future<void> removeProfile(Profile profile) async {
    profiles.remove(profile);

    final prefs = await SharedPreferences.getInstance();
    final profileData = profiles
        .map((profile) =>
            '${profile.name},${profile.latitude.toStringAsFixed(6)},${profile.longitude.toStringAsFixed(6)}')
        .toList();

    await prefs.setStringList('profiles', profileData);

    notifyListeners();
  }
}