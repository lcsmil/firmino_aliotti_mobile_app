import 'package:flutter/material.dart';
import 'package:firmino_aliotti/model/planilha.dart';
import 'package:firmino_aliotti/controller/planilha_controller.dart';

class Listadeclientes extends StatefulWidget {
  Listadeclientes({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListadeclientesState createState() => _ListadeclientesState();
}

class _ListadeclientesState extends State<Listadeclientes> {
  List<FeedbackForm> cadastroItems = List<FeedbackForm>();

  @override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.cadastroItems = feedbackItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Lista de Clientes',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.amber[200],
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: cadastroItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(15),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        size: 50,
                      ),
                      Text(cadastroItems[index].nome,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.phone),
                        Text("Tel: ${cadastroItems[index].telefone}")
                      ]),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          color: Colors.grey[300],
                          margin: EdgeInsets.all(3),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.monetization_on,
                                size: 40,
                                color: Colors.black,
                              ),
                              title: Text(
                                'Valor do Contrato:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                "R\$ ${cadastroItems[index].contrato}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              trailing: Icon(Icons.more_vert),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Card(
                          color: Colors.grey[100],
                          margin: EdgeInsets.all(3),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: <Widget>[
                              Icon(
                                Icons.check_circle,
                                size: 30,
                                color: Colors.green,
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Valor Pago: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "R\$ ${cadastroItems[index].pago}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Card(
                          color: Colors.grey[100],
                          margin: EdgeInsets.all(3),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.error,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Row(children: <Widget>[
                                  Text(
                                    "Valor Restante: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                Text(
                                  "R\$ ${cadastroItems[index].restante}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
