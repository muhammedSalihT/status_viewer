import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_viewer_app/screens/all_status/view_model/all_status_provider.dart';

import 'screens/all_status/view/all_status_screen.dart';

void main() {
   Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AllStatusProvider>(
      
      create: (_) => AllStatusProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AllStatusScreen(),
      ),
    );
  }
}
