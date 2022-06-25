import 'historico.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'models.dart';
import 'gravarhistorico.dart';

class TelaCronometro extends StatefulWidget {
  List<Historico> historicos = [];
  State<StatefulWidget> createState() {
    return EstadoCronometro();
  }
}

class EstadoCronometro extends State<TelaCronometro> {
  Relogio rl = Relogio();
  String mensagem = "CRONÔMETRO PRONTO";
  late Timer tempo;

  @override
  void initState() {
    super.initState();
    tempo = Timer.periodic(Duration(milliseconds: 1), (timer) {});
  }

  void passar_1segundo() {
    setState(() {
      if (rl.segundos < 59) {
        rl.segundos++;
      } else {
        rl.segundos = 0;
        if (rl.minutos < 59) {
          rl.minutos++;
        } else {
          rl.minutos = 0;
          if (rl.horas < 59) {
            rl.horas++;
          } else {
            rl.horas = 0;
          }
        }
      }
    });
  }

  void aciona_cronometro() {
    setState(() {
      if (rl.relogioParado) {
        rl.iniciar_relogio();
        mensagem = "CRONÔMETRO EM ANDAMENTO";
        tempo = Timer.periodic(Duration(seconds: 1), (timer) {
          //print(rl.horario_atual());
          passar_1segundo();
        });
      } else {
        //print("pause");
        tempo.cancel();
        rl.parar_relogio();
        mensagem = "CRONÔMETRO PAUSADO";
      }
    });
  }

  void zerar_cronometro() {
    setState(() {
      tempo.cancel();
      mensagem = "CRONÔMETRO ZERADO";
      rl.zerar();
    });
  }

  void gravar_cronometro() {
    setState(() {
      tempo.cancel();
      rl.parar_relogio();
    });
  }

//0xFF4D4E4F
  @override
  Widget build(BuildContext bc) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: Text("Cronômetro"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
          ),
          Text(
            rl.horario_atual(),
            style: TextStyle(
              fontSize: 40,
              color: rl.relogioParado ? Colors.white : Colors.green,
            ),
          ),
          Container(
            height: 50.0,
            child: Text(mensagem,
                style: TextStyle(
                    fontSize: 15,
                    color: rl.relogioParado ? Colors.white : Colors.green)),
            alignment: Alignment.center,
          ),
          Container(height: 100.0),
          Row(
            children: [
              FloatingActionButton(
                heroTag: "play_pause",
                onPressed: aciona_cronometro,
                child: Icon(
                  rl.relogioParado
                      ? Icons.play_arrow_rounded
                      : Icons.pause_circle_outline,
                ),
                backgroundColor: Colors.green,
              ),
              FloatingActionButton(
                heroTag: "zerar",
                onPressed: zerar_cronometro,
                child: Icon(Icons.settings_backup_restore_sharp),
                backgroundColor: Colors.green,
              ),
              FloatingActionButton(
                heroTag: "save",
                onPressed: () {
                  gravar_cronometro();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaGravarHistorico(rl),
                      ));
                },
                child: Icon(Icons.save),
                backgroundColor: Colors.green,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          Container(height: 40.0),
          SizedBox(
            width: 300.0,
            height: 40.0,
            child: ElevatedButton(
                child: Text("Ver Histórico",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {
                  gravar_cronometro();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaHistorico()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green)),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
