import 'package:flutter/material.dart';
import 'package:vibo/screens/settings.dart';
import 'package:vibo/screens/login.dart';
import 'package:vibo/screens/play.dart';

class HomeViboScreen extends StatefulWidget {
  const HomeViboScreen({Key? key}) : super(key: key);

  @override
  _HomeViboScreenState createState() => _HomeViboScreenState();
}

class _HomeViboScreenState extends State<HomeViboScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Text('VIBO'),
              SizedBox(
                width: 10,
              ),
              Text(
                'by Vinicios',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  icon: Icon(Icons.settings)),
            ),
          ],
        ),
        body: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PlayScreen()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(169, 176, 185, 0.42),
                    spreadRadius: 0,
                    blurRadius: 8.0,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  'PLAY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
