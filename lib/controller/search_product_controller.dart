import 'package:ebazar/controller/services/http_services.dart';
import 'package:ebazar/model/search_model.dart';
import 'package:get/get.dart';


class SearchProductController extends GetxController{
  // RxList<SearchProduct> searchedProducts = <SearchProduct>[].obs;
  Rx<SearchModel> ?searchedProducts = SearchModel().obs;
  RxList<ProductData> ? searchList=<ProductData>[].obs;


  loadSearchProduct(String searchString) async {
    searchedProducts!.value = (await HttpServices.searchProduct(page: "1",searchString: searchString,catId: "1",choiceId: "1",priceEndRange: "100000",priceStartingRange: "0",sizeId: "1"))!;
    print(searchedProducts);
    searchList!.value=searchedProducts!.value.data!.product!.data!;
    print(searchList);
  }

  clearSearches(){
    searchedProducts!.value=SearchModel();
  }

}