import 'package:beauty_of_space/domain/exceptions/server_exception.dart';
import 'package:beauty_of_space/domain/models/apod/picture.dart';
import 'package:beauty_of_space/domain/repositories/base_apod_repository.dart';
import 'package:beauty_of_space/domain/services/nasa_service/nasa_service.dart';
import 'package:beauty_of_space/env/env.dart';
import 'package:dio/dio.dart';

class ApodRepository implements BaseApodRepository {
  final NasaService service;

  ApodRepository(this.service);

  @override
  Future<List<Picture>> getApod({
    required String startDate,
    required String endDate,
  }) async {
    try {
      return service.getApod(Env.key, startDate: startDate, endDate: endDate);
    } on DioError catch (_) {
      throw ServerException("An error occured while retrieving the pictures!");
    } catch (_) {
      throw ServerException("An unknown error occured");
    }
  }
}
