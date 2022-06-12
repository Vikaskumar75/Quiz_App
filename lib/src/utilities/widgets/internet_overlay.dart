import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/utilities/export.dart';

class InternetOverlay extends ConsumerStatefulWidget {
  const InternetOverlay({Key? key}) : super(key: key);

  @override
  ConsumerState<InternetOverlay> createState() => _InternetOverlay();
}

class _InternetOverlay extends ConsumerState<InternetOverlay> {
  @override
  Widget build(BuildContext context) {
    final bool isInternetAvailable = ref.watch(connectivityProvider);
    return isInternetAvailable
        ? const SizedBox.shrink()
        : Container(
            height: 120.toHeight,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            color: Colors.black.withOpacity(0.2),
            child: const LazyLoadingText(Strings.internetError),
          );
  }
}
