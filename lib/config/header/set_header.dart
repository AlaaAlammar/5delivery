import 'package:shared_preferences/shared_preferences.dart';

import '../storage/storage.dart';

setHeaders({bool useToken = false}) {
  if (useToken) {
    return {
      'content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${storage.get<SharedPreferences>().getString("token")}'
    };
  } else {
    return {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
  }
}
