import 'package:cleanchess/features/clean_chess/domain/usecases/get_my_profile.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/lichess_gain_access_token.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/lichess_oauth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MLichessOAuth extends Mock implements LichessOAuth {}

class MLichessGainAccessToken extends Mock implements LichessGainAccessToken {}

class MGetMyProfile extends Mock implements GetMyProfile {}

@GenerateNiceMocks([
  MockSpec<MLichessOAuth>(),
  MockSpec<MLichessGainAccessToken>(),
  MockSpec<MGetMyProfile>()
])
void main() {}
