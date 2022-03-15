import 'package:beauty_of_space/data/repositories/apod_repository.dart';
import 'package:beauty_of_space/domain/models/apod/picture.dart';
import 'package:beauty_of_space/domain/services/nasa_service/nasa_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_test.mocks.dart';

@GenerateMocks([ApodRepository])
void main() {
  late MockApodRepository client;

  setUp(() async {
    client = MockApodRepository();
  });

  group("Test the api", () {
    test(
      "Get pictures successfully",
      () async {
        when(
          client.getApod(
            startDate: "",
            endDate: "",
          ),
        ).thenAnswer(
          (_) async => <Picture>[],
        );

        expect(
          await client.getApod(startDate: "", endDate: ""),
          isA<List<Picture>>(),
        );
      },
    );

    test("Test error getting thrown by the api", () {
      when(
        client.getApod(
          startDate: "",
          endDate: "",
        ),
      ).thenThrow(
        DioError(
          response: Response(
            data: {"status": 404, "message": "Error!"},
            statusCode: 404,
            requestOptions: RequestOptions(
              path: "",
            ),
          ),
          requestOptions: RequestOptions(path: ""),
        ),
      );

      expect(
        () async => await client.getApod(startDate: "", endDate: ""),
        throwsException,
      );
    });
  });
}
