import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'assets/constants_colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Sobre o App'),
      backgroundColor: Cores.azulClaro,
    ),
    body: Column(
      children: [
        Center(
          child: Column(
            children: [
              ListTile(
                title: Text('Versão do app'),
                subtitle: Text(Version.update),
              ),
              ListTile(
                title: Text('Endereço IP do dispositivo'),
                subtitle: Text(AddresIp.ip),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
