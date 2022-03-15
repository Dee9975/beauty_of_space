import 'package:beauty_of_space/domain/models/apod/picture.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'nasa_service.g.dart';

@RestApi(baseUrl: "https://api.nasa.gov/planetary")
abstract class NasaService {
  factory NasaService(Dio dio, {String baseUrl}) = _NasaService;

  @GET("/apod")
  Future<List<Picture>> getApod(
    @Query("api_key") String key, {
    @Query("start_date") required String startDate,
    @Query("end_date") required String endDate,
  });
}
