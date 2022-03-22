import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibo/screens/home_vibo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.collection('teste').doc('testamdpasd').set({
    "teste": 123,
    'teste2': 'firebase',
  });
  //initializeDateFormatting();
  //await initializeParse();
  //setupLocators();
  runApp(const MyApp());
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
