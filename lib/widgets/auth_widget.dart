import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SladeRowhWidget extends StatelessWidget {
  const SladeRowhWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 20,
          height: 10,
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              )),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 20,
          height: 10,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 206, 124),
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              )),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 20,
          height: 10,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 206, 124),
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              )),
        ),
      ],
    );
  }
}
