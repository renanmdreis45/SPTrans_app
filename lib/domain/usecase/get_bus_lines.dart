import 'package:flutter_application_2/core/resources/data_state.dart';
import 'package:flutter_application_2/domain/models/bus_line.dart';
import 'package:flutter_application_2/domain/repository/bus_repository.dart';

class GetBusLines {
  GetBusLines({required BusRepository repository}) : _repository = repository;

  final BusRepository _repository;

  Future<DataState<List<BusLineModel>>> call(String _query) async {
    final bus_line = await _repository.getBusLine(_query);

    return bus_line;
  }
}