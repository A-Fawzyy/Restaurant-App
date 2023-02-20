import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/model/food_item_model.dart';

class UserFavouritesModel {
  UserFavouritesModel({
    this.userId,
    this.foodItemList,
  });

  final String? userId;
  final List<FoodItemModel>? foodItemList;

  factory UserFavouritesModel.fromSnapshot(
    DocumentSnapshot snapshot,
  ) {
    return UserFavouritesModel(
      userId: snapshot.id,
      foodItemList: snapshot.get('food_item_list') == null
          ? []
          : List<FoodItemModel>.from(
              snapshot.get('food_item_list').map(
                    (json) => FoodItemModel.fromJson(json),
                  ),
            ),
    );
  }
}
