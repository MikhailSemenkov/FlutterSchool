/// Class container with information about person.
class Profile {
  /// First name of person.
  String _firstName;

  /// Last name of person.
  String _lastName;

  /// Age of person.
  int _age;

  /// Current location of person (can be not defined).
  String? _location;

  /// Universal constructor which can set all variables,
  /// some of them or none at all.
  Profile({firstName = 'Mikhail', lastName = 'Semenkov', age = 19, location})
      : _firstName = firstName,
        _lastName = lastName,
        _age = age,
        _location = location;

  /// Get [firstName] of person.
  ///
  /// Set [firstName] of person.
  String get firstName => _firstName;
  set firstName(String value) => _firstName = value;

  /// Get [lastName] of person.
  ///
  /// Set [lastName] of person.
  String get lastName => _lastName;
  set lastName(String value) => _lastName = value;

  /// Get [age] of person.
  ///
  /// Set [age] of person.
  /// [value] should be bigger or equal than 0
  int get age => _age;
  set age(int value) {
    if (value >= 0) {
      _age = value;
    } else {
      throw "Age value should be nigger or equal than 0";
    }
  }

  /// Get current [location] of person (can be null).
  ///
  /// Set current [location] of person.
  String? get location => _location;
  set location(String? value) => _location = value;

  /// Converts all information about person in string
  /// with next format:
  ///
  /// First name: [firstName], Last name: [lastName], Age: [age], Location: [location]
  @override
  String toString() {
    return 'First name: $_firstName, Last name: $_lastName, '
        'Age: $_age, Location: $_location';
  }

  /// Puts all information about person in list.
  /// List looks like:
  ///
  /// Element 0 = First name: [firstName]
  /// Element 1 = Last name: [lastName]
  /// Element 2 = Age: [age]
  /// Element 3 = Location: [location]
  List<String> toList() {
    List<String> list = [];

    list.add('First name: $_firstName');
    list.add('Last name: $_lastName');
    list.add('Age: $_age');
    list.add('Location: $_location');

    return list;
  }
}

/// Small demonstration some of [Profile] class methods.
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
