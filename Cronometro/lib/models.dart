class Relogio {
  num horas = 0, minutos = 0, segundos = 0;
  bool relogioParado = true;

  Relogio() {}

  String horario_atual() {
    // this.horas = DateTime.now().hour;
    // this.minutos = DateTime.now().minute;
    // this.segundos = DateTime.now().second;
    //print(DateTime.now().millisecond.toString());

    String h = horas < 10 ? "0" + horas.toString() : horas.toString();
    String m = minutos < 10 ? "0" + minutos.toString() : minutos.toString();
    String s = segundos < 10 ? "0" + segundos.toString() : segundos.toString();
    return "${h}:${m}:${s}";
  }

  void zerar() {
    horas = 0;
    minutos = 0;
    segundos = 0;
    relogioParado = true;
  }

  void parar_relogio() {
    relogioParado = true;
  }

  void iniciar_relogio() {
    relogioParado = false;
  }
}

class Historico {
  String tempo = "";
  String nome = "";
  Historico(String tempo_relogio, String nome) {
    this.tempo = tempo_relogio;
    this.nome = nome;
  }
}

List<Historico> historicos = [];
