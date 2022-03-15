import 'package:beauty_of_space/app/screens/apod/picture_list.dart';
import 'package:get/get.dart';

final routes = <GetPage>[
  GetPage(
    name: "/",
    page: () => const PictureList(),
  ),
];
