import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/screens/dashboard/orders/order_details/order_details_model.dart';
import 'package:yamu/screens/dashboard/orders/order_details/slip_view.dart';

class OrderDetailsController extends GetxController {
  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();
  var loader = true.obs;
  RxList<OrderItem> orders = <OrderItem>[].obs;
  var total = Total().obs;
  var id = ''.obs;
  var pointEarned = ''.obs;
  var billingAddress = ''.obs;
  var shippingAddress = ''.obs;
  var slipImage = ''.obs;
  var orderId = '';

  @override
  void onInit() {
    orderId = Get.arguments ?? '';
    getOrderDetails(orderId);
    super.onInit();
  }

  void getOrderDetails(String orderId) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes
        .getOrderDetails}$customerId&order_id=$orderId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        loader.value = false;
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          var data = orderDetailsModelFromJson(value);
          orders.value = data.orderDetail.orderItems;
          total.value = data.orderDetail.total;
          id.value = data.orderDetail.orderId;
          pointEarned.value = data.orderDetail.points;
          slipImage.value = data.orderDetail.paymentReceipt;
          if (data.orderDetail.shippingAddress.shippingAddress1.isNotEmpty) {
            shippingAddress.value =
                data.orderDetail.shippingAddress.shippingAddress1;
          }
          if (data.orderDetail.shippingAddress.shippingZone.isNotEmpty) {
            shippingAddress.value =
            '${shippingAddress.value}, ${data.orderDetail.shippingAddress
                .shippingZone}';
          }
          if (data.orderDetail.shippingAddress.shippingCity.isNotEmpty) {
            shippingAddress.value =
            '${shippingAddress.value}, ${data.orderDetail.shippingAddress
                .shippingCity}';
          }
          if (data.orderDetail.shippingAddress.shippingPostcode.isNotEmpty) {
            shippingAddress.value =
            '${shippingAddress.value}, ${data.orderDetail.shippingAddress
                .shippingPostcode}';
          }
          billingAddress.value = shippingAddress.value;
          orders.refresh();
          loader.value = false;
        } else {
          loader.value = false;
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      loader.value = false;
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }


  Future<void> selectImageFromGallery(String text) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    slipImage.value = image!.path;
    Get.to(SlipView(image.path));
  }

  Future<void> selectImageFromCamera(String text) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    slipImage.value = image!.path;
    Get.to(SlipView(image.path));
  }

  void uploadSlip(String imagePath) {
    var request = FormData(
        {'receipt': MultipartFile(File(imagePath), filename: imagePath
            .split('/')
            .last)});
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes
        .uploadReciept}$customerId&order_id=$orderId&api_key=222222';
    apiProvider.postApi(endPoint, request).then((value) {
      if (value == 'error') {
        loader.value = false;
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          Get.back();
          CommonUi.showNotificationToast('Alert', result['message'][0]['msg']);
          getOrderDetails(orderId);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }
}
