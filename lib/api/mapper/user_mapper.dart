import 'package:ecommerce/api/model/response/user_dto.dart';
import 'package:ecommerce/domain/entities/response/user.dart';

extension UserMapper on UserDto{
  User toUserDto(){
    return User(name: name, email: email);
  }
}