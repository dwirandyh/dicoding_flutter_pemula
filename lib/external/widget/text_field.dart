import 'package:dicoding_flutter_pemula/external/constant.dart';
import 'package:flutter/material.dart';

class ZTextField extends StatelessWidget {
  final String hint;
  final Icon? prefixIcon;
  final TextEditingController textEditingController;
  final bool obsecureText;
  const ZTextField(
      {Key? key,
      required this.textEditingController,
      this.hint = "",
      this.prefixIcon,
      this.obsecureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Theme(
            data: Theme.of(context).copyWith(
                primaryColor: Constant.primary, accentColor: Constant.primary),
            child: TextField(
              controller: this.textEditingController,
              obscureText: this.obsecureText,
              decoration: InputDecoration(
                hintText: this.hint,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: this.prefixIcon,
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 25,
                  minHeight: 25,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
