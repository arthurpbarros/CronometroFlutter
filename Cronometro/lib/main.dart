import 'package:flutter/material.dart';
import 'cronometro.dart';

void main() {
  runApp(Tela());
}

class Tela extends StatelessWidget {
  @override
  Widget build(BuildContext bc) {
    return MaterialApp(
      home: TelaCronometro(),
    );
  }
}
