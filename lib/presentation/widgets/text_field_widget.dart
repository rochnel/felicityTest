import 'package:flutter/material.dart';

import '../../app/config/app_colors.dart';


class TextFildWidget extends StatefulWidget {
  TextFildWidget(
      {
        Key? key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.isPassword,
      this.onChanged,
      this.onTap,
      this.enabled,
      this.maxLines,
      this.prefixIcon,
      this.suffixIcon,
      this.textInputType,
      required this.messageErro})
      : super(key: key);
  String? labelText;
  String? hintText;
  bool? isPassword = false;
  String? messageErro;
  Function()?onTap;
  bool? enabled;
  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;

  TextEditingController? controller;
  void Function(String)? onChanged;
  TextInputType? textInputType = TextInputType.text;

  @override
  State<TextFildWidget> createState() => _TextFildWidgetState();
}

class _TextFildWidgetState extends State<TextFildWidget> {
  bool? isString = true;

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return (widget.isPassword == false)
        ?TextFormField(
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      controller: widget.controller,
      onTap: widget.onTap,
      enabled:widget.enabled,
      maxLines:widget.maxLines??1,
      decoration: InputDecoration(
        errorText: widget.messageErro,
        helperText: ' ',
        labelText: widget.labelText,
        suffixIcon:widget.suffixIcon,
        prefixIcon:widget.prefixIcon,
        labelStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: Color(0xff8D9091),
            fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xffEFEFEF)),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xff175CFF)),
            gapPadding: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xffEFEFEF)),
            gapPadding: 10),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        fillColor: Color(0xffFBFBFB),

      ),
        )
        :TextFormField(
      onTap: widget.onTap,
      enabled:widget.enabled,
      maxLines:widget.maxLines??1,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: _isHidden,
      decoration: InputDecoration(
        suffixIcon:widget.suffixIcon,
        prefixIcon:widget.prefixIcon,
        suffix: InkWell(
          onTap: _togglePasswordView,
          child: Icon(
            _isHidden
                ? Icons.visibility
                : Icons.visibility_off,
          ),
        ),
        errorText: widget.messageErro,
        helperText: ' ',
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize:14,
            fontWeight: FontWeight.bold),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: Color(0xff8D9091), fontSize:14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xffEFEFEF)),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xff175CFF)),
            gapPadding: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xffEFEFEF)),
            gapPadding: 10),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        fillColor: Color(0xffFBFBFB),

      ),
        );
  }

  void _togglePasswordView() {
  
     
      setState(() {
      _isHidden = !_isHidden;
    });
   
  }
}
