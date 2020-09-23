import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                'images/logo escritorio.png',
                height: 150,
                width: 150,
                alignment: Alignment.center,
              ),
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/listadeclientes');
              },
              padding: EdgeInsets.all(15),
              icon: Icon(Icons.people),
              label: Text(
                'Lista de clientes',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.amber[200])),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/adicionarcliente');
              },
              padding: EdgeInsets.all(15),
              icon: Icon(Icons.person_add),
              label: Text(
                'Adicionar Clientes',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.amber[200])),
            )
          ],
        ),
      )),
    );
  }
}
