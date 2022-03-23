import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibo/screens/home_vibo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();


  FirebaseFirestore.instance.collection('123').doc('abs').set({'teste': 'teste'});
  //initializeDateFormatting();
  //await initializeParse();
  //setupLocators();
  runApp(const MyApp());
}

Future<void> initFirebase() async {
  Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB_zCgkucqgpS6KoJDDSBezn5ErvBwRGbE",
      appId: "1:841626617338:android:8430d004ca97c3effb1043",
      messagingSenderId: "841626617338",
      projectId: "vibo-9693f",
    ),
  );
}

/*
void setupLocators() {
  //GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(SettingsStore());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'hUirFtuCw3rsGX733S31az6pVsRuuc158n01ab4J',
    'https://parseapi.back4app.com/',
    clientKey: 'KYBefJBxvQSWxP5AAvZRJ1JG5lEhFWcyUCbU3Pfp',
    autoSendSessionId: true,
    debug: true,
  );
}
*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'VIBO',
      debugShowCheckedModeBanner: false,
      home: HomeViboScreen(),
    );
  }
}
