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
  peter.getIn(['name', 'firstName']),
);
// Output: Peter

// or if you prefer the JSON "dot notation":
print(
  peter.getIn('name.firstName'.split('.')),
);
// Output: Peter

// call with default value:
print(
  peter.getIn(
    'name.nickName'.split('.'),
    defaultValue: 'Pete',
  ),
);
// Output: Pete
```

### Set a nested value:

```dart
peter.setIn(['ability'], 'Empathic mimicry');
print(peter['ability']);
// Output: Empathic mimicry
```

### Remove a nested key:

```dart
peter.unsetIn(['name', 'lastName']);
print(peter['name']['lastName']);
// Output: null
```

### Check if a nested key is present:

```dart
print(peter.hasIn(['name', 'nickname']));
// Output: false
```
