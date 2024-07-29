part of 'bus_line_bloc.dart';

enum BusLineStatus { initial, loading, success, failure }

extension BusLineStatusx on BusLineStatus {
  bool get isLoadingOrSuccess => [
        BusLineStatus.loading,
        BusLineStatus.success,
      ].contains(this);
}

final class BusLineState extends Equatable {
  const BusLineState({
    this.status = BusLineStatus.initial,
    this.initialBusLine,
    this.busLines,
    this.query = '',
  });

  final BusLineStatus status;
  final BusLineModel? initialBusLine;
  final String query;
  final List<BusLineModel>? busLines;

  bool get isNewBusLine => initialBusLine == null;

  BusLineState copyWith({
    BusLineStatus? status,
    BusLineModel? initialBusLine,
    String? query,
    List<BusLineModel>? busLines,
  }) {
    return BusLineState(
      status: status ?? this.status,
      initialBusLine: initialBusLine ?? this.initialBusLine,
      query: query ?? this.query,
      busLines: busLines ?? this.busLines,
    );
  }

  @override
  List<Object?> get props => [status, initialBusLine, busLines, query];
}
