import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_oauth_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MLichessOAuthRepository extends Mock implements LichessOAuthRepository {}

@GenerateNiceMocks([MockSpec<MLichessOAuthRepository>()])
void main() {}
