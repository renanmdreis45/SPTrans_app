import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/repository/bus_repository_impl.dart';
import 'package:flutter_application_2/data/service/bus_service.dart';
import 'package:flutter_application_2/domain/repository/bus_repository.dart';
import 'package:flutter_application_2/domain/usecase/get_all_positions.dart';
import 'package:flutter_application_2/domain/usecase/get_bus_lines.dart';
import 'package:flutter_application_2/presentation/bloc/bus_line/bus_line_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/position/position_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Bloc
  sl.registerFactory<PositionBloc>(() => PositionBloc(sl()));
  sl.registerFactory<BusLineBloc>(
      () => BusLineBloc(getBusLines: sl(), initialBusLine: sl()));

  //Use case
  sl.registerLazySingleton<GetAllPositions>(
      () => GetAllPositions(repository: sl()));
  sl.registerLazySingleton<GetBusLines>(() => GetBusLines(repository: sl()));

  //Repository
  sl.registerLazySingleton<BusRepository>(() => BusRepositoryImpl(sl()));

  //Service
  sl.registerLazySingleton<BusService>(() => BusService(sl()));

  //Dio
  sl.registerLazySingleton<Dio>(() => Dio());
}
