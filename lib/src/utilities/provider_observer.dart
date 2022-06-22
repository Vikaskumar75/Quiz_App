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
    // add the providers that you want to ignore from the Observer.
    final List<dynamic> ignoreList = <dynamic>[
      StateProvider<int>,
      StateProvider<double>
    ];
    if (ignoreList.contains(provider.runtimeType)) return;
    Console.log(
      'provider: ${provider.name ?? provider.runtimeType}\npreiousValue: $previousValue\nnewValue: $newValue',
    );
  }
}
