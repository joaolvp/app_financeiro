import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextformfield extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? helperText;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextformfield({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.onChanged, 
    this.helperText, 
    this.inputFormatters,
  });

  @override
  State<AppTextformfield> createState() => _AppTextformfieldState();
}


class _AppTextformfieldState extends State<AppTextformfield> {
  bool _obscure = true;
  String? _helperText;

  @override
  void initState() {
    _helperText = widget.helperText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorContext = Theme.of(context).colorScheme;
    return TextFormField(
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText == true ? _obscure : false,
      validator: widget.validator,
      onChanged: (value){
        if(value.length == 1){
          setState(() {
            _helperText = null;
          });
        }else if(value.isEmpty){
          setState(() {
            _helperText = widget.helperText;  
          });
        }
      },
      onTapOutside: (value) => FocusScope.of(context).unfocus(),
      style: TextStyle(color: colorContext.tertiary, fontSize: 18),
      decoration: InputDecoration(
          helperText: _helperText,
          helperMaxLines: 3,
          helperStyle: AppTextStyles.smallText13.copyWith(color: colorContext.tertiary),
          isDense: true,
          labelText: widget.label,
          labelStyle: TextStyle(color: colorContext.tertiary),
          floatingLabelStyle: TextStyle(color: colorContext.tertiary),
          errorStyle: const TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorContext.tertiary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorContext.tertiary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorContext.tertiary)),
          filled: true,
          fillColor: colorContext.secondary,
          suffixIcon: Visibility(
            visible: widget.obscureText,
            child: InkWell(
              onTap: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
              child: _obscure == false
                  ? Icon(
                      Icons.visibility_off,
                      color: colorContext.tertiary,
                    )
                  : Icon(Icons.visibility,
                      color: colorContext.tertiary),
            ),
          )),
    );
  }
}
