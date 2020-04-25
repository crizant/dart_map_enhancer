library map_enhancer;

extension MapEnhancer on Map {
  bool _isMap(dynamic value) {
    return value.runtimeType == Map ||
        '${value.runtimeType}'.startsWith('_InternalLinkedHashMap');
  }

  /// Gets a nested value in a `Map`, optionally provide a `defaultValue`.
  dynamic get(List path, {dynamic defaultValue}) {
    assert(this != null);
    assert(path.isNotEmpty);

    Map pointer = this;
    dynamic returnValue = defaultValue;
    for (var i = 0; i < path.length; i++) {
      final node = path[i];
      if (!pointer.containsKey(node)) {
        break;
      }
      if (i == path.length - 1) {
        returnValue = pointer[node];
        break;
      } else {
        if (!_isMap(pointer[node])) {
          break;
        }
        pointer = pointer[node];
      }
    }
    return returnValue;
  }

  /// Sets a nested value in a `Map` with the provided `value`.
  void set(List path, dynamic value) {
    assert(this != null);
    assert(path.isNotEmpty);

    Map pointer = this;
    for (var i = 0; i < path.length; i++) {
      final node = path[i];
      if (i == path.length - 1) {
        pointer[node] = value;
      } else {
        if (!_isMap(pointer[node])) {
          pointer[node] = {};
        }
        pointer = pointer[node];
      }
    }
  }

  /// Removes nested key and its associated value, if present, from the `Map`.
  void unset(List path) {
    assert(this != null);
    assert(path.isNotEmpty);

    dynamic pointer = path.length > 1
        ? this.get(
            path.sublist(0, path.length - 1),
          )
        : this;
    if (_isMap(pointer)) {
      pointer.remove(path.last);
    }
  }
}
