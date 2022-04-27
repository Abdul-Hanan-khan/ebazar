import 'package:ebazar/controller/services/http_services.dart';
import 'package:ebazar/model/product_details_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  RxBool ?isLoading=false.obs;
  Rx<ProductDetailModel> prodDetails=ProductDetailModel().obs;
  RxInt selectedSizeId=01111.obs;
  RxInt selectedChoiceId=01111.obs;
  RxString selectedSection="Product".obs;


  getProductDetails(String productId) async {
    isLoading!.value=true;
    prodDetails.value= (await HttpServices.getProductDetails(productId))!;
    print(prodDetails);
    isLoading!.value=false;
  }
}