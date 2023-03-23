import 'package:cleanchess/core/chesskit/chesskit_failures.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/chesskit/chesskit.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ChessKit chessKit;

  setUp(() {
    chessKit = ChessKit(Setup.standard);
  });

  group('Movements', () {
    test('Valid move: e2e4', () {
      final result = chessKit.move('e2e4');
      expect(result.isRight(), true);
    });

    test('Invalid move: e2e5', () {
      final result = chessKit.move('e2e5');
      expect(result.isLeft(), true);
      expect(result.left, isA<InvalidMoveFailure>());
    });
  });
}
