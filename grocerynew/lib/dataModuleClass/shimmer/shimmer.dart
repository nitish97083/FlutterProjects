import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.grey[300]!,
        period: Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400]!,
            shape: shapeBorder,
          ),
        ),
      );
}

final List dumm = [1, 2, 3, 4, 5];
List<Widget> buildMovieShimmer(BuildContext context) {
  return dumm
      .map((e) => ListTile(
            leading: CustomWidget.circular(height: 64, width: 64),
            title: Align(
              alignment: Alignment.centerLeft,
              child: CustomWidget.rectangular(
                height: 16,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            subtitle: CustomWidget.rectangular(height: 14),
          ))
      .toList();
}
