import 'package:flutter_application_2/core/resources/data_state.dart';
import 'package:flutter_application_2/domain/models/position.dart';
import 'package:flutter_application_2/domain/repository/bus_repository.dart';

class GetAllPositions {
  GetAllPositions({required BusRepository repository}) : _repository = repository;

  final BusRepository _repository;

  Future<DataState<PositionModel>> call() async {
    final positions = await _repository.getPosition();

    return positions;
  }
}