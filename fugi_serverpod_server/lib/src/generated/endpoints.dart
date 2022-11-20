/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import
// ignore_for_file: unused_import

import 'dart:typed_data' as typed_data;
import 'package:serverpod/serverpod.dart';

import 'protocol.dart';

import '../endpoints/example_endpoint.dart';
import '../endpoints/users_endpoint.dart';

class Endpoints extends EndpointDispatch {
  @override
  void initializeEndpoints(Server server) {
    var endpoints = <String, Endpoint>{
      'example': ExampleEndpoint()..initialize(server, 'example', null),
      'users': UsersEndpoint()..initialize(server, 'users', null),
    };

    connectors['example'] = EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': MethodConnector(
          name: 'hello',
          params: {
            'name': ParameterDescription(
                name: 'name', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).hello(
              session,
              params['name'],
            );
          },
        ),
      },
    );

    connectors['users'] = EndpointConnector(
      name: 'users',
      endpoint: endpoints['users']!,
      methodConnectors: {
        'getAll': MethodConnector(
          name: 'getAll',
          params: {},
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['users'] as UsersEndpoint).getAll(
              session,
            );
          },
        ),
        'insert': MethodConnector(
          name: 'insert',
          params: {
            'username': ParameterDescription(
                name: 'username', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['users'] as UsersEndpoint).insert(
              session,
              params['username'],
            );
          },
        ),
        'update': MethodConnector(
          name: 'update',
          params: {
            'userModel': ParameterDescription(
                name: 'userModel', type: User, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['users'] as UsersEndpoint).update(
              session,
              params['userModel'],
            );
          },
        ),
        'delete': MethodConnector(
          name: 'delete',
          params: {
            'userId': ParameterDescription(
                name: 'userId', type: int, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['users'] as UsersEndpoint).delete(
              session,
              params['userId'],
            );
          },
        ),
      },
    );
  }

  @override
  void registerModules(Serverpod pod) {}
}
