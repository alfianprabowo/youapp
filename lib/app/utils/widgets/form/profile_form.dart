import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/color_const.dart';
import '../../constants/layout_const.dart';

class ProfileForm extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefixIcon;
  final Text? prefix;
  final String? suffixText;
  final Widget? suffixIcon;
  final String? defaultText;
  final String? labelText;
  final FocusNode? focusNode;
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
  final bool? readOnly;
  final TextStyle? hintStyle;

  const ProfileForm({
    Key? key,
    this.textInputType,
    this.hintText,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffixText,
    this.defaultText,
    this.labelText,
    this.focusNode,
    this.controller,
    this.functionValidate,
    this.parametersValidate,
    this.actionKeyboard,
    this.onSubmitField,
    this.onFieldTap,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.autoValidate,
    this.readOnly,
    this.hintStyle,
  }) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryBlueColor,
      obscureText: false,
      keyboardType: widget.textInputType,
      textInputAction: widget.actionKeyboard,
      focusNode: widget.focusNode,
      initialValue: widget.defaultText,
      textAlign: TextAlign.right,
      maxLength: widget.maxLength,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 2,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
      ),
      decoration: InputDecoration(
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffixText: widget.suffixText,
        hintText: widget.hintText,
        labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.22),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlueColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintTextDirection: TextDirection.rtl,
        hintStyle: widget.hintStyle ??
            const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.33),
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
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
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        errorMaxLines: 2,
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
      readOnly: widget.readOnly ?? false,
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
      onFieldSubmitted: (value) {
        if (widget.onSubmitField != null) widget.onSubmitField!.call(value);
      },
      onTap: () {
        if (widget.onFieldTap != null) widget.onFieldTap!();
      },
      onSaved: (value) {
        if (widget.onSaved != null) widget.onSaved!.call(value);
      },
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!.call(value);
      },
      inputFormatters: widget.inputFormatters,
    );
  }
}
