enum Flavor { dev, stag, prod }

class F {
  static late Flavor flavor;
}

extension FlavorX on Flavor {
  bool get isDevelopment {
    return this == Flavor.dev;
  }
}
