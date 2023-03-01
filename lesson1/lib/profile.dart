class Profile {
  String _firstName;

  String _lastName;

  late int _age;

  String _location;

  Profile({firstName = 'Mikhail', lastName = 'Semenkov', age = 19, location})
      : _firstName = firstName,
        _lastName = lastName,
        _location = location ?? "" {
    this.age = age;
  }

  String get firstName => _firstName;

  set firstName(String value) => _firstName = value;

  String get lastName => _lastName;

  set lastName(String value) => _lastName = value;

  int get age => _age;

  set age(int value) {
    if (value >= 0) {
      _age = value;
    } else {
      throw "Age value should be nigger or equal than 0";
    }
  }

  String? get location => _location;

  set location(String? value) => _location = value ?? "";

  @override
  String toString() {
    return 'First name: $_firstName, Last name: $_lastName, '
        'Age: $_age, Location: $_location';
  }

  List<String> toList() {
    List<String> list = [];

    list.add('First name: $_firstName');
    list.add('Last name: $_lastName');
    list.add('Age: $_age');
    list.add('Location: $_location');

    return list;
  }
}

void main() {
  print(Profile());
  print(Profile(firstName: 'Jhon', lastName: 'Doe'));
  print(Profile(firstName: 'Matt', lastName: 'Murdock', age: 30));
  Profile profile = Profile(
      firstName: 'Jack', lastName: 'Braun', age: 56, location: 'London');
  print(profile);
  print(profile.location);
  profile.lastName = 'Smith';
  profile.age = 32;
  print(profile);

  List<String> profileList = profile.toList();
  for (var value in profileList) {
    print(value);
  }
}
