// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NasaService implements NasaService {
  _NasaService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.nasa.gov/planetary';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Picture>> getApod(key,
      {required startDate, required endDate}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': key,
      r'start_date': startDate,
      r'end_date': endDate
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Picture>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/apod',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Picture.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
