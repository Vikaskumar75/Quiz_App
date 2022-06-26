import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../export.dart';

part 'dialog_state.dart';
part 'dialog_widget.dart';

class DialogService extends StateNotifier<_DialogState> {
  DialogService._() : super(_InitialDialogState());
  static final DialogService instance = DialogService._();

  Widget get widget => const _Dialog();

  void showDialog({
    required String message,
    Color? textColor,
    bool autoHide = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    // Hiding Already opened dialog
    hideDialog();

    state = _ShowDialogState(
      message: message,
      textColor: textColor,
    );

    Future<void>.delayed(duration, () {
      if (autoHide) hideDialog();
    });
  }

  void hideDialog() => state = _InitialDialogState();
}
