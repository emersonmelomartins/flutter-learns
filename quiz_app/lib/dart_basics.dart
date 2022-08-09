// you can test dart on https://dartpad.dev/

class Person {
  String? name;
  int? age;
  String? lastname;
  double? height;

  Person({required this.name, required this.age, this.lastname, this.height});

  Person.empty() {
    name = "Max";
    age = 20;
  }

  Person.namedArgs(String inputName, int inputAge, String inputLastname,
      double inputHeight) {
    name = inputName;
    age = inputAge;
    lastname = inputLastname;
    height = inputHeight;
  }

  void greet() {
    // 'this' word is not required to print own attribute
    print('Hi, i am $name and i have $age years old.');
  }
}

String addNumbers(double num1, double num2) {
  return (num1 + num2).toStringAsFixed(2);
}

// the main function to flutter works 'main()'
void main() {
  int number = 1;
  double decimal1 = 1.1;
  double decimal2 = 3.21;
  bool isTrue = false;
  String text = "Hello, World!";
  var result = addNumbers(decimal1, decimal2);

  print(number);
  print("$decimal1 $decimal2");
  print("The result is: ${isTrue ? 'TRUTHY' : 'FALSY'}");
  print(text);
  print(result);

  // this is a commentary

  /*
   * this also is a commentary too
   * 
   */

  // 'new' word is not required on dart to create instance
  Person max = Person.empty();
  print(max.name);
  max.greet();

  Person p2 =
      Person(name: "Emerson", age: 26, height: 1.70, lastname: "Melo Martins");
  p2.greet();
}
