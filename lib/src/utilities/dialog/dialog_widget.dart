part of 'dialog_service.dart';

final StateNotifierProvider<DialogService, DialogState> dialogServiceProvider =
    StateNotifierProvider<DialogService, DialogState>((_) {
  return DialogService.instance;
});

class _Dialog extends ConsumerWidget {
  const _Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DialogState state = ref.watch(dialogServiceProvider);

    if (state is! _ShowDialogState) return const SizedBox.shrink();

    return Container(
      height: 100.toHeight,
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
            Colors.black.withOpacity(0.55),
            Colors.black.withOpacity(0.45),
            Colors.black.withOpacity(0.35),
            Colors.black.withOpacity(0.25),
            Colors.black.withOpacity(0.15),
            Colors.black.withOpacity(0.05),
            Colors.transparent
          ],
          stops: const <double>[0.25, 0.55, 0.65, 0.75, 0.85, 0.94, 1.0],
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
