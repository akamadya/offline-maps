import 'package:flutter/widgets.dart';

// Bold Text
Widget getBoldText(String txt) {
  return Text(
    txt,
    style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Color(
          0xff1D2939,
        )),
  );
}

// Semi Bold Text
Widget getSemiBoldText(String txt) {
  return Text(
    txt,
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: Color(
        0xff344054,
      ),
    ),
  );
}
