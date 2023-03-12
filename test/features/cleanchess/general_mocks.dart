import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MLichessClientDio extends Mock implements LichessClientDio {}

class MFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

class MLichessTokenProvider extends Mock implements LichessTokenProvider {}

@GenerateNiceMocks([
  MockSpec<MLichessClientDio>(),
  MockSpec<MFlutterSecureStorage>(),
  MockSpec<MLichessTokenProvider>(),
])
void main() {}
