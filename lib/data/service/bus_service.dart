import 'package:flutter_application_2/domain/models/bus_line.dart';
import 'package:flutter_application_2/domain/models/position.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/preferences/app_constants.dart';

part 'bus_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class BusService {
  factory BusService(Dio dio) = _BusService;

  @GET('/Posicao')
  Future<HttpResponse<PositionModel>> getPosition();

  @GET('/Linha/Buscar')
  Future<HttpResponse<List<BusLineModel>>> getBusLine(
    @Query("termosBusca") String query,
  );
}
