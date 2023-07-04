import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'services/location_provider_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationProviderService()..initializeProfiles(),
      child: MaterialApp(
        title: 'Location Profiles',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (_) => HomeScreen(),
          '/profile_setup': (_) => ProfileSetupPage(),
          
        },
      ),
    );
  
  }
}
