part of 'bus_line_bloc.dart';

sealed class BusLineEvent extends Equatable {
  const BusLineEvent();

  @override
  List<Object> get props => [];
}

class GetBusLine extends BusLineEvent {
  const GetBusLine(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
