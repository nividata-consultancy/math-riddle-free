import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';

extension ListExtension<T> on List<T> {
  List<T> orderByAnotherList(List<int> order, int Function(T) getId) {
    // assert(order.isNotEmpty, "Game ordering should not be empty.");
    // assert(this.isNotEmpty, "Game level should not be empty.");
    // assert(order.length == this.length,
    //     "Game ordering and level must have same length.");
    // assert(listEquals(order, this.map((e) => getId(e)).toList()) == true,
    //     "Some puzzle are missing as order and puzzle list contains different ids.");

    return this
      ..sort((a, b) {
        if (order.indexOf(getId(a)) > order.indexOf(getId(b))) {
          return 1;
        } else {
          return -1;
        }
      });
  }
}

void main() {
  var list = [
    const Tuple2(1, "A"),
    const Tuple2(2, "B"),
    const Tuple2(3, "C"),
    const Tuple2(4, "D"),
  ];

  var order = [4, 1, 2, 3];
  if (kDebugMode) {
    print(list.orderByAnotherList(order, (p0) => p0.item1).toString());
  }
}
