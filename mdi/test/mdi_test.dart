import 'package:flutter_test/flutter_test.dart';
import 'package:md_icons/md_icons.dart';

void main() {
  test('test icon map to codepoint', () {
    assert(MDI.abacus.codePoint == 0xF16E0);
    assert(MDI.searchWeb.codePoint == 0xF070F);
  });
}
