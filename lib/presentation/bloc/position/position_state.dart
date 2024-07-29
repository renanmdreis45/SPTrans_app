import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/domain/models/position.dart';

abstract class PositionState extends Equatable {
  final PositionModel? position;
  final DioException? error;

  const PositionState({this.position, this.error});

  @override
  List<Object> get props => [position!];
}

class PositionLoading extends PositionState {
  const PositionLoading();
}

class PositionDone extends PositionState {
  const PositionDone(PositionModel position) : super(position: position);
}

class PositionError extends PositionState {
  const PositionError(DioException error) : super(error: error);
}