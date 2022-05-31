// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../export.dart';

class LabelTextField extends StatefulWidget {
  const LabelTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.onNext,
    this.obsecure = false,
    this.showLoader = false,
    this.validator,
    required this.controller,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final VoidCallback? onNext;
  final bool obsecure;
  final String? Function(String?)? validator;
  final bool showLoader;

  @override
  State<LabelTextField> createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {
  final FocusNode _focus = FocusNode();
  bool _hasFocus = false;

  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    _hasFocus = _focus.hasFocus;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.labelText ?? '',
          style: CustomTheme.bodyText1.copyWith(
            color: _hasFocus
                ? ColorPallet.white
                : ColorPallet.white.withOpacity(0.5),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          focusNode: _focus,
          style: CustomTheme.bodyText1.copyWith(
            color: ColorPallet.white.withOpacity(0.8),
          ),
          obscureText: widget.obsecure,
          obscuringCharacter: '*',
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: CustomTheme.bodyText1.copyWith(
              color: ColorPallet.white.withOpacity(0.3),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPallet.white,
                width: 2,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPallet.white.withOpacity(0.5),
                width: 2,
              ),
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: (widget.showLoader ? 24 : 48).toHeight,
              maxWidth: (widget.showLoader ? 24 : 48).toWidth,
            ),
            suffixIcon: _getSuffixIcon(),
          ),
        ),
      ],
    );
  }

  Widget? _getSuffixIcon() {
    if (widget.onNext == null) return null;
    if (widget.showLoader) {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          ColorPallet.white,
        ),
        strokeWidth: 2,
      );
    } else {
      return GestureDetector(
        onTap: widget.onNext,
        child: Icon(
          Icons.arrow_circle_right_outlined,
          color: _hasFocus ? ColorPallet.golden : ColorPallet.blackishGolden,
        ),
      );
    }
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    super.dispose();
  }
}
