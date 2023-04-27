import 'package:flitter_tic/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 70)),
                          Center(
                            child: Text(
                              'Tic Tac Toe',
                              style: kCustomText(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/4x4');
                              },
                              style: kCustumButton(),
                              child:
                                  Text("4x4", style: kCustomText(fontSize: 22)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/5x5');
                                },
                                style: kCustumButton(),
                                child: Text("5x5",
                                    style: kCustomText(fontSize: 22))),
                          ),
                        ]),
                  ),
                  Positioned(
                    top: 30,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        showRulesPopup();
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.settings,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]));
  }

  void showRulesPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Rules and Gameplay",
            style: kCustomText(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Rules of 4x4",
                  style: kCustomText(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  " - place four of your pieces in a row, either vertically, horizontally, or diagonally If this is achieved",
                  style: kCustomText(),
                ),
                const SizedBox(height: 20),
                Text(
                  "Rules of 5x5",
                  style: kCustomText(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  " - place five of your pieces in a row, either vertically, horizontally, or diagonally If this is achieved",
                  style: kCustomText(),
                ),
                const SizedBox(height: 25),
                Text(
                  "The game ends in a win, otherwise the game ends in a draw once no more moves are possible.",
                  style: kCustomText(),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
