
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data.dart';
import '../../data/model/address.dart';
import '../../data/provider/address_api_provider.dart';

class NewAddressController extends GetxController{
  var switch_default = true.obs;
  late var formStateKey;
  late Address address;

  RxList provinces = [].obs;
  RxList districts = [].obs;
  RxList communes = [].obs;

  RxString province = "".obs;
  RxString district = "".obs;
  RxString commune = "".obs;

  late TextEditingController textProvinceCotroller;

  late TextEditingController textDistrictController;
  late TextEditingController textCommuneController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    formStateKey = GlobalKey<FormState>();
    address = Address();
    textProvinceCotroller = TextEditingController();
    textDistrictController = TextEditingController();
    textCommuneController = TextEditingController();
    (data['province'] as List).forEach((e){
      provinces.add({ 'id': e['idProvince'],'name': e['name'].toString()});
    }

    );
  }

  void postAddress(){
    AddressProvider().createAddress(
      onSuccess: (data){
        print("Success ${data.toJson()}");
      },
      onError: (error){
        print(error);
      },
      data: address.toJson());
  }

  void updateDistrict(String idProvince){
    districts.clear();
    communes.clear();
    (data['district'] as List).forEach((e){
      if(e["idProvince"] == idProvince)
        districts.add({'id': e['idDistrict'],'name': e['name'].toString()});
    });
  }

  void updateCommune(String idDistrict ){
    communes.clear();

    (data['commune'] as List).forEach((e){
      if(e["idDistrict"] == idDistrict)
        communes.add({ 'id': e['idCommune'],'name': e['name'].toString()});
    });
  }
}