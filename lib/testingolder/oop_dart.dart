const int age_def = 25;
const String name_def = "userNameDef";
const String surname_def = "userSurnameDef";
setRoleQuickWay(String? role) => role ?? "Student";

enum Direction{left, right, backward, forward}

mixin MoveableMixin{
  late Direction _direction;
  void chooseDirection(Direction direction){
    _direction = direction;
  }
  
  Direction get direction => _direction;
}

class Car with MoveableMixin{

  void ride(int i){
    print("Ride $i mile to the $_direction");
  }

}
class Human with MoveableMixin{
  int? age;
  String? name;
  String? surname;
  
  Human.nullable();

  Human(this.age, this.name, this.surname);

  Human.paramsConst(String name, String surname): this(age_def, name, surname);

  Human.defaultValue(): this(age_def, name_def, surname_def);
  
  void go(int i){
      print("Step: $i to the $_direction");
  }
  
  @override
  String toString() => "Hi! I am $name $surname. I am $age!";
  
  String get fullName => "${this.name} ${this.surname}";
  
  set fullName(String fullName) {
    var strs = fullName.split(" ");
    this.name = strs[0];
    this.surname = strs[1];
  }
  
}

class Role extends Human{
  String? role;

  Role.nullable() : super.nullable();
  
  Role(int age, String name, String surname, String role):
     this.role = role, super(age, name, surname);
  
  factory Role.student(int age, String name, String surname){
        return Student(age, name, surname);
  }
  @override
  String toString() {
    return """\n\n
Role: $role
${super.toString()}
""";
  }

}

class Student extends Role{
  Student(int age, String name, String surname): super(age, name, surname, "Student");
}



main(List<String> args) {
  var person = Human.nullable();
  print(person);
  person.fullName = "Name Surname";
  print(person);
  person.age = 19;
  print(person);


  var person1 = Human(20, "Anna", "Sherepa");

  print(person1);
  print("Age: ${person1.age}");
  
  var person2 = Human.defaultValue();
  print(person2);

  var roleHuman = Role.nullable();
  roleHuman.role = setRoleQuickWay(roleHuman.role);
  print(roleHuman);

  Student student = Student(16, "Ali", "Aby");
  print(student);

  Car()..chooseDirection(Direction.forward)..ride(150);
  Human.defaultValue()..chooseDirection(Direction.backward)..go(100);
}