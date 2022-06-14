import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'export.dart';

class Observer extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Console.log(
      'provider: ${provider.name ?? provider.runtimeType}\npreiousValue: $previousValue\nnewValue: $newValue',
    );
  }
}
