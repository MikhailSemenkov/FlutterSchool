import 'package:lesson2/mixin_color.dart';
import 'package:lesson2/pet.dart';
import 'package:lesson2/snake.dart';

void main(List<String> arguments) {
  var listOfPets = [];
  var cat = Pet('Cat', 4, 'Cat', 5);
  listOfPets.add(cat);
  var snake = Snake('Snake', 3, Color.yellow);
  assert(snake is PetColor);
  snake
    ..age = 5
    ..color = Color.red;
  listOfPets.add(snake);
  Pet dog = Pet.dog('Dog', 9);
  listOfPets.add(dog);
  Pet alien = Pet.unusualAnimal(5, 'Ziggy');
  listOfPets.add(alien);
  Pet foundCat = Pet.foundPet(4, 'Cat', 5, 'Cat');
  assert(identical(foundCat, cat));
  listOfPets.add(foundCat);
  Pet cat2 = Pet('Cat', 4, 'Cat', 5);
  listOfPets.add(cat2);
  assert(listOfPets.length == 6);

  Pet dog2 = Pet.dog('Dog 2', 5);
  Pet dog3 = Pet.dog('Dog 3', 1);
  var setOfPets = <Pet>{dog2, ...listOfPets, dog3};
  assert(setOfPets.length == 6);

  var humanYearsOfDog = dog.makeHumanYearsOfPet(7);
  assert(humanYearsOfDog() == 63);

  listOfPets.forEach((element) => print(element));
  print('');
  setOfPets.forEach((element) => print(element));
  print('');
  setOfPets
      .where((element) => element.kindOfAnimal == 'Dog')
      .forEach((element) => print(element));
}
