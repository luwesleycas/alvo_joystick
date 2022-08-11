import 'dart:ui';

import 'package:flutter/material.dart';

class Cores {
  static final azulEscuro = Color(0xFF12263f);
  static final azulClaro = Color(0xFF4176bc);
}

class StatusConect {
  static final conectado = Text(
    ' Conectado',
    style: TextStyle(
      color: Color(0xFF07801F),
      fontSize: 15,
    ),
  );
  static final desconectado = Text(
    ' Desconectado',
    style: TextStyle(
      color: Color.fromARGB(255, 221, 27, 27),
      fontSize: 15,
    ),
  );
  static final conectando = Text(
    ' Conectando...',
    style: TextStyle(
      color: Cores.azulClaro,
      fontSize: 15,
    ),
  );

}
