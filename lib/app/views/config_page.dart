import 'package:alvo_joystick/app/views/assets/constants_colors.dart';
import 'package:alvo_joystick/models/url_model.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  String url = '';
  bool result = true;
  final urlModel = UrlModel('');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Cores.azulEscuro,
          title: Text(
            'Configurações Gerais',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Configurações de conexão'),
              TextFormField(
                onChanged: (text) {
                  url = text;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  final check = UrlModel(url);
                  setState(() {
                    result = check.fetch(url) ?? 'http://192.168.0.200';
                  });
                  print(result);
                },
                child: Text('Testar conexão'),
              ),
              Container(
                child: Text('$result'),
              )
            ],
          ),
        ),
      );
}
