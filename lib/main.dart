import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_management/providers/user.dart';

import 'Screens/SpleashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void initState() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Chettinad',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SpleashScreen(),
        // home: FeesPage(),
      ),
    );
  }
}
