import 'package:ebazar/controller/services/http_services.dart';
import 'package:ebazar/model/home_model.dart';
import 'package:get/get.dart';
class HomeController extends GetxController{
  RxBool isLoading=false.obs;
  HomeModel ? homeModel=HomeModel();
  RxInt? selectedCatId=000000.obs;
  RxList<SubCategory> ? subCategory=<SubCategory>[].obs;
  @override
  void onInit() {
    getHomeData();
    super.onInit();

  }

  getHomeData() async {
    isLoading.value=true;
    homeModel= await HttpServices.home();
    isLoading.value=false;
    print(homeModel);
  }
  getSubCategory(int ? categoryId){
    int index= homeModel!.data!.category!.indexWhere((element) => element.id == categoryId);
    subCategory!.value=homeModel!.data!.category![index].subCategory!;

  }
}