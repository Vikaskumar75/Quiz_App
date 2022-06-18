import 'package:flutter/material.dart';
import 'package:quiz_app/src/utilities/theme/theme_provider.dart';

class GenericErrorWidget extends StatelessWidget {
  const GenericErrorWidget({
    Key? key,
    this.error,
    this.stack,
  }) : super(key: key);
  final Object? error;
  final StackTrace? stack;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something Went Wrong'
        '${error ?? ''}',
        style: CustomTheme.headline6,
      ),
    );
  }
}
