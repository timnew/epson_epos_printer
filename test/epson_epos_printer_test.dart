import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:epson_epos_printer/epson_epos_printer.dart';

void main() {
  const MethodChannel channel = MethodChannel('epson_epos_printer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await EpsonEposPrinter.platformVersion, '42');
  });
}
