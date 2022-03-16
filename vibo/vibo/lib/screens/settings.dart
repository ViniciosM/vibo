import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    int currentTime = 10;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Configurações'),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                label: const Text(
                  'Salvar alterações',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 20, left: width * 0.1, right: width * 0.1),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tempo de transição:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  currentTime -= 5;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.green,
                              )),
                          Text(currentTime.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  currentTime += 5;
                                });
                              },
                              icon: Icon(Icons.add, color: Colors.green)),
                          Text('segundos',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                child: ExpansionTile(
                  backgroundColor: Colors.white,
                  leading: Icon(
                    Icons.tv,
                    color: Colors.green,
                  ),
                  title: const Text(
                    'Imagens exibidas na TV',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (_, context) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          child: ListTile(
                            leading: Container(
                              child: Image.asset(''),
                            ),
                            title: Text(
                              'URL',
                              style: TextStyle(color: Colors.green),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                              onPressed: () {},
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20, right: 20),
        child: TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: Colors.green, padding: EdgeInsets.all(20)),
            onPressed: () {},
            icon: Icon(
              Icons.add_photo_alternate_outlined,
              color: Colors.white,
            ),
            label: Text(
              'Nova imagem',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
