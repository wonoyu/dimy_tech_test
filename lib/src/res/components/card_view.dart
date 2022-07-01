import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CardView extends StatelessWidget {
  const CardView(
      {Key? key,
      required this.title,
      this.isPressed = false,
      required this.description,
      required this.ingredients})
      : super(key: key);
  final String title;
  final bool isPressed;
  final String description;
  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(16.0),
      duration: const Duration(seconds: 500),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: isPressed
                        ? Colors.grey.shade200
                        : Colors.grey.shade300),
                boxShadow: isPressed
                    ? []
                    : [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(4, 4),
                            spreadRadius: 1,
                            blurRadius: 15),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            spreadRadius: 1,
                            blurRadius: 15)
                      ]),
            child: Wrap(
              spacing: 8.0,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.vertical,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ReadMoreText(
                    description,
                    trimLength: 100,
                    trimMode: TrimMode.Length,
                    trimCollapsedText: "\n\nRead More",
                    trimExpandedText: "\n\nRead Less",
                    lessStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                    moreStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  ingredients[index],
                                )),
                          )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
