import 'package:flutter/material.dart';

class ButtonPerson extends ElevatedButton {
  ButtonPerson(
      {Key? key,
      required onPressed,
      required String name,
      required BuildContext context})
      : super(
            key: key,
            onPressed: onPressed,
            child: Text(
              name,
              style: const TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.8, 40)),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white)),
                backgroundColor: MaterialStateProperty.all(
                    name == "Ver resultado"
                        ? Colors.green
                        : Colors.deepPurple)));
}
