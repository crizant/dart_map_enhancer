# map_enhancer

A plugin which extends Dart's native `Map` type with a couple of handy methods.

## Getting Started

Import the plugin by:

```dart
import 'package:map_enhancer/map_enhancer.dart`;
```

## Usage

Let's start with a simple `Map`:

```dart
final Map peter = {
  'name': {
    'firstName': 'Peter',
    'lastName': 'Petrelli',
  },
  'age': 29,
};
```

### Get a nested value:

```dart
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
```

### Set a nested value:

```dart
peter.set(['ability'], 'Empathic mimicry');
print(peter['ability']);
// Output: Empathic mimicry
```

### Remove a nested key:

```dart
peter.unset(['name', 'lastName']);
print(peter['name']['lastName']);
// Output: null
```
