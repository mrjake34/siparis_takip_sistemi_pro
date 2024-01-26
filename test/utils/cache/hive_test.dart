import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  setUp(() async {
    Hive.defaultDirectory = (await getApplicationCacheDirectory()).path;
  });
  test('Test Text', () {});
}
