import 'package:flutter/material.dart';
import 'package:quiz_app/src/utilities/app_error.dart';
import '../theme/theme_provider.dart';

class GenericErrorWidget extends StatelessWidget {
  const GenericErrorWidget({
    Key? key,
    this.error,
    this.stack,
  }) : super(key: key);
  final AppError? error;
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
