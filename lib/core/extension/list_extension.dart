import 'dart:math';

extension RandomListed<T> on List<T> {
  // Herhangi bir listeden random eleman dönderir
  T get randomListData => this[Random().nextInt(length)];
}
