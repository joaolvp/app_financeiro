
import 'package:app_financeiro/src/common/constants/app_colors.dart';
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
    Key? key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.onChanged, 
    this.helperText, 
    this.inputFormatters,
  }) : super(key: key);

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
      //cursorColor: AppColors.grey,
      style: const TextStyle(color: AppColors.grey, fontSize: 18),
      decoration: InputDecoration(
          helperText: _helperText,
          helperMaxLines: 2,
          helperStyle: const TextStyle(color: AppColors.smokyBlack),
          isDense: true,
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.grey),
          floatingLabelStyle: const TextStyle(color: Colors.grey),
          errorStyle: const TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.smokyBlack)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.smokyBlack)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.smokyBlack)),
          filled: true,
          fillColor: AppColors.white,
          suffixIcon: Visibility(
            visible: widget.obscureText,
            child: InkWell(
              onTap: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
              child: _obscure == false
                  ? const Icon(
                      Icons.visibility_off,
                      color: AppColors.grey,
                    )
                  : const Icon(Icons.visibility,
                      color: AppColors.grey),
            ),
          )),
    );
  }
}
