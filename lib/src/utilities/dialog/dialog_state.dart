part of 'dialog_service.dart';

abstract class DialogState extends Equatable {
  @override
  List<Object?> get props => <Object>[];
}

class _InitialDialogState extends DialogState {}

class _ShowDialogState extends DialogState {
  final String message;
  final Color? textColor;
  _ShowDialogState({
    required this.message,
    this.textColor,
  });

  @override
  List<Object?> get props => <Object?>[message, textColor];
}
