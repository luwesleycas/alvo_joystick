import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'assets/constants_colors.dart';

class Helppage extends StatefulWidget {
  const Helppage({Key? key}) : super(key: key);

  @override
  State<Helppage> createState() => _HelppageState();
}

class _HelppageState extends State<Helppage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Instruções'),
          backgroundColor: Cores.azulClaro,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                '1. Para se comunicar com o alvo, conecte-se na rede Wifi "Alvo ShotHub"',
              ),
              Icon(
                Icons.wifi_rounded,
                size: 50,
              ),
              Text('Alvo ShotHub'),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(
                  '2. Volte a tela de início e clique no ícone para atualizar o status de conexão',
                ),
              ),
            ],
          ),
        ),
      );
}
