import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: Icon(Icons.arrow_back_outlined)),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            height: 45.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.asset("assets/images/profile.jpg").image
              )
            ),
            width: 45.0,
          ),
        )
      ],
    );
  }
}
