import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/planilha.dart';

/// Classe que salva o FeedbackForm no Google Sheets usando
/// "HTTP GET request" no Google App Script Web URL e recebe a resposta de status.
class FormController {
  // Google App Script Web URL. (a URL foi omitida por questoes de segurança)
  static const String URL = "";
  static const String URL_post = "";
  // Mensagem de "Sucesso"
  static const STATUS_SUCCESS = "SUCCESS";

  /// Função assíncrona que salva o feedback, analisa os parametros de feedbackForm
  /// e manda um HTTP GET request na URL. Se der certo, chama o "callback".
  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      await http
          .post(URL_post, body: feedbackForm.toJson())
          .then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  /// Função assíncrona que carrega feedback da URL e retorna uma lista
  Future<List<FeedbackForm>> getFeedbackList() async {
    return await http.get(URL).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
    });
  }
}
