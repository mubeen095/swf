import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget  {
  const PrimaryTextField(
      {super.key,
       TextEditingController? controller,
      String? Function(String?)? validator,
      required String label,
      String? hintText,
      bool obscure = false,
      int? maxLines,
      TextInputType? keyboardType,
      void Function(String)? onChanged
      
      
      })
      : _controller = controller,
      _validator = validator,
        _label = label,
        _maxLines = maxLines,
        _hintText = hintText,
        _obscure = obscure,
        _onChanged = onChanged,
        _keyboardType = keyboardType;


  final TextEditingController? _controller;
  final String? Function(String?)? _validator;
  final String _label;
  final String? _hintText;
  final bool _obscure;
  final int? _maxLines;
  final TextInputType? _keyboardType;
final  void Function(String)? _onChanged;

  @override
  Widget build(BuildContext context) {
    final inputDecorationTheme = Theme.of(context).inputDecorationTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_label),
        TextFormField(
          controller: _controller,
          obscureText: _obscure,
          keyboardType: _keyboardType,
          maxLines: _obscure ? 1 : _maxLines,
          onChanged: _onChanged,
          validator: _validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            isDense: true,
            hintText: _hintText,
            
            border: inputDecorationTheme.border,
            focusedBorder: inputDecorationTheme.focusedBorder,
            enabledBorder: inputDecorationTheme.enabledBorder,
            errorBorder: inputDecorationTheme.errorBorder,
          ),
        ),
      ],
    );
  }
}
