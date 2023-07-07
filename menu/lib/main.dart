import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'appbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        /*
        leading: IconButton(
          icon: const Icon(Icons.menu),
          visualDensity: const VisualDensity(),
          onPressed: () {
            print('메뉴버튼클릭함');
          },
        ),
        */
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            visualDensity: const VisualDensity(),
            onPressed: () {
              print('카트버튼클릭함');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            visualDensity: const VisualDensity(),
            onPressed: () {
              print('검색버튼클릭함');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: const AssetImage('assets/laugh-beam.png'),
                backgroundColor: Colors.red[200],
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/south-korea.png'),
                  backgroundColor: Colors.red[200],
                ),
                // CircleAvatar(
                //   backgroundImage: const AssetImage('assets/south-korea.png'),
                //   backgroundColor: Colors.red[200],
                // ),
              ],
              accountName: const Text('coco'),
              accountEmail: const Text('coco@fm.com'),
              onDetailsPressed: () {
                print('위 아래 위위 아래');
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: const Text('home'),
              tileColor: Colors.black45,
              onTap: () {
                print('home click now');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.green,
              ),
              title: const Text(
                'setting',
                style: TextStyle(
                  color: Colors.pinkAccent,
                ),
              ),
              onTap: () {
                print('setting click now');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: const Icon(
                Icons.question_answer,
                color: Colors.green,
              ),
              title: const Text('Q&A'),
              onTap: () {
                print('Q&A click now');
              },
              trailing: const Icon(
                Icons.add,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
