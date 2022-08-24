import 'package:alvo_joystick/app/views/repositories/status_repository.dart';
import 'package:alvo_joystick/models/status_model.dart';
import 'package:flutter/material.dart';

class StatusController {
  late var conect;
  late bool status;
  final StatusRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  StatusController([StatusRepository? repository])
      : _repository = repository ?? StatusRepository();

  Future start() async {
    conect = await _repository.fetchStatus();
    state.value = HomeState.loading;
    if (conect == 'conected') {
      state.value = HomeState.succes;
    } else {
      state.value = HomeState.error;
    }
  }

  Future startConect() async {
    state.value = HomeState.error;
    status = await _repository.isConected();
    print(status);
    if (status == true) {
      state.value = HomeState.succes;
    } else if (status == false) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, succes, error }
