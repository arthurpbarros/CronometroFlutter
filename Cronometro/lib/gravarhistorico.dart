import 'models.dart';
import 'package:flutter/material.dart';
import 'historico.dart';

class TelaGravarHistorico extends StatefulWidget {
  String nome = "";
  String tempo = "";
  TelaGravarHistorico(Relogio rl) {
    this.tempo = rl.horario_atual();
  }

  State<StatefulWidget> createState() {
    return EstadoHistorico();
  }
}

class EstadoHistorico extends State<TelaGravarHistorico> {
  @override
  Widget build(BuildContext bc) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: Text("Cronômetro > Gravar tempo"),
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.of(bc).pop();
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 50,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  onChanged: (texto) => widget.nome = texto,
                  decoration: InputDecoration(
                      labelText: "NOME DO CRONÔMETRO",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Color(0xFF121212))),
              Container(
                height: 20,
              ),
              Text(
                widget.tempo,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.green,
                ),
              ),
              Container(
                height: 100,
              ),
              FloatingActionButton(
                heroTag: "save",
                onPressed: () {
                  historicos.add(Historico(widget.tempo, widget.nome));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaHistorico()),
                  );
                },
                child: Icon(Icons.save),
                backgroundColor: Colors.green,
              )
            ],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
