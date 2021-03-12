library map_enhancer;

extension MapEnhancer on Map {
  /// Gets a nested value in `path` of the `Map`,
  /// if not present, returns null, or the optionally provided `defaultValue`.
  dynamic getIn(List path, {dynamic defaultValue}) {
    assert(path.isNotEmpty);

    Map? pointer = this;
    dynamic returnValue = defaultValue;
    for (var i = 0; i < path.length; i++) {
      final node = path[i];
      if (!pointer!.containsKey(node)) {
        break;
      }
      if (i == path.length - 1) {
        returnValue = pointer[node];
        break;
      } else {
        if (pointer[node] is! Map) {
          break;
        }
        pointer = pointer[node];
      }
    }
    return returnValue;
  }

  /// Sets a nested value in `path` of the `Map` with the provided `value`.
  void setIn(List path, dynamic value) {
    assert(path.isNotEmpty);

    Map? pointer = this;
    for (var i = 0; i < path.length; i++) {
      final node = path[i];
      if (i == path.length - 1) {
        pointer![node] = value;
      } else {
        if (pointer![node] is! Map) {
          pointer[node] = {};
        }
        pointer = pointer[node];
      }
    }
  }

  /// Removes nested key in provided `path` and its associated value,
  /// if present, from the `Map`.
  void unsetIn(List path) {
    assert(path.isNotEmpty);

    dynamic pointer = path.length > 1
        ? this.getIn(
            path.sublist(0, path.length - 1),
          )
        : this;
    if (pointer is Map) {
      pointer.remove(path.last);
    }
  }

  /// Returns if a key is present in `path` of the `Map`
  bool hasIn(List path) {
    assert(path.isNotEmpty);

    dynamic pointer = path.length > 1
        ? this.getIn(
            path.sublist(0, path.length - 1),
          )
        : this;
    if (pointer is Map) {
      return pointer.containsKey(path.last);
    }
    return false;
  }
}
