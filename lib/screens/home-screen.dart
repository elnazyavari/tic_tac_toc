import 'package:flutter/material.dart';

void main() {
  runApp(homescreen());
}

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _ApplicationState();
}

class _ApplicationState extends State<homescreen> {
  List<String> XorOlist = ['', '', '', '', '', '', '', '', ''];
  var fillboxes = 0;
  bool gamehaseresult = false;
  bool isturnO = true;
  int scoreX = 0;
  int scoreO = 0;
  String winnertittle = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  getclear();
                },
                icon: Icon(Icons.refresh))
          ],
          title: Text('tic tac toe'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: SafeArea(
          child: Column(
            children: [
              getscoreboard(),
              SizedBox(
                height: 30.0,
              ),
              getresultbutton(),
              SizedBox(
                height: 20.0,
              ),
              getgridview(),
              getturn(),
            ],
          ),
        ));
  }

  void getclear() {
    setState(() {
      for (int i = 0; i < XorOlist.length; i++) {
        XorOlist[i] = '';
        scoreO = 0;
        scoreX = 0;
      }
    });
    fillboxes = 0;
  }

  Widget getturn() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        isturnO ? 'turn O' : 'turn X',
        style: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  void tapped(int index) {
    if (gamehaseresult) {
      return;
    }
    setState(() {
      if (XorOlist[index] != '') {
        return;
      }
      if (isturnO && XorOlist[index] == '') {
        XorOlist[index] = 'O';
        fillboxes = fillboxes + 1;
      } else {
        XorOlist[index] = 'X';
        fillboxes = fillboxes + 1;
      }
      isturnO = !isturnO;
      getwinner();
    });
  }

  getwinner() {
    if (XorOlist[0] == XorOlist[1] &&
        XorOlist[0] == XorOlist[2] &&
        XorOlist[0] != '') {
      setresult(XorOlist[0], 'winner is ' + XorOlist[0]);
      return;
    }
    if (XorOlist[3] == XorOlist[4] &&
        XorOlist[3] == XorOlist[5] &&
        XorOlist[3] != '') {
      setresult(XorOlist[3], 'winner is ' + XorOlist[3]);
      return;
    }
    if (XorOlist[6] == XorOlist[7] &&
        XorOlist[6] == XorOlist[8] &&
        XorOlist[6] != '') {
      setresult(XorOlist[6], 'winner is ' + XorOlist[6]);
      return;
    }
    if (XorOlist[0] == XorOlist[4] &&
        XorOlist[0] == XorOlist[8] &&
        XorOlist[0] != '') {
      setresult(XorOlist[0], 'winner is ' + XorOlist[0]);
      return;
    }
    if (XorOlist[2] == XorOlist[4] &&
        XorOlist[2] == XorOlist[6] &&
        XorOlist[2] != '') {
      setresult(XorOlist[2], 'winner is ' + XorOlist[2]);
      return;
    }
    if (XorOlist[0] == XorOlist[3] &&
        XorOlist[0] == XorOlist[6] &&
        XorOlist[0] != '') {
      setresult(XorOlist[0], 'winner is ' + XorOlist[0]);
      return;
    }
    if (XorOlist[1] == XorOlist[4] &&
        XorOlist[1] == XorOlist[7] &&
        XorOlist[1] != '') {
      setresult(XorOlist[1], 'winner is ' + XorOlist[1]);
      return;
    }
    if (XorOlist[2] == XorOlist[5] &&
        XorOlist[2] == XorOlist[8] &&
        XorOlist[2] != '') {
      setresult(XorOlist[2], 'winner is ' + XorOlist[2]);
      return;
    }
    if (fillboxes == 9) {
      setresult('', 'game is equal');
    }
  }

  void setresult(String winner, String title) {
    setState(() {
      gamehaseresult = true;
      winnertittle = title;
      if (winner == 'X') {
        scoreX = scoreX + 1;
      } else if (winner == 'O') {
        scoreO = scoreO + 1;
      } else {
        scoreX = scoreX + 1;
        scoreO = scoreO + 1;
      }
    });
  }

  Widget getresultbutton() {
    return Visibility(
      visible: gamehaseresult,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            gamehaseresult = false;
            getclear();
          });
        },
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          side: BorderSide(color: Colors.white, width: 2),
        ),
        child: Text(
          '$winnertittle,playe again!',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget getgridview() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  XorOlist[index],
                  style: TextStyle(
                      color: XorOlist[index] == 'X' ? Colors.white : Colors.red,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getscoreboard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player O',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$scoreO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player X',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$scoreX',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
