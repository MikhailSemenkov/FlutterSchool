import 'package:lesson2/mixin_color.dart';
import 'package:lesson2/pet.dart';

class Snake extends Pet with PetColor {
  Snake(String name, int age, Color color) : super('Snake', 0, name, age) {
    this.color = color;
  }

  @override
  String toString() => '${super.toString()}, Color: $color';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Snake && color == other.color;

  @override
  int get hashCode => super.hashCode ^ color.hashCode;
}
