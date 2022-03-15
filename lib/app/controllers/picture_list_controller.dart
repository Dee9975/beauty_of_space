import 'package:beauty_of_space/domain/exceptions/server_exception.dart';
import 'package:beauty_of_space/domain/models/apod/picture.dart';
import 'package:beauty_of_space/data/repositories/apod_repository.dart';
import 'package:beauty_of_space/domain/services/nasa_service/nasa_service.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PictureListController extends GetxController {
  static PictureListController get to => Get.find();

  late ApodRepository _repo;

  final _pictures = <Picture>[].obs;
  List<Picture> get pictures => _pictures.value;

  final _dateRange = PickerDateRange(
    DateTime.now().subtract(const Duration(days: 30)),
    DateTime.now(),
  ).obs;
  PickerDateRange get dateRange => _dateRange.value;
  set dateRange(PickerDateRange val) => _dateRange.value = val;

  final _loading = false.obs;
  bool get loading => _loading.value;

  @override
  Future<void> onInit() async {
    _repo = ApodRepository(
      NasaService(
        Dio(),
      ),
    );
    await getPictures();
    super.onInit();
  }

  Future<void> getPictures() async {
    try {
      _loading.value = true;
      _pictures.value = await _repo.getApod(
        startDate: formatDate(
          _dateRange.value.startDate!,
          [yyyy, "-", mm, "-", dd],
        ),
        endDate: formatDate(
          _dateRange.value.endDate!,
          [yyyy, "-", mm, "-", dd],
        ),
      );
    } on ServerException catch (e) {
      Get.snackbar("Error!", e.message);
    } finally {
      _loading.value = false;
    }
  }

  Future<void> getPicsFromRange(DateTime startDate, DateTime endDate) async {
    _dateRange.value = PickerDateRange(startDate, endDate);
    Get.back();
    try {
      _loading.value = true;
      final s = formatDate(
        startDate,
        [yyyy, "-", mm, "-", dd],
      );

      final e = formatDate(
        endDate,
        [yyyy, "-", mm, "-", dd],
      );
      _pictures.value = await _repo.getApod(startDate: s, endDate: e);
    } on ServerException catch (e) {
      Get.snackbar("Error!", e.message);
    } finally {
      _loading.value = false;
    }
  }
}
