import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton(
    this.width,
    this.height, {
    super.key,
  });

  static Widget small() => const LoadingSkeleton(40, 20);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => Skeleton(
        isLoading: true,
        skeleton: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Container(),
      );
}
