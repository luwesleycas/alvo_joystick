// ignore_for_file: prefer_const_constructors
import 'package:alvo_joystick/app/views/repositories/status_repository.dart';
import 'package:alvo_joystick/models/configuration-direction_model.dart';
import 'package:alvo_joystick/models/url_model.dart';
import 'package:flutter/material.dart';
import 'assets/constants_colors.dart';
import 'controllers/status_controller.dart';

class JoystickPage extends StatefulWidget {
  JoystickPage({Key? key}) : super(key: key);

  @override
  State<JoystickPage> createState() => _JoystickPageState();
}

class _JoystickPageState extends State<JoystickPage> {
  var arrowSize = 100.0;
  CommandDirection commandDirection = CommandDirection();
  final repository = StatusRepository();
  final controller = StatusController();
  String url = '';
  final urlModel = UrlModel('');

  succes() {
    return GestureDetector(
      onTap: () {
        controller.start();
      },
      child: StatusConect.conectado,
    );
  }

  error() {
    return GestureDetector(
      onTap: () {
        controller.start();
      },
      child: StatusConect.desconectado,
    );
  }

  loading() {
    return SizedBox(
      height: 20,
      width: 20,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircularProgressIndicator(
          backgroundColor: Cores.azulClaro,
        ),
      ),
    );
  }

  start() {
    return Container();
  }

  stateManegement(HomeState state) {
    switch (state) {
      case HomeState.loading:
        return loading();
      case HomeState.start:
        return start();
      case HomeState.succes:
        return succes();
      case HomeState.error:
        return error();
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Cores.azulEscuro,
          title: Text(
            'Alvo ShotHub',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Cores.azulEscuro),
                child: Text(
                  'Ajustes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     // Navigator.of(context).pushNamed('/config');
              //   },
              //   leading: Icon(Icons.settings),
              //   title: Text('Configurações'),
              // ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/help');
                },
                leading: Icon(Icons.help),
                title: Text('Ajuda'),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/about');
                },
                leading: Icon(Icons.info),
                title: Text('Sobre o App'),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                // ignore: sort_child_properties_last
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/app/views/assets/LOGO.png',
                      scale: 1 / 1.9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Status da conexão:'),
                        GestureDetector(
                          onTap: () {
                            start();
                          },
                          child: Container(
                            child: AnimatedBuilder(
                              animation: controller.state,
                              builder: (context, child) {
                                return stateManegement(controller.state.value);
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                height: 200,
                width: 500,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            //Girar para esquerda
                            child: GestureDetector(
                              onTap: () => urlModel.fetch('$url' '?LD=1&RU=1'),
                              child: Container(
                                child: Transform.rotate(
                                  angle: 150,
                                  child: Icon(
                                    Icons.arrow_circle_up,
                                    color: Colors.yellow,
                                    size: 80,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 74, 74, 74),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: arrowSize - 10,
                                height: arrowSize - 10,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              //Pra frente
                              onTap: () => urlModel.fetch('$url' '?LU=1&RU=1'),
                              child: Container(
                                width: arrowSize,
                                height: arrowSize,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 47, 47, 47),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.arrow_circle_up,
                                  color: Cores.azulClaro,
                                  size: 80,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            //Diagonal direita
                            child: GestureDetector(
                              onTap: () => urlModel.fetch('$url' '?LU=1&RD=1'),
                              child: Container(
                                child: Transform.rotate(
                                  angle: -150,
                                  child: Icon(
                                    Icons.arrow_circle_up,
                                    color: Colors.yellow,
                                    size: 80,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 74, 74, 74),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: arrowSize - 10,
                                height: arrowSize - 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            //Esquerda
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => urlModel.fetch('$url' '?LS=1&RU=1'),
                              child: Container(
                                child: Icon(
                                  Icons.arrow_circle_left_outlined,
                                  color: Cores.azulClaro,
                                  size: 80,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 47, 47, 47),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: arrowSize,
                                height: arrowSize,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            //Parar
                            child: GestureDetector(
                              onTap: () => urlModel.fetch('$url' '?LS=1&RS=1'),
                              child: Container(
                                child: Icon(
                                  Icons.stop_circle_outlined,
                                  color: Colors.red,
                                  size: 80,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 47, 47, 47),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: 90,
                                height: 90,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              //Direita
                              onTap: () => urlModel.fetch('$url' '?LU=1&RS=1'),
                              child: Container(
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Cores.azulClaro,
                                  size: 80,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 47, 47, 47),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: arrowSize,
                                height: arrowSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              //Esquivar
                              onTap: () => urlModel.fetch('$url' '?ES=1'),
                              child: Container(
                                // ignore: sort_child_properties_last
                                child: Transform.rotate(
                                  angle: 150,
                                  child: Icon(
                                    Icons.trending_up,
                                    color: Colors.green,
                                    size: 65,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 74, 74, 74),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: arrowSize - 10,
                                height: arrowSize - 10,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            //Para trás
                            child: GestureDetector(
                              onTap: () => urlModel.fetch('$url' '?LD=1&RD=1'),
                              child: Container(
                                child: Icon(
                                  Icons.arrow_circle_down,
                                  color: Cores.azulClaro,
                                  size: 80,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF2F2F2F),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: arrowSize,
                                height: arrowSize,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              //Aleatório
                              onTap: () {
                                final check = '';
                              },
                              child: Container(
                                // ignore: sort_child_properties_last
                                child: Center(
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 60),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF4A4A4A),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: arrowSize - 10,
                                height: arrowSize - 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Text('Versão Alpha 1.0.2')
            ],
          ),
        ),
      );
}
