// ignore_for_file: depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:core/networks/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() {

  group('/networks', () {
    test('Test dio with custom url dev', () {
      F.flavor = Flavor.dev;
      const matcher = baseUrlDev;
      final dio = Dio();
      final dioClient = DioClient(dio);

      expect(dioClient.client.options.baseUrl, matcher);
    });
    test('Test dio with custom url stag', () {
      F.flavor = Flavor.stag;
      const matcher = baseUrlStag;
      final dio = Dio();
      final dioClient = DioClient(dio);

      expect(dioClient.client.options.baseUrl, matcher);
    });
    test('Test dio with custom url prod', () {
      F.flavor = Flavor.prod;
      const matcher = baseUrlProd;
      final dio = Dio();
      final dioClient = DioClient(dio);

      expect(dioClient.client.options.baseUrl, matcher);
    });
  });
}
