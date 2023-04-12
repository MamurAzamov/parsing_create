import 'dart:convert';

import 'package:http/http.dart';

import '../model/create_emp.dart';
import '../model/user_model.dart';

class Network{
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static String API_CREATE = "/api/v1/create";

  static Future<String?>POST(String api,Map<String,String> params)async{
    var uri=Uri.https(BASE, api);
    var response= await post(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200||response.statusCode==201){
      return response.body;
    }
    return null;
  }

  static Map<String,String>paramsCreate(User user){
    Map<String,String> params={};
    params.addAll({
      'name':user.name,
      'id':user.id.toString(),
      'salary':user.salary,
      'age':user.age.toString(),
    });
    return params;
  }

  static EmpCreate parseEmpCreate(String response){
    dynamic json=jsonDecode(response);
    var data=EmpCreate.fromJson(json);
    return data;
  }
}