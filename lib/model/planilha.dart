// Classe de dados que armazena os dados dos campos de Feedback
class FeedbackForm {
  String nome;
  String email;
  String telefone;
  String contrato;
  String pago;
  String restante;

  FeedbackForm(this.nome, this.email, this.telefone, this.contrato, this.pago,
      this.restante);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['nome']}",
        "${json['email']}",
        "${json['telefone']}",
        "${json['contrato']}",
        "${json['pago']}",
        "${json['restante']}");
  }

  // Metodo para obter os parametros de GET.
  Map toJson() => {
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'contrato': contrato,
        'pago': pago,
        'restante': restante,
      };
}
