// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'history_page.dart';
import 'alert_dialog.dart';
import 'constant.dart';

// ignore: camel_case_types
class fourxfourPage extends StatefulWidget {
  const fourxfourPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _fourxfourPageState createState() => _fourxfourPageState();
}

// ignore: camel_case_types
class _fourxfourPageState extends State<fourxfourPage> {
  int _scoreX = 0;
  int _scoreO = 0;
  bool _turnOfO = true;
  int _filledBoxes = 0;
  final List<String> _winners = [];

  final List<String> _xOrOList4x4 = [
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
          'Tic Tac Toe 4x4',
          style: kCustomText(
              fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          SizedBox(
            height: 50,
            child: Text("place 4 in a row!", style: kCustomText(fontSize: 22)),
          ),
          _buildGrid4(),
          _buildTurn(),
        ],
      ),
    );
  }

  Widget _buildGrid4() {
    return Expanded(
      flex: 4,
      child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 16,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
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
                    _xOrOList4x4[index],
                    style: TextStyle(
                      color: _xOrOList4x4[index] == 'x'
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
      if (_turnOfO && _xOrOList4x4[index] == '') {
        _xOrOList4x4[index] = 'o';
        _filledBoxes += 1;
      } else if (!_turnOfO && _xOrOList4x4[index] == '') {
        _xOrOList4x4[index] = 'x';
        _filledBoxes += 1;
      }

      _turnOfO = !_turnOfO;
      _checkTheWinner();
    });
  }

  void _checkTheWinner() {
    // check first row
    if (_xOrOList4x4[0] == _xOrOList4x4[1] &&
        _xOrOList4x4[0] == _xOrOList4x4[2] &&
        _xOrOList4x4[0] == _xOrOList4x4[3] &&
        _xOrOList4x4[0] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[0]);
      _winners.add(_xOrOList4x4[0]);
      return;
    }

    // check second row
    if (_xOrOList4x4[4] == _xOrOList4x4[5] &&
        _xOrOList4x4[4] == _xOrOList4x4[6] &&
        _xOrOList4x4[4] == _xOrOList4x4[7] &&
        _xOrOList4x4[4] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[4]);
      _winners.add(_xOrOList4x4[4]);
      return;
    }

    // check third row
    if (_xOrOList4x4[8] == _xOrOList4x4[9] &&
        _xOrOList4x4[8] == _xOrOList4x4[10] &&
        _xOrOList4x4[8] == _xOrOList4x4[11] &&
        _xOrOList4x4[8] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[8]);
      _winners.add(_xOrOList4x4[8]);
      return;
    }
    // check fourth row
    if (_xOrOList4x4[12] == _xOrOList4x4[13] &&
        _xOrOList4x4[12] == _xOrOList4x4[14] &&
        _xOrOList4x4[12] == _xOrOList4x4[15] &&
        _xOrOList4x4[12] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[12]);
      _winners.add(_xOrOList4x4[12]);
      return;
    }

    // check first column
    if (_xOrOList4x4[0] == _xOrOList4x4[4] &&
        _xOrOList4x4[0] == _xOrOList4x4[8] &&
        _xOrOList4x4[0] == _xOrOList4x4[12] &&
        _xOrOList4x4[0] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[0]);
      _winners.add(_xOrOList4x4[0]);
      return;
    }

    // check second column
    if (_xOrOList4x4[1] == _xOrOList4x4[5] &&
        _xOrOList4x4[1] == _xOrOList4x4[5] &&
        _xOrOList4x4[1] == _xOrOList4x4[9] &&
        _xOrOList4x4[1] == _xOrOList4x4[13] &&
        _xOrOList4x4[1] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[1]);
      _winners.add(_xOrOList4x4[1]);
      return;
    }

    // check third column
    if (_xOrOList4x4[2] == _xOrOList4x4[6] &&
        _xOrOList4x4[2] == _xOrOList4x4[10] &&
        _xOrOList4x4[2] == _xOrOList4x4[14] &&
        _xOrOList4x4[2] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[2]);
      _winners.add(_xOrOList4x4[2]);
      return;
    }

    // check fourth column
    if (_xOrOList4x4[3] == _xOrOList4x4[7] &&
        _xOrOList4x4[3] == _xOrOList4x4[11] &&
        _xOrOList4x4[3] == _xOrOList4x4[15] &&
        _xOrOList4x4[3] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[3]);
      _winners.add(_xOrOList4x4[3]);
      return;
    }

    // check diagonal
    if (_xOrOList4x4[0] == _xOrOList4x4[5] &&
        _xOrOList4x4[0] == _xOrOList4x4[10] &&
        _xOrOList4x4[0] == _xOrOList4x4[15] &&
        _xOrOList4x4[0] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[0]);
      _winners.add(_xOrOList4x4[0]);
      return;
    }

    // check diagonal
    if (_xOrOList4x4[3] == _xOrOList4x4[6] &&
        _xOrOList4x4[3] == _xOrOList4x4[9] &&
        _xOrOList4x4[3] == _xOrOList4x4[12] &&
        _xOrOList4x4[3] != '') {
      _showAlertDialog('Winner', _xOrOList4x4[3]);
      _winners.add(_xOrOList4x4[3]);
      return;
    }

    if (_filledBoxes == 16) {
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
      for (int i = 0; i < 16; i++) {
        _xOrOList4x4[i] = '';
      }
    });

    _filledBoxes = 0;
  }
}
