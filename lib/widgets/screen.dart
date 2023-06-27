import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen extends StatelessWidget {
  const Screen({
    Key? key,
    required this.children,
    this.isCenter = true,
    this.isLoading = false,
  }) : super(key: key);

  final List<Widget> children;
  final bool isCenter;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IgnorePointer(
        ignoring: isLoading,
        child: Align(
          alignment: isCenter ? Alignment.center : Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 540.spMin),
            child: Padding(
              padding: EdgeInsets.all(30.spMin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
