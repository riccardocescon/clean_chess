import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MLichessRepository extends Mock implements LichessRepository {}

@GenerateNiceMocks([MockSpec<MLichessRepository>()])
void main() {}
