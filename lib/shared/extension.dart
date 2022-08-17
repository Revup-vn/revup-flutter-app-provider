import 'package:dartz/dartz.dart';

extension IListExtension<E> on IList<E> {
  IList<E> sortByDouble(int Function(E e1, E e2) predicate) => sort(
        order(
          (p1, p2) {
            final compare = predicate(p1, p2);

            return compare == 0
                ? Ordering.EQ
                : compare > 0
                    ? Ordering.LT
                    : Ordering.GT;
          },
        ),
      );
}
