import 'package:flutter_application_2/core/resources/data_state.dart';
import 'package:flutter_application_2/domain/models/bus_line.dart';
import 'package:flutter_application_2/domain/models/position.dart';

abstract class BusRepository {
  Future<DataState<PositionModel>> getPosition();
  Future<DataState<List<BusLineModel>>> getBusLine(String query);
}
