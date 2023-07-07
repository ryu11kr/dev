import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bbanto',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  Grade createState() => Grade();
}

class Grade extends State<MyHomePage> {
  //Grade({super.key});
  Widget custext = const Text('data');
  Icon cusicon = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 140, 255),
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: false,
        elevation: 0.0,
        title: custext,
        titleTextStyle: const TextStyle(
          color: Colors.brown,
          backgroundColor: Colors.tealAccent,
        ),
        actions: <Widget>[
          IconButton(
            icon: cusicon,
            onPressed: () {
              setState(
                () {
                  if (cusicon.icon == Icons.search) {
                    print('ttt');
                    custext = const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    );
                  } else {}
                },
              );
            },
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/search-1508.gif'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 85,
              color: Colors.white70,
              endIndent: 30.0,
            ),
            Text(
              'name',
              style: TextStyle(
                color: Colors.black87,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'skkkk',
              style: TextStyle(
                color: Colors.black87,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'power level',
              style: TextStyle(
                color: Colors.black87,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '14',
              style: TextStyle(
                color: Colors.black87,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'using 1',
                  style: TextStyle(
                    fontSize: 29,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'using 2',
                  style: TextStyle(
                    fontSize: 29,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'using 3',
                  style: TextStyle(
                    fontSize: 29,
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/angry-2498.gif'),
                radius: 60.0,
                backgroundColor: Color.fromARGB(255, 0, 140, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
