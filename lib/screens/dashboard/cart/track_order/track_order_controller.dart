import 'package:get/get.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:yamu/screens/dashboard/orders/track_order_model.dart';

class TrackOrderController extends GetxController {

  var showFailedOrder = false.obs;
  var orderStatus = Status.order;

  List<TextDto> orderList = [];

  List<TextDto> shippedList = [];

  List<TextDto> outOfDeliveryList = [];

  List<TextDto> deliveredList = [];


  @override
  void onInit() {
    super.onInit();
    arrangeOrder(Get.arguments);
  }

  void arrangeOrder(List<Tracking> list) {
    for (var item in list) {
      if (item.orderStatus == "Pending" ||
          item.orderStatus == "Processing" ||
          item.orderStatus == "Canceled" ||
          item.orderStatus == "Canceled Reversal" ||
          item.orderStatus == "Chargeback") {
        orderStatus = Status.order;
        orderList.add(TextDto('Your order has been ${item.orderStatus}',
            item.dateAdded.toString()));
      } else if (item.orderStatus == 'Shipped') {
        orderStatus = Status.shipped;
        shippedList.add(
          TextDto("Your order has been ${item.orderStatus}",
              item.dateAdded.toString()),
        );
      } else if (item.orderStatus == 'Processed') {
        orderStatus = Status.outOfDelivery;
        outOfDeliveryList.add(
          TextDto(
              "Your order is out for ${item.orderStatus}", "${item.dateAdded}"),
        );
      } else if (item.orderStatus == 'Complete') {
        orderStatus = Status.delivered;
        deliveredList.add(
          TextDto(
              "Your order has been ${item.orderStatus}", "${item.dateAdded}"),
        );
      } else {
        orderStatus = Status.order;
        showFailedOrder.value = true;
      }
    }
  }
}
