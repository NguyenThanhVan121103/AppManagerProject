import 'package:flutter/material.dart';

class refreshIndicatorWidget extends StatelessWidget {
  const refreshIndicatorWidget({
    super.key,
    required GlobalKey<RefreshIndicatorState> refreshIndicator,
    required this.child,
  }) : _refreshIndicator = refreshIndicator;

  final GlobalKey<RefreshIndicatorState> _refreshIndicator;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: _refreshIndicator,
        onRefresh: () async{
          return Future<void>.delayed(const Duration(seconds: 2));
        },
        child: child,
    );
  }
}