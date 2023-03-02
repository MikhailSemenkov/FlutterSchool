enum Color { dark, light, brown, gray, green, red, yellow }

mixin PetColor {
  late Color _color;

  Color get color => _color;

  set color(Color color) => _color = color;
}
