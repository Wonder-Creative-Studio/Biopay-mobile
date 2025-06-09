import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool? readOnly;
  final IconData? icon;
  final TextInputType? keyBoardType;
  final Widget? prefix;
  final String? Function(String?)? validator; // <-- NEW
  final VoidCallback? onTap;
  const CustomInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.readOnly = false,
    this.icon,
    this.keyBoardType,
    this.prefix,
    this.validator, // <-- NEW
    this.onTap, // <-- NEW
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _hidePassword;

  @override
  void initState() {
    super.initState();
    _hidePassword = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      obscureText: widget.obscureText ? _hidePassword : false,
      validator: widget.validator,
      onTap: widget.readOnly == true ? widget.onTap : null,
      // <-- NEW
      keyboardType: widget.keyBoardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 15),
        filled: true,
        prefixIcon: widget.prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    _hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                )
                : null,
      ),
      style: const TextStyle(fontSize: 15),
    );
  }
}
