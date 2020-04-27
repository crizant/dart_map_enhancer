import 'package:flutter_test/flutter_test.dart';

import 'package:map_enhancer/map_enhancer.dart';

void main() {
  test('Map.getIn() method', () {
    final Map m = {
      'a': 1,
      'b': {
        'c': 2,
      },
    };
    expect(m.getIn('a'.split('.')), 1);
    expect(m.getIn('b.c'.split('.')), 2);
    expect(m.getIn('d'.split('.')), null);
    expect(m.getIn('d'.split('.'), defaultValue: 3), 3);
    expect(m.getIn('a.z'.split('.'), defaultValue: 4), 4);
  });

  test('Map.setIn() method', () {
    final Map m = {};
    m.setIn('a'.split('.'), 1);
    m.setIn('b.c'.split('.'), 2);
    expect(m['a'], 1);
    expect(m['b']['c'], 2);
    m.setIn('a.b'.split('.'), 3);
    expect(m['a']['b'], 3);
  });

  test('Map.unsetIn() method', () {
    final Map m = {
      'a': 1,
      'b': {
        'c': 2,
      },
    };
    m.unsetIn('a'.split('.'));
    expect(m.containsKey('a'), false);
    m.unsetIn('b.c'.split('.'));
    expect((m['b'] as Map).containsKey('c'), false);
  });

  test('Map.hasIn() method', () {
    final Map m = {
      'a': 1,
      'b': {
        'c': 2,
      },
    };
    expect(m.hasIn('a'.split('.')), true);
    expect(m.hasIn('b.c'.split('.')), true);
    expect(m.hasIn('b.c.d'.split('.')), false);
  });
}
