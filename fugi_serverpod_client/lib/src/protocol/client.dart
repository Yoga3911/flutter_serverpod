/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointExample extends EndpointRef {
  @override
  String get name => 'example';

  _EndpointExample(EndpointCaller caller) : super(caller);

  Future<String> hello(
    String name,
  ) async {
    var retval = await caller.callServerEndpoint('example', 'hello', 'String', {
      'name': name,
    });
    return retval;
  }
}

class _EndpointUsers extends EndpointRef {
  @override
  String get name => 'users';

  _EndpointUsers(EndpointCaller caller) : super(caller);

  Future<List<User>> getAll() async {
    var retval =
        await caller.callServerEndpoint('users', 'getAll', 'List<User>', {});
    return (retval as List).cast();
  }

  Future<void> insert(
    String username,
  ) async {
    var retval = await caller.callServerEndpoint('users', 'insert', 'void', {
      'username': username,
    });
    return retval;
  }

  Future<void> update(
    User userModel,
  ) async {
    var retval = await caller.callServerEndpoint('users', 'update', 'void', {
      'userModel': userModel,
    });
    return retval;
  }

  Future<void> delete(
    int userId,
  ) async {
    var retval = await caller.callServerEndpoint('users', 'delete', 'void', {
      'userId': userId,
    });
    return retval;
  }
}

class Client extends ServerpodClient {
  late final _EndpointExample example;
  late final _EndpointUsers users;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    example = _EndpointExample(this);
    users = _EndpointUsers(this);
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'example': example,
        'users': users,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}
