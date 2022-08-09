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
                  'Para conectar com o alvo, conecte na rede na rede "Alvo ShotHub"'),
              Icon(
                Icons.wifi_rounded,
                size: 50,
              ),
              Text('Alvo ShotHub'),
            ],
          ),
        ),
      );
}
