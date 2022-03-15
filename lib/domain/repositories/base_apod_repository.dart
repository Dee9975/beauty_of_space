import 'package:beauty_of_space/domain/models/apod/picture.dart';

abstract class BaseApodRepository {
  Future<List<Picture>> getApod({
    required String startDate,
    required String endDate,
  });
}
