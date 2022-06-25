import 'models.dart';
import 'cronometro.dart';
import 'package:flutter/material.dart';

class TelaHistorico extends StatefulWidget {
  String nome = "";
  String tempo = "";

  State<StatefulWidget> createState() {
    return EstadoHistorico();
  }
}

class EstadoHistorico extends State<TelaHistorico> {
  final List<String> nomes = [];
  final List<String> tempos = [];
  final List<String> datas = [];

  @override
  void initState() {
    super.initState();
    int i = 0;
    for (Historico c in historicos) {
      String dia, mes, ano;

      dia = DateTime.now().day < 10
          ? "0" + DateTime.now().day.toString()
          : DateTime.now().day.toString();

      mes = DateTime.now().month < 10
          ? "0" + DateTime.now().month.toString()
          : DateTime.now().month.toString();

      ano = DateTime.now().year < 10
          ? "0" + DateTime.now().year.toString()
          : DateTime.now().year.toString();

      nomes.add(c.nome);
      tempos.add(c.tempo);
      datas.add(dia + "/" + mes + "/" + ano);
      i++;
    }
  }

  @override
  Widget build(BuildContext bc) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF121212),
        appBar: AppBar(
          title: Row(children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCronometro()),
                );
              },
              icon: Icon(Icons.home),
            ),
            Text("Historico"),
          ]),
          backgroundColor: Colors.green,
          leading: IconButton(
            onPressed: () {
              Navigator.of(bc).pop();
            },
            icon: Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: Container(
          child: ListView.builder(
              // the number of items in the list
              itemCount: historicos.length,

              // display each item of the product list
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  // In many cases, the key isn't mandatory
                  key: UniqueKey(),
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(nomes[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(datas[index],
                              style: TextStyle(
                                  color: Color(0xFF444444), fontSize: 18)),
                          Text(tempos[index],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 70, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                );
              }),
        ),
      ),
    );
  }
}
