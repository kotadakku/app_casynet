import '../../utlis/http_service.dart';
import '../model/datcho.dart';




class DatChoProvider {
  void fetchDatChoList({
    required int loaixe,
    Function()? beforeSend,
    required Function(List<DatCho> datcho) onSuccess,
    Function(dynamic error)? onError
  }) {
    ApiRequest(
        url: 'https://casynet-api.herokuapp.com/api?isCar=$loaixe',
        data: null).get(
        beforeSend: () => {if(beforeSend != null) beforeSend()},
        onSuccess: (data) {
          onSuccess((data["reservations"] as List).map((postJson){
            return DatCho.fromJson(postJson);
          }
              ).toList());

        },
        onError: (error) => {if(onError != null) onError(error)}
    );
  }

}