class Pet {
  late String _kindOfAnimal;
  late int _amountOfPaws;
  String _name;
  dynamic _age;
  static final Map<String, Pet> _cache = {};

  Pet(this._kindOfAnimal, this._amountOfPaws, this._name, this._age) {
    _cache['$_kindOfAnimal : $_name'] = this;
  }
  Pet.unusualAnimal(this._amountOfPaws, this._name,
      [int? age, String? kindOfAnimal])
      : _kindOfAnimal = kindOfAnimal ??= 'Unknown',
        _age = age ?? 'Unknown' {
    assert(_age != null);
    _cache['$_kindOfAnimal : $_name'] = this;
  }
  Pet.dog(this._name, int this._age) {
    _kindOfAnimal = 'Dog';
    _amountOfPaws = 4;
    _cache['$_kindOfAnimal : $_name'] = this;
  }

  factory Pet.foundPet(int amountOfPaws, String name,
      [int? age, String kindOfAnimal = 'Unknown']) {
    var key = '$kindOfAnimal : $name';
    return (_cache.containsKey(key)
        ? _cache[key]!
        : Pet(kindOfAnimal, amountOfPaws, name, age ?? 'Unknown'));
  }

  Function makeHumanYearsOfPet(num onePetYear) {
    return () => _age * onePetYear;
  }

  String get kindOfAnimal => _kindOfAnimal;
  set kindOfAnimal(String value) => _kindOfAnimal = value;

  int get amountOfPaws => _amountOfPaws;
  set amountOfPaws(int value) => _amountOfPaws = value;

  String get name => _name;
  set name(String value) => _name = value;

  dynamic get age => _age;
  set age(dynamic value) => _age = value;

  @override
  String toString() =>
      'Kind: $_kindOfAnimal, Amount of pows: $_amountOfPaws, Name: $_name, Age: $_age';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pet &&
          runtimeType == other.runtimeType &&
          _kindOfAnimal == other._kindOfAnimal &&
          _amountOfPaws == other._amountOfPaws &&
          _name == other._name &&
          _age == other._age;

  @override
  int get hashCode =>
      _kindOfAnimal.hashCode ^
      _amountOfPaws.hashCode ^
      _name.hashCode ^
      _age.hashCode;
}
