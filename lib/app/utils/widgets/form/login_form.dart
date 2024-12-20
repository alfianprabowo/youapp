import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youapp/app/utils/constants/layout_const.dart';

import '../../constants/color_const.dart';

class LoginForm extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;

  final Widget? prefixIcon;
  final Text? prefix;
  final Widget? suffixIcon;
  final String? defaultText;
  final String? labelText;
  final String? errorText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? functionValidate;
  final String? parametersValidate;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidate;

  const LoginForm({
    Key? key,
    this.textInputType,
    this.hintText,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.defaultText,
    this.errorText,
    this.focusNode,
    this.obscureText,
    this.controller,
    this.functionValidate,
    this.parametersValidate,
    this.actionKeyboard,
    this.onSubmitField,
    this.onFieldTap,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.labelText,
    this.inputFormatters,
    this.autoValidate,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryBlueColor,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.textInputType,
      textInputAction: widget.actionKeyboard,
      focusNode: widget.focusNode,
      initialValue: widget.defaultText,
      maxLength: widget.maxLength,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 1,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
      ),
      autovalidateMode: widget.autoValidate ?? AutovalidateMode.disabled,
      decoration: InputDecoration(
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorText: widget.errorText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.06),
          ),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlueColor),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 0.06),
        contentPadding: const EdgeInsets.all(
          LayoutConst.spaceL,
        ),
        isDense: true,
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 10.0,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
        errorMaxLines: 2,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
      controller: widget.controller,
      validator: (value) {
        if (widget.functionValidate != null) {
          String? resultValidate = widget.functionValidate!(
            value,
          );
          return resultValidate;
        }
        return null;
      },
      onSaved: (value) {
        if (widget.onSaved != null) widget.onSaved!.call(value);
      },
      onFieldSubmitted: (value) {
        if (widget.onSubmitField != null) widget.onSubmitField!();
      },
      onTap: () {
        if (widget.onFieldTap != null) widget.onFieldTap!();
      },
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!.call(value);
      },
      inputFormatters: widget.inputFormatters,
    );
  }
}
