import 'package:get_storage/get_storage.dart';

class LocalStorage{
  var getStorage = GetStorage();

  void saveProfile(String profile){
    getStorage.write('profile', profile);
  }

  String  getAProfile(){
    return getStorage.read('profile') ?? '';
  }

  void clearDatabase(){
    getStorage.erase();
  }

}