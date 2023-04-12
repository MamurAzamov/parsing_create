import 'package:flutter/material.dart';

import '../model/create_emp.dart';
import '../model/emp_model.dart';
import '../model/user_model.dart';
import '../server/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id='home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> item=[Employee(id: 1, employee_name: 'test', employee_salary: 123, employee_age: 19, profile_image: '')];

  void _apiCreatePost(User user){
    Network.POST(Network.API_CREATE, Network.paramsCreate(user)).then((value) => print(value),);
  }

  void showresponse(String response){
    EmpCreate empCreate=Network.parseEmpCreate(response);
    setState((){
      item=empCreate.data as List<Employee>;
    });
  }

  @override
  void initState() {
    super.initState();
    var user=User(age: 19, id: 1, salary: '123', name: 'test',);
    _apiCreatePost(user);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (ctx, i) {
            return _itemWidget(item[i]);
          }),
    );
  }

  Widget _itemWidget(Employee emp){
    return Container(
      padding:const EdgeInsets.all(20),
      margin:const EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${emp.employee_name}  (${emp.employee_age})",
            style: TextStyle(color: Colors.black, fontSize: 18),),
          const SizedBox(height: 10,),
          Text("${emp.employee_salary} \$",
            style: TextStyle(color: Colors.black, fontSize: 18),),
        ],
      ),
    );
  }
}