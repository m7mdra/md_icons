import 'package:flutter_test/flutter_test.dart';
import 'package:mdl_icons/mdl_icons.dart';

void main() {
  test('test icon map to codepoint', () {
    assert(MDIL.xml.codePoint == 0xF5C0);
    assert(MDIL.settings.codePoint == 0xF493);
  });
}
