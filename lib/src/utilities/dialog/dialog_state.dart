part of 'dialog_service.dart';

abstract class _DialogState extends Equatable {
  @override
  List<Object?> get props => <Object>[];
}

class _InitialDialogState extends _DialogState {}

class _ShowDialogState extends _DialogState {
  final String message;
  final Color? textColor;
  _ShowDialogState({
    required this.message,
    this.textColor,
  });

  @override
  List<Object?> get props => <Object?>[message, textColor];
}
