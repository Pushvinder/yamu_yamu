import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/home/search/search_controller.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}