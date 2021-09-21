setRoleQuickWay(String? role) => role ?? "Student";

bubbleSort(List<int> list){
  for(int i = 0; i < list.length-1; i++){
    for(int j = 0; j < list.length-i-1; j++){
      if(list[j] > list[j+1]){
          var temp = list[j];
          list[j] = list[j+1];
          list[j+1] = temp;
      }
    }
  }
  return list;
}

void main(List<String> args) {
  var name = "Anna";
  var a;
  var b;
  var c;
  var role;

  a = 5;
  b ??= 4;
  c = 3;
  c??= 79;

  var list = [15, 3, 6, 7, 5, 20 , 4, 0, -2];

  print("Welcome to the world of Dart, $name");
  print("a: $a\t b: $b\t c: $c ");
  bubbleSort(list).forEach(print);
  list.add(10);

  var list2 = ["Num", for (var i in list) "$i"];

  print(list2);
  list2.forEach((element) {print(element is String); });
  role = setRoleQuickWay(role);

print("$name's role: $role");

  Map<int, String> map = const{1:"A", 2:"B", 3:"C"}; 
  map.putIfAbsent(4, () => "D");

  map.forEach((key, value) {print(
    "$key: $value");});
}