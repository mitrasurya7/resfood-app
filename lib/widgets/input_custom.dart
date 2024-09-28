import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  const InputCustom({
    super.key,
    required this.titleInput,
    required this.controller,
    required this.obscureText,
    this.onPressed,
  });

  final String titleInput;
  final TextEditingController controller;
  final bool? obscureText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      // height: 20.0,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(titleInput),
          ),
          const SizedBox(
            height: 2,
          ),
          TextField(
            obscureText: obscureText!,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: titleInput == 'Password'
                  ? IconButton(
                      icon: Icon(obscureText!
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        onPressed!();
                      },
                    )
                  : null,
              filled: true,
              fillColor: Colors.amber[100],
              hintText: 'Please Enter $titleInput',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none)),
            ),
          ),
        ],
      ),
    );
  }
}
