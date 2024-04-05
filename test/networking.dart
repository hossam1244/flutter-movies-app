import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample_movies_app_flutter/core/network_info.dart';

void main() {
  NetworkInfoImpl? networkInfoImpl;
  InternetConnectionChecker internetConnectionChecker;

  setUp(() {
    internetConnectionChecker = InternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(internetConnectionChecker);
  });

  test("hasConnection", () async {
    final result = await networkInfoImpl?.isConnected;
    expect(result, true);
  });

  test("hasNoConnection", () async {
    final result = await networkInfoImpl?.isConnected;
    expect(!result!, false);
  });
}
