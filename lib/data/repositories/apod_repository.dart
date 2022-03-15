import 'package:beauty_of_space/domain/models/apod/picture.dart';
import 'package:beauty_of_space/domain/repositories/base_apod_repository.dart';
import 'package:beauty_of_space/domain/services/nasa_service/nasa_service.dart';
import 'package:beauty_of_space/env/env.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';

class ApodRepository implements BaseApodRepository {
  final NasaService service;

  ApodRepository(this.service);

  @override
  Future<List<Picture>> getApod({
    String? startDate,
    String? endDate,
  }) async {
    try {
      return service.getApod(
        Env.key,
        startDate: startDate ??
            formatDate(
              DateTime.now().subtract(
                const Duration(days: 30),
              ),
              [yyyy, "-", mm, "-", dd],
            ),
        endDate: endDate ??
            formatDate(
              DateTime.now(),
              [yyyy, "-", mm, "-", dd],
            ),
      );
    } on DioError catch (e) {
      print(e.requestOptions.queryParameters);
      throw Exception();
    }
  }
}
