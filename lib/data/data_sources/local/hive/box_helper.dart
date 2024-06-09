import 'package:hive_flutter/adapters.dart';
import 'package:medical_prescription/domain/entities/cart/cart.dart';
import 'package:medical_prescription/domain/entities/token/token.dart';
import 'hives.dart';

class BoxHelper{
  static bool hasToken(){
    return Hive.box<TokenEntity>(Hives.boxToken).get(Hives.keyToken) != null;
  }

  static TokenEntity? getToken(){
    return Hive.box<TokenEntity>(Hives.boxToken).get(Hives.keyToken);
  }

  static void saveToken(TokenEntity token){
    Hive.box<TokenEntity>(Hives.boxToken).put(Hives.keyToken, token);
  }

  static void deleteToken(){
    Hive.box<TokenEntity>(Hives.boxToken).delete(Hives.keyToken);
  }

  static void saveCartItem(CartEntity cartEntity){
    Hive.box<CartEntity>(Hives.boxCart).put(cartEntity.id, cartEntity);
  }
  
  static CartEntity? getCartItem(CartEntity cartEntity){
    return Hive.box<CartEntity>(Hives.boxCart).get(cartEntity.id);
  }

  static List<CartEntity>? getCart(){
    return Hive.box<CartEntity>(Hives.boxCart).values.toList();
  }

  static void deleteCartItem(CartEntity cartEntity){
    Hive.box<CartEntity>(Hives.boxCart).delete(cartEntity.id);
  }

}