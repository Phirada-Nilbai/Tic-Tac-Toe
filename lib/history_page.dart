import 'package:flitter_tic/constant.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> winners;
  const HistoryPage({
    Key? key,
    required this.score,
    required this.winners,
  }) : super(key: key);

  final List<int> score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('History',
            style: kCustomText(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: winners.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                '${index + 1}. Player ${winners[index].toUpperCase()} Won',
                style: kCustomText(fontSize: 18),
              ),
              trailing: Text(
                'player X : ${score[0]}      player O : ${score[1]}',
                style: kCustomText(fontSize: 18),
              ));
        },
      ),
    );
  }
}/* Center(
        child: Text(
          'player X ${score[0]}      player O ${score[1]}',
          style: kCustomText(fontSize: 25),
        ),
      ),
    );
  }
} */
