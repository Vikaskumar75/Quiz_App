import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/authentication/repository/authentication_repo.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';

import 'src/app/app.dart';
import 'src/app/app_service.dart';
import 'src/utilities/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Passing all the repos that are going to be used in the app
  await AppService.getInstance.initialize(
    availabilityRepository: AvailabilityRepository(),
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
//? Error handler
//? interceptors
//? make a logger
//? dialog service