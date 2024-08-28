import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DemoBackToTop extends StatefulWidget {
  const DemoBackToTop({super.key});

  @override
  State<DemoBackToTop> createState() => _DemoBackToTopState();
}

class _DemoBackToTopState extends State<DemoBackToTop> {
  late ScrollController _scrollController;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 200) {
        setState(() {
          _isButtonVisible = true;
        });
      } else {
        setState(() {
          _isButtonVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Button Example'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
          if (_isButtonVisible)
            Container(
              padding: EdgeInsets.only(bottom: 32),
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(Icons.arrow_upward),
              ),
            ),
        ],
      ),
    );
  }
}