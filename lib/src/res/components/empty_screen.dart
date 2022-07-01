import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_dimy_tech/src/res/colors.dart';
import 'package:test_dimy_tech/src/utils/routes.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDimyCoffee90,
      child: Center(
        child: Wrap(direction: Axis.vertical, children: [
          SvgPicture.asset('assets/images/page_not_found_2.svg'),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, homeScreen, (route) => false),
            child: const Text("Go Home"),
          )
        ]),
      ),
    );
  }
}
