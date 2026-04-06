import 'package:flutter/material.dart';

navTo(context, widget) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => widget));
}

navAndRemoveUntil(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
