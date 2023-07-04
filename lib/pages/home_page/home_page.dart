import 'package:flutter/material.dart';
import 'package:location_app/services/location_provider_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProviderService>(context);
    final profiles = locationProvider.profiles;

    return Scaffold(
      appBar: AppBar(title: Text('Profiles')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ListTile(
            title: Text(profile.name),
            subtitle: Text('Lat: ${profile.latitude.toStringAsFixed(6)}, Lon: ${profile.longitude.toStringAsFixed(6)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => locationProvider.removeProfile(profile),
            ),
            onTap: () => Navigator.pushNamed(context, '/profile_details', arguments: profile),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/profile_setup'),
      ),
    );
  }
}
