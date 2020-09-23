import 'package:flutter/material.dart';
import 'package:firmino_aliotti/model/planilha.dart';
import 'package:firmino_aliotti/controller/planilha_controller.dart';

class AdicionarCliente extends StatefulWidget {
  AdicionarCliente({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AdicionarClienteState createState() => _AdicionarClienteState();
}

class _AdicionarClienteState extends State<AdicionarCliente> {
  // Cria uma global key que identifica o widget form e permite a validação
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // Controllers do TextField
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneNoController = TextEditingController();
  TextEditingController contratoController = TextEditingController();
  TextEditingController pagoController = TextEditingController();
  TextEditingController restanteController = TextEditingController();

  // Metodo de submit do Feedback e de salvar no Google Sheets
  void _submitForm() {
    // Valida retorno verdadeiro se form for válido ou falso se ao contrário
    if (_formKey.currentState.validate()) {
      // Se for válido, então continua.
      FeedbackForm feedbackForm = FeedbackForm(
        nomeController.text,
        emailController.text,
        telefoneNoController.text,
        contratoController.text,
        pagoController.text,
        restanteController.text,
      );

      FormController formController = FormController();

      _showSnackbar("Cadastrando, aguarde...");

      // Faz o submit do 'feedbackForm' e salva no Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        print("Resposta: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback de que foi salvo com sucesso no Google Sheets.
          _showSnackbar("Cliente Cadastrado!");
        } else {
          // Erro ocorrido ao salvar no Google Sheets.
          _showSnackbar("Erro ao cadastrar cliente!");
        }
      });
    }
  }

  // Metodo para mostrar um snackbar de 'mensagem'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(
        content: Container(
      height: 50,
      child: Text(
        message,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    ));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "Adicionar Cliente",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber[200],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: nomeController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Insira um nome';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person_add,
                              size: 30,
                            ),
                            labelText: 'Nome',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 23)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (!value.contains("@")) {
                            return 'Insira um e-mail válido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              size: 30,
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 23)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: telefoneNoController,
                        validator: (value) {
                          if (value.trim().length != 11) {
                            return 'Entre com o DDD + telefone';
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 20),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              size: 30,
                            ),
                            labelText: 'Telefone',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 23)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          controller: contratoController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Entre com o valor do contrato:';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.monetization_on,
                                size: 30,
                              ),
                              labelText: 'Valor do contrato',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 23)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                          controller: pagoController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Entre com o valor já pago:';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.attach_money,
                                size: 30,
                              ),
                              labelText: 'Valor pago',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 23)),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )),
            Container(
              width: 300,
              child: RaisedButton(
                color: Colors.amber[200],
                textColor: Colors.white,
                padding: EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  _submitForm();
                  FocusManager.instance.primaryFocus.unfocus();
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
