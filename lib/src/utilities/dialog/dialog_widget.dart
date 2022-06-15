part of 'dialog_service.dart';

final StateNotifierProvider<DialogService, _DialogState> dialogServiceProvider =
    StateNotifierProvider<DialogService, _DialogState>((_) {
  return DialogService.instance;
});

class _Dialog extends ConsumerWidget {
  const _Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _DialogState state = ref.watch(dialogServiceProvider);

    if (state is! _ShowDialogState) return const SizedBox.shrink();

    return Container(
      height: 150.toHeight,
      width: double.infinity,
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(
        left: 16.toWidth,
        bottom: 16.toWidth,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black.withOpacity(0.4),
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.1),
            Colors.transparent
          ],
          stops: const <double>[
            0.3,
            0.5,
            0.7,
            0.9,
            1.0,
          ],
        ),
      ),
      child: LazyLoadingText(
        state.message,
        style: CustomTheme.bodyText1.copyWith(
          fontSize: 16.toFont,
          color: state.textColor,
          foreground:
              state.textColor == null ? ColorPallet.dialogShaderPaint : null,
        ),
      ),
    );
  }
}
