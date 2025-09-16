import 'package:ecommerce/api/model/response/user_dto.dart';

import '../../domain/entities/response/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(name: name, email: email, role: role);
  }
}
