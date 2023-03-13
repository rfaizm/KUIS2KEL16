import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int idx = 0;
  List<String> data = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      data.add("Video $i");
    }
  }

  static List<Center> halaman = [
    Center(child: Text("satu")),
    Center(child: Text("dua")),
    Center(child: Tiga()),
  ];

  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Flutter',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: halaman[idx],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          selectedItemColor: Colors.red,
          onTap: onItemTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "Programmer"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "My Learning"),
          ],
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 16'),
            content: const Text(
                'Rachman Faiz Maulana (rachmanmaulana06@upi.edu) ; Destira Lestari Saraswati (dest.saras29@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class Listview extends StatelessWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(6.0),
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.network(
                        "https://picsum.photos/200",
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: IconButton(
                            icon: Icon(Icons.volume_up),
                            onPressed: () {
                              //tombol suara
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Card ${index + 1}"),
                        Text("Ini Video ${index + 1}"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            trailing: TextButton(
              child: Text("Delete"),
              onPressed: () {
                // aksi saat tombol delete ditekan
              },
            ),
          ),
        );
      },
    );
  }
}

//method tabbar
class Tiga extends StatelessWidget {
  const Tiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromARGB(255, 236, 68, 124)),
                    borderRadius: BorderRadius.circular(5)),
                height: 40,
                child: TabBar(
                  tabs: [
                    Expanded(
                      child: Container(
                          height: 40,
                          width: double.infinity,
                          child: Tab(text: "Following")),
                    ),
                    Expanded(
                      child: Container(
                          height: 40,
                          width: double.infinity,
                          child: Tab(text: "Download")),
                    ),
                    Expanded(
                      child: Container(
                          height: 40,
                          width: double.infinity,
                          child: Tab(text: "Following")),
                    ),
                  ],
                  indicator: BoxDecoration(
                    color: Colors.red,
                  ),
                  labelColor: Color.fromARGB(255, 255, 255, 255),
                  unselectedLabelColor: Color.fromARGB(255, 7, 31, 51),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("isi tab 1")),
                  Center(child: Listview()),
                  Center(child: Text("isi tab 3")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
