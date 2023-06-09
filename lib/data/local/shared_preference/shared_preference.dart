import 'package:shared_preferences/shared_preferences.dart';

//CacheHelper That's Connect and Talk to local database.
class CacheHelper
{
  static late SharedPreferences sharedPreferences;


  //Here The Initialize of cache.
  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  // this fun to put data in local data base using key
  static Future<bool> put({required String key, required dynamic value,}) async {

      return await sharedPreferences.setString(key, value);

  }

  // this fun to get data already saved in local data base
  static dynamic get({required String key})
  {
    return sharedPreferences.get(key);
  }

  // remove data using specific key
  static Future<bool> removeData({required key}) async
  {
    return await sharedPreferences.remove(key);
  }

//clear all data in the local data base
  static Future<bool> clearData() async
  {
    return await sharedPreferences.clear();
  }
}