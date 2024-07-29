part of 'bus_service.dart';

class _BusService implements BusService {
  _BusService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://aiko-olhovivo-proxy.aikodigital.io';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<PositionModel>> getPosition() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '${baseUrl}/Posicao',
        queryParameters: queryParameters,
        options:
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra),
        data: _data);

    final value = PositionModel.fromJson(_result.data as Map<String, dynamic>);

    final httpResponse = HttpResponse(value, _result);

    return httpResponse;
  }

  @override
  Future<HttpResponse<List<BusLineModel>>> getBusLine(String query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'termosBusca': query};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '${baseUrl}/Linha/Buscar',
        queryParameters: queryParameters,
        options:
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra),
        data: _data);
    print(_result.data);

    List<BusLineModel> value = _result.data![''].map((dynamic i) {
      return BusLineModel.fromJson(i as Map<String, dynamic>);
    }).toList();

    final httpResponse = HttpResponse(value, _result);

    return httpResponse;
  }
}
