



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/profile.dart';
import '../../services/location_provider_service.dart';

class ProfileSetupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProviderService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Profile Setup')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: latitudeController,
              decoration: InputDecoration(labelText: 'Latitude'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: longitudeController,
              decoration: InputDecoration(labelText: 'Longitude'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                final name = nameController.text.trim();
                final latitude = double.tryParse(latitudeController.text) ?? 0.0;
                final longitude = double.tryParse(longitudeController.text) ?? 0.0;

                if (name.isNotEmpty) {
                  locationProvider.saveProfile(Profile(name: name, latitude: latitude, longitude: longitude));
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}