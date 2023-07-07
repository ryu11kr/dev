import 'package:flutter/material.dart';

class Player {
  String? name;
  Player({required this.name});
}

void main() {
  //var nico = Player(name: 'pototo');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 24, 27, 184),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 221, 172),
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFFF0011),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 95, 119),
                            border: Border.all(
                              width: 1.0,
                              color: Color.fromARGB(255, 92, 172, 99),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 111, 224, 158),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 53, 51, 175),
                                  ),
                                ),
                                child: Text(
                                  'Hey, Selena',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 167, 54, 219),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 218, 156, 22),
                                  ),
                                ),
                                child: Text(
                                  'Welcome back',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 18,
                                    //fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
