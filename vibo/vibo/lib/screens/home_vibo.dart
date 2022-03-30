import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vibo/screens/settings.dart';
import 'package:vibo/screens/login.dart';
import 'package:vibo/screens/play.dart';
import 'package:vibo/utils/constants.dart';

class HomeViboScreen extends StatefulWidget {
  const HomeViboScreen({Key? key}) : super(key: key);

  @override
  _HomeViboScreenState createState() => _HomeViboScreenState();
}

class _HomeViboScreenState extends State<HomeViboScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
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
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        centerTitle: true,
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
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-vibo.png',
              height: 250,
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayScreen(
                              docId: Constants.docFPO,
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green[800],
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
                    'FPO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayScreen(
                              docId: Constants.docSB,
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red[800],
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
                    'SÔNIA BURGOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayScreen(
                              docId: Constants.docCantina,
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.indigo[800],
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
                    'CANTINA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayScreen(
                              docId: Constants.docSalesBurgos,
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange[900],
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
                    'SALES BURGOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        )),
      ),
    );
  }
}
