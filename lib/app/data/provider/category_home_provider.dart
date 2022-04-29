import 'package:app_casynet/app/utlis/http_service.dart';

import '../model/category_home.dart';

class CategoryHomeProvider {
  void fetchCategoryHomeList(
      {/*required int categoryType,*/
      Function()? beforeSend,
      required Function(List<CategoryHome> category) onSuccess,
      Function(dynamic error)? onError}) {
    ApiRequest(
        url: "https://client.casynet.com/rest/V1/categories/list",
        data: {
          'searchCriteria[filterGroups][0][filters][0][field]': 'level',
          'searchCriteria[filterGroups][0][filters][0][value]': '3',
          'searchCriteriafilterGroups[filters][0][condition_type]': 'eq',
        }).get(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onSuccess: (data) {
          onSuccess((data["reservations"] as List).map((postJson) {
            return CategoryHome.fromJson(postJson);
          }).toList());
        },
        onError: (error) => {if (onError != null) onError(error)});
  }
}
