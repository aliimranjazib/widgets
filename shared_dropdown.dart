import 'package:flutter/material.dart';

import '../../utils/constants/styles.dart';

class SharedDropdown<T> extends StatelessWidget {
  final String? header;
  final List<DropdownMenuItem<T?>> items;
  final T? value;
  final Function(T?)? onChanged;
  final String? hintText;
  final String? Function(T?)? validator;
  final bool filled;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? headerStyle;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? inputBorder;

  const SharedDropdown({
    this.header,
    required this.items,
    this.value,
    this.onChanged,
    this.hintText,
    this.validator,
    this.filled = false,
    this.fillColor,
    this.hintStyle,
    this.style,
    this.headerStyle,
    this.contentPadding,
    this.inputBorder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              header!,
              style: headerStyle ??
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
            ),
          ),
        DropdownButtonFormField<T?>(
          value: value,
          onChanged: onChanged,
          validator: validator,
          items: items,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff545E72),
                ),
            filled: filled,
            fillColor: fillColor,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            enabledBorder: inputBorder ?? kTextfieldborder,
            focusedBorder: inputBorder ?? kTextfieldborder,
            errorBorder: inputBorder ??
                const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color(0xff545E72), width: 1),
                ),
            focusedErrorBorder: inputBorder ??
                const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
          ),
        ),
      ],
    );
  }
}
