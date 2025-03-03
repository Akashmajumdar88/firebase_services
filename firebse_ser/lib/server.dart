// import 'dart:convert';
// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
// import 'package:shelf/shelf.dart';
//
//
// final users = <String, String>{};
//
// const jwtSecret = 'super_secret_key';
//
// class sdas {
//   Future<Response> _signupHandler(Request request)async{
//     final payload = jsonDecode(await request.readAsString());
//     final email = payload['email'];
//     final password = payload['password'];
//     if(email == null || password == null){
//       return Response(body : jsonEncode({'error' : "Missing email or password"}), 400);
//     }
//     if(users.containsKey(email)){
//       return Response(409,body: jsonEncode({'error' : 'Invalid email or password'}));
//     }
//     users[email] = password;
//     return Response(201,body: jsonEncode({'message' : 'User registered successful'}));
//   }
//
//   Future<Response> _loginHandler(Request request)async {
//     final payload = jsonDecode(await request.readAsString());
//     final email = payload['email'];
//     final password = payload['password'];
//     if(email == null || password == null){
//       return Response(400,body: jsonEncode({'error' : 'Missing email or password'}));
//     }
//     if(users[email] != password){
//       return Response(401,body: jsonEncode({'error' : 'Invalid email or password'}));
//     }
//     final jwt = JWT({'email' : email});
//     final token = jwt.sign(SecretKey(jwtSecret));
//     return Response(200,body: jsonEncode({'token' : token}));
//   }
// }
//
