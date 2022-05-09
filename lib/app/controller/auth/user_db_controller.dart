import 'package:app_casynet/app/data/model/user.dart';
import 'package:app_casynet/app/data/provider/auth_provider.dart';
import 'package:app_casynet/app/data/provider/db/user_db_provider.dart';
import 'package:app_casynet/app/utlis/base64.dart';
import 'package:get/get.dart';

class UserDatabaseController extends GetxController{

  var listUser = [];

  var isLoading = false;

  @override
  void onInit() {
    _getUser();
  }

  void _getUser(){
    isLoading = true;
    listUser.clear();
    UserDatabaseHelperProvider.instance.queryAllRows().then((value) {
      if(value?.length == 0){
        print("Get api db: -- " +value.toString() + "--");
        UserDatabaseHelperProvider.instance.clear();
        AuthProvider().fetchCurrentUser(onSuccess: (users) async{
         for (var user in users){
           var base64 = await ImageNetworkToBase64(url: user.image).getHttp();
           UserDatabaseHelperProvider.instance.insert(User(image: base64));
           listUser.add(User(image: base64));

           update();
         }
         isLoading = false;
         update();
        },
        beforePost: (){},
        onError: (error){
          print("Error () :" + error.toString());
          isLoading = false;
          update();
        }
        );
      }
      else{
        value?.forEach((element) {
          listUser.add(User(
            id: element['id'],
            email: element['email'],
            password: element['password'],
            username: element['username'],
            firstname: element['firstname'],
            lastname: element['lastname'],
            phone: element['phone'],
            gender: element['gender'],
            storeId: element['storeId'],
            birthday: element['birthday'],
            image: element['image'],
            created_at: element['createAt'],
            receiveNotification: element['receiveNotification'],
            follow_seller: element['followSeller'],
          ));
          isLoading = false;
          update();
        }
        );
      }
    });





  }
}

