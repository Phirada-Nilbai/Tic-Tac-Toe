// ignore_for_file: file_names, unused_field, duplicate_ignore

import 'package:flutter/material.dart';
import 'alert_dialog.dart';
import 'constant.dart';
import 'history_page.dart';

// ignore: camel_case_types
class fivexfivePage extends StatefulWidget {
  const fivexfivePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _fivexfivePageState createState() => _fivexfivePageState();
}

// ignore: camel_case_types
class _fivexfivePageState extends State<fivexfivePage> {
  int _scoreX = 0;
  int _scoreO = 0;

  bool _turnOfO = true;
  int _filledBoxes = 0;
  final List<String> _winners = [];
  final List<String> _xOrOList5x5 = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryPage(
                    score: [_scoreX, _scoreO],
                    winners: _winners,
                  ),
                ),
              );
            },
          )
        ],
        title: Text(
          'Tic Tac Toe 5x5',
          style: kCustomText(
              fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          SizedBox(
            height: 50,
            child: Text("place 5 in a row!", style: kCustomText(fontSize: 22)),
          ),
          _buildGrid4(),
          _buildTurn(),
        ],
      ),
    );
  }

  Widget _buildGrid4() {
    return Expanded(
      flex: 5,
      child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 25,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Center(
                  child: Text(
                    _xOrOList5x5[index],
                    style: TextStyle(
                      color: _xOrOList5x5[index] == 'x'
                          ? Colors.black
                          : Colors.red,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildTurn() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          _turnOfO ? 'Turn of O' : 'Turn of X',
          style: kCustomText(color: Colors.black),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (_turnOfO && _xOrOList5x5[index] == '') {
        _xOrOList5x5[index] = 'o';
        _filledBoxes += 1;
      } else if (!_turnOfO && _xOrOList5x5[index] == '') {
        _xOrOList5x5[index] = 'x';
        _filledBoxes += 1;
      }

      _turnOfO = !_turnOfO;
      _checkTheWinner();
    });
  }

  void _checkTheWinner() {
    // check first row
    if (_xOrOList5x5[0] == _xOrOList5x5[1] &&
        _xOrOList5x5[0] == _xOrOList5x5[2] &&
        _xOrOList5x5[0] == _xOrOList5x5[3] &&
        _xOrOList5x5[0] == _xOrOList5x5[4] &&
        _xOrOList5x5[0] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[0]);
      _winners.add(_xOrOList5x5[0]);
      return;
    }

    // check second row
    if (_xOrOList5x5[5] == _xOrOList5x5[6] &&
        _xOrOList5x5[5] == _xOrOList5x5[7] &&
        _xOrOList5x5[5] == _xOrOList5x5[8] &&
        _xOrOList5x5[5] == _xOrOList5x5[9] &&
        _xOrOList5x5[5] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[5]);
      _winners.add(_xOrOList5x5[5]);
      return;
    }

    // check third row
    if (_xOrOList5x5[10] == _xOrOList5x5[11] &&
        _xOrOList5x5[10] == _xOrOList5x5[12] &&
        _xOrOList5x5[10] == _xOrOList5x5[13] &&
        _xOrOList5x5[10] == _xOrOList5x5[14] &&
        _xOrOList5x5[10] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[10]);
      _winners.add(_xOrOList5x5[10]);
      return;
    }

    // check four row
    if (_xOrOList5x5[15] == _xOrOList5x5[16] &&
        _xOrOList5x5[15] == _xOrOList5x5[17] &&
        _xOrOList5x5[15] == _xOrOList5x5[18] &&
        _xOrOList5x5[15] == _xOrOList5x5[19] &&
        _xOrOList5x5[15] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[15]);
      _winners.add(_xOrOList5x5[15]);
      return;
    }
    // check five row
    if (_xOrOList5x5[20] == _xOrOList5x5[21] &&
        _xOrOList5x5[20] == _xOrOList5x5[22] &&
        _xOrOList5x5[20] == _xOrOList5x5[23] &&
        _xOrOList5x5[20] == _xOrOList5x5[24] &&
        _xOrOList5x5[20] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[20]);
      _winners.add(_xOrOList5x5[20]);
      return;
    }

    // check first column
    if (_xOrOList5x5[0] == _xOrOList5x5[5] &&
        _xOrOList5x5[0] == _xOrOList5x5[10] &&
        _xOrOList5x5[0] == _xOrOList5x5[15] &&
        _xOrOList5x5[0] == _xOrOList5x5[20] &&
        _xOrOList5x5[0] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[0]);
      _winners.add(_xOrOList5x5[0]);
      return;
    }

    // check second column
    if (_xOrOList5x5[1] == _xOrOList5x5[6] &&
        _xOrOList5x5[1] == _xOrOList5x5[11] &&
        _xOrOList5x5[1] == _xOrOList5x5[16] &&
        _xOrOList5x5[1] == _xOrOList5x5[21] &&
        _xOrOList5x5[1] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[1]);
      _winners.add(_xOrOList5x5[1]);
      return;
    }

    // check third column
    if (_xOrOList5x5[2] == _xOrOList5x5[7] &&
        _xOrOList5x5[2] == _xOrOList5x5[12] &&
        _xOrOList5x5[2] == _xOrOList5x5[17] &&
        _xOrOList5x5[2] == _xOrOList5x5[22] &&
        _xOrOList5x5[2] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[2]);
      _winners.add(_xOrOList5x5[2]);
      return;
    }

    // check 4column
    if (_xOrOList5x5[3] == _xOrOList5x5[8] &&
        _xOrOList5x5[3] == _xOrOList5x5[13] &&
        _xOrOList5x5[3] == _xOrOList5x5[18] &&
        _xOrOList5x5[3] == _xOrOList5x5[23] &&
        _xOrOList5x5[3] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[3]);
      _winners.add(_xOrOList5x5[3]);
      return;
    }

    // check 5column
    if (_xOrOList5x5[4] == _xOrOList5x5[9] &&
        _xOrOList5x5[4] == _xOrOList5x5[14] &&
        _xOrOList5x5[4] == _xOrOList5x5[19] &&
        _xOrOList5x5[4] == _xOrOList5x5[24] &&
        _xOrOList5x5[4] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[4]);
      _winners.add(_xOrOList5x5[4]);
      return;
    }

    // check diagonal
    if (_xOrOList5x5[0] == _xOrOList5x5[6] &&
        _xOrOList5x5[0] == _xOrOList5x5[12] &&
        _xOrOList5x5[0] == _xOrOList5x5[18] &&
        _xOrOList5x5[0] == _xOrOList5x5[24] &&
        _xOrOList5x5[0] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[0]);
      _winners.add(_xOrOList5x5[0]);
      return;
    }

    // check diagonal
    if (_xOrOList5x5[4] == _xOrOList5x5[8] &&
        _xOrOList5x5[4] == _xOrOList5x5[12] &&
        _xOrOList5x5[4] == _xOrOList5x5[16] &&
        _xOrOList5x5[4] == _xOrOList5x5[20] &&
        _xOrOList5x5[4] != '') {
      _showAlertDialog('Winner', _xOrOList5x5[4]);
      _winners.add(_xOrOList5x5[4]);
      return;
    }

    if (_filledBoxes == 25) {
      _showAlertDialog('Draw', '');
    }
  }

  void _showAlertDialog(String title, String winner) {
    showAlertDialog(
        context: context,
        title: title,
        content: winner == ''
            ? 'The match ended in a draw'
            : 'Player ${winner.toUpperCase()} Win!!',
        defaultActionText: 'OK',
        onOkPressed: () {
          _clearBoard();
          Navigator.of(context).pop();
        });

    if (winner == 'o') {
      _scoreO += 1;
    } else if (winner == 'x') {
      _scoreX += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 25; i++) {
        _xOrOList5x5[i] = '';
      }
    });

    _filledBoxes = 0;
  }
}
