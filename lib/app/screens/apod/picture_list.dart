import 'package:beauty_of_space/app/controllers/picture_list_controller.dart';
import 'package:beauty_of_space/app/screens/apod/pictures_detail.dart';
import 'package:beauty_of_space/app/widgets/picture_item.dart';
import 'package:beauty_of_space/domain/models/apod/picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PictureList extends StatelessWidget {
  const PictureList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PictureListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picture of the day"),
        actions: [
          IconButton(
            onPressed: () {
              _openDialog();
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16.0,
                );
              },
              itemBuilder: (context, index) {
                final Picture pic = controller.pictures[index];

                return PictureItem(
                  pic,
                  onTap: () {
                    Get.to(
                      () => PicturesDetail(pic: pic),
                    );
                  },
                );
              },
              itemCount: controller.pictures.length,
            ),
          );
        },
      ),
    );
  }

  void _openDialog() {
    PickerDateRange range = PickerDateRange(
      DateTime.now(),
      DateTime.now().subtract(
        const Duration(
          days: 30,
        ),
      ),
    );
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width / 2,
              height: Get.height * 0.5,
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                maxDate: DateTime.now(),
                initialSelectedRange: PictureListController.to.dateRange,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  range = args.value as PickerDateRange;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (range.startDate == null || range.endDate == null) {
                  return;
                }
                PictureListController.to
                    .getPicsFromRange(range.startDate!, range.endDate!);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
