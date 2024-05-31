import 'package:hive_flutter/adapters.dart';
import 'package:medical_prescription/domain/entities/token.dart';
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

}