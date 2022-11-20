import 'dart:developer';

import 'package:serverpod/serverpod.dart';

import '../generated/user_class.dart';

class UsersEndpoint extends Endpoint {
  Future<List<User>> getAll(Session session) async {
    try {
      return await User.find(session);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> insert(Session session, String username) async {
    try {
      await User.insert(session, User(username: username));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> update(Session session, User userModel) async {
    try {
      await User.update(session, userModel);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> delete(Session session, int userId) async {
    try {
      await User.delete(
        session,
        where: (t) => t.id.equals(userId),
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

// SELECT * FROM users;
// users.Find();