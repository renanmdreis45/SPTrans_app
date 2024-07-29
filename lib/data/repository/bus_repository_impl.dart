import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/resources/data_state.dart';
import 'package:flutter_application_2/data/service/bus_service.dart';
import 'package:flutter_application_2/domain/models/bus_line.dart';
import 'package:flutter_application_2/domain/models/position.dart';
import 'package:flutter_application_2/domain/repository/bus_repository.dart';


class BusRepositoryImpl implements BusRepository {
  final BusService _busService;

  BusRepositoryImpl(this._busService);

  @override
  Future<DataState<PositionModel>> getPosition() async {
    try {
      final httpResponse = await _busService.getPosition();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<DataState<List<BusLineModel>>> getBusLine(String query) async {
        try {
      final httpResponse = await _busService.getBusLine(query);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}