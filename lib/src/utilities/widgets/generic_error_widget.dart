import 'package:flutter/material.dart';

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
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
