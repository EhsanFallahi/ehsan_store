import 'package:ehsan_store/data_source/model/favorites/Favorites.dart';
import 'package:ehsan_store/data_source/repository/favorites/FavoritesRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController{
  FavoritesRepository _favoritesRepository = FavoritesRepository();

  List<dynamic> _allFavorites = [].obs;
  var tempListFavorites =List<Favorites>().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllFavorites();
    super.onInit();
  }

  void getAllFavorites(){
    print('getAllFavorites():');
    try {
      print('getAllFavorites():try');
      isLoading(true);
      _favoritesRepository.getAllFavorites().then((response) {
        isLoading(false);
        _allFavorites.addAll(response.data);
        initialTempListAllFavorites();
        print('getAllFavorites():');
        print('onInit products is$tempListFavorites');
      });
    } catch (error) {
      isLoading(false);
      print('network error:$error');
    }
  }

  void addFavorites(Favorites favorites) async {
    print('on product deatil favorites is:$favorites.');
    try {
      isLoading(true);
      await _favoritesRepository.addFavorites(favorites);
      isLoading(false);
      print('favorites added is:${favorites.toString()}');
      showSnackBar();
    }catch(error){
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void showSnackBar()=>Get.snackbar('Favorites', 'Added to your favorites',
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(8),
      colorText: Theme.of(Get.context).accentColor,
      backgroundColor: Colors.black87.withOpacity(0.8));

  void initialTempListAllFavorites() {
    for (var favorites in _allFavorites) {
      Favorites _tempFavorites = Favorites();
      _tempFavorites.fromJson(favorites);
      tempListFavorites.add(_tempFavorites);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}