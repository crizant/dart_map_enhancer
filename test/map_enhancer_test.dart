import 'package:flutter_test/flutter_test.dart';

import 'package:map_enhancer/map_enhancer.dart';

void main() {
  test('Map.get() method', () {
    final Map m = {
      'a': 1,
      'b': {
        'c': 2,
      },
    };
    expect(m.get('a'.split('.')), 1);
    expect(m.get('b.c'.split('.')), 2);
    expect(m.get('d'.split('.')), null);
    expect(m.get('d'.split('.'), defaultValue: 3), 3);
    expect(m.get('a.z'.split('.'), defaultValue: 4), 4);
  });

  test('Map.set() method', () {
    final Map m = {};
    m.set('a'.split('.'), 1);
    m.set('b.c'.split('.'), 2);
    expect(m['a'], 1);
    expect(m['b']['c'], 2);
    m.set('a.b'.split('.'), 3);
    expect(m['a']['b'], 3);
  });

  test('Map.unset() method', () {
    final Map m = {
      'a': 1,
      'b': {
        'c': 2,
      },
    };
    m.unset('a'.split('.'));
    expect(m.containsKey('a'), false);
    m.unset('b.c'.split('.'));
    expect((m['b'] as Map).containsKey('c'), false);
  });
}
