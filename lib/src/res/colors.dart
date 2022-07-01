import 'package:flutter/material.dart';

const kDimyCoffee10 = Color(0xff241401);
const kDimyCoffee20 = Color(0xff2d1b08);
const kDimyCoffee30 = Color(0xff38220f);
const kDimyCoffee40 = Color(0xff3c220c);
const kDimyCoffee50 = Color(0xff4f3017);
const kDimyCoffee60 = Color(0xff603e21);
const kDimyCoffee70 = Color(0xff634832);
const kDimyCoffee80 = Color(0xff967259);
const kDimyCoffee90 = Color(0xffdbc1ac);
const kDimyCoffee95 = Color(0xffece0d1);

final shimmerGradient = LinearGradient(
  colors: [
    Colors.grey.shade300,
    Colors.grey.shade200,
    Colors.grey.shade300,
  ],
  stops: const [
    0.1,
    0.3,
    0.4,
  ],
  begin: const Alignment(-1.0, -0.3),
  end: const Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
