import 'package:flutter_application_2/core/resources/data_state.dart';
import 'package:flutter_application_2/domain/usecase/get_all_positions.dart';
import 'package:flutter_application_2/presentation/bloc/position/position_event.dart';
import 'package:flutter_application_2/presentation/bloc/position/position_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  final GetAllPositions _getAllPositions;

  PositionBloc(this._getAllPositions) : super(const PositionLoading()) {
    on<GetPosition>(onGetPosition);
  }

  void onGetPosition(GetPosition event, Emitter<PositionState> emit) async {
    final dataState = await _getAllPositions.call();

    if (dataState is DataSuccess && dataState.data!.toJson().isNotEmpty) {
      emit(PositionDone(dataState.data!));
    }

    if (dataState is DataError) {
      emit(PositionError(dataState.error!));
    }
  }
}