class EmployeeNew {
  late String name;
  late String salary;
  late String age;
  late int id;

  EmployeeNew({required this.age, required this.salary, required this.name, required this.id});

  EmployeeNew.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        salary = json['salary'],
        age = json['age'],
        id = json['id'];

  Map<String,dynamic> toJson()=>{
    'name':name,
    'salary':salary,
    'age':age,
    'id':id,
  };
}