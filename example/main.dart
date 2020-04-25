import 'package:map_enhancer/map_enhancer.dart';

void main() {
  final Map peter = {
    'name': {
      'firstName': 'Peter',
      'lastName': 'Petrelli',
    },
    'age': 29,
  };

  print(
    peter.get(['name', 'firstName']),
  );
  // Output: Peter

  // or if you prefer the json "dot notation":
  print(
    peter.get('name.firstName'.split('.')),
  );
  // Output: Peter

  // call with default value:
  print(
    peter.get(
      'name.nickName'.split('.'),
      defaultValue: 'Pete',
    ),
  );
  // Output: Pete

  peter.set(['ability'], 'Empathic mimicry');
  print(peter['ability']);
  // Output: Empathic mimicry

  peter.unset(['name', 'lastName']);
  print(peter['name']['lastName']);
  // Output: null
}
