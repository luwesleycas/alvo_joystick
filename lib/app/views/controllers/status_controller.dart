import 'package:alvo_joystick/app/views/repositories/status_repository.dart';
import 'package:alvo_joystick/models/status_model.dart';
import 'package:flutter/material.dart';

class StatusController {
  List<StatusModel> status = [];
  final StatusRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);
  late Future<bool> scode;

  StatusController([StatusRepository? repository])
      : _repository = repository ?? StatusRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      status = await _repository.fetchStatus();
      state.value = HomeState.succes;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState { start, loading, succes, error }
