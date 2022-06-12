import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/authentication/repository/authentication_repo.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';

import 'src/app/app.dart';
import 'src/app/app_service.dart';
import 'src/utilities/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing dio and adding interceptors.
  // [ Note: This is done before repo initialization because we need to initilaze each and every repo clients. ]
  // Initializing ApiClient [ Dio ], This will also add interceptors.
  ApiClient.instance.initialize();

  // Passing all the repos that are going to be used in the app
  await AppService.getInstance.initialize(
    availabilityRepository: AvailabilityRepository.instance,
    authenticationRepo: AuthenticationRepo.instance,
  );

  runApp(
    ProviderScope(
      observers: <ProviderObserver>[Observer()],
      child: const App(),
    ),
  );
}



//! Things to do
// register
// login
//? interceptors
//? Error handler
//? make a logger
//? dialog service