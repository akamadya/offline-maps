import 'package:core/core.dart';

class FlavorConfig<T> {
  FlavorConfig({
    this.dev,
    this.prod,
    this.staging,
    this.fallback,
  });

  final T? dev;
  final T? prod;
  final T? staging;
  final T? fallback;

  T get value {
    switch (F.flavor) {
      case Flavor.dev:
        return dev ?? fallback!;
      case Flavor.stag:
        return staging ?? fallback!;
      case Flavor.prod:
        return prod ?? fallback!;
    }
  }
}
