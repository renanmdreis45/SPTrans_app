import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/domain/models/bus_line.dart';
import 'package:flutter_application_2/domain/usecase/get_bus_lines.dart';

part 'bus_line_event.dart';
part 'bus_line_state.dart';

class BusLineBloc extends Bloc<BusLineEvent, BusLineState> {
  BusLineBloc({
    GetBusLines? getBusLines,
    BusLineModel? initialBusLine,
  })  : _getBusLines = getBusLines,
        super(
          BusLineState(
            initialBusLine: initialBusLine,
            query: '',
          ),
        ) {
    on<GetBusLine>(_onQueryChanged);
  }

  final GetBusLines? _getBusLines;

  void _onQueryChanged(
    GetBusLine event,
    Emitter<BusLineState> emit,
  ) async {
    emit(state.copyWith(query: event.query));

    try {
      final dataState = await _getBusLines!.call(event.query);
      emit(state.copyWith(busLines: dataState.data));
    } catch (e) {
      emit(state.copyWith(status: BusLineStatus.failure));
    }
  }
}
