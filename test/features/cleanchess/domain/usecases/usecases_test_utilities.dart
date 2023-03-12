import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'repo_mocks.mocks.dart';

void setSuccessAuthResponse({
  required MockMLichessOAuthRepository mockLichessRepository,
  required String stateVerifier,
}) {
  when(mockLichessRepository.authenticate(
    grant: anyNamed('grant'),
    stateVerifier: anyNamed('stateVerifier'),
    redirectUri: anyNamed('redirectUri'),
  )).thenAnswer(
    (_) async => Right(
      'com.example.cleanchess://authorize?code=_fake_code_&state=$stateVerifier',
    ),
  );
}
