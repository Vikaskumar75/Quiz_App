import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class Observer extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger(
      printer: PrettyPrinter(methodCount: 0),
    ).i('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}
''');
  }
}
