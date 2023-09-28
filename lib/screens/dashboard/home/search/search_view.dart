import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/home/search/search_controller.dart' as sc;

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (sc.SearchController controller) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                color: ColorRes.colorPrimary,
                height: 120,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: ColorRes.colorWhite,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CommonUi.searchField(
                          true,
                          Strings.textSearchForProducts,
                          controller.searchController.value,
                          onValueChanged: (value) {
                        controller.searchProduct(value);
                      }),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.filter_list_rounded,
                      color: ColorRes.colorWhite,
                      size: 35,
                    )
                  ],
                )),
            controller.searchProductList.value.isEmpty
                ? Expanded(
                  child: Center(
                      child: Text(
                        Strings.textProductsNotFound,
                        style: CommonUi.setCustomTextStyle(
                            textFont: Fonts.fontBold, textSize: 20.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 2 / 3),
                        itemCount: controller.searchProductList.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.searchProductList[index];
                          return GestureDetector(
                           onTap: (){
                             Get.toNamed(Routes().productDetails,arguments: item.productId);
                           },
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: ColorRes.colorGrey2,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CommonUi.setNetworkImage(item.thumb,
                                          imageWidth: Get.width),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.name,
                                      maxLines: 2,
                                      style: CommonUi.setCustomTextStyle(
                                          textFont: Fonts.fontBold,
                                          textSize: 14.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
          ],
        ),
      );
    });
  }
}
