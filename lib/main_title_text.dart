import 'package:flutter/material.dart';

class MainTitleText extends Text {

  final String data;

  const MainTitleText({Key? key, required this.data}): super(key: key,
    data,
    style: const TextStyle(
      fontSize: 25,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold
    )
  );
}
