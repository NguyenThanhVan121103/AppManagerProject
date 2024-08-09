import 'package:flutter/material.dart';

class DemoScroll extends StatefulWidget {
  @override
  _DemoScrollState createState() => _DemoScrollState();
}

class _DemoScrollState extends State<DemoScroll> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  void _onScroll() {
    double offset = _scrollController.offset;
    double screenHeight = MediaQuery.of(context).size.height;
    int newIndex = (offset / screenHeight).round();
    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Change Color on Scroll'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _scrollController.animateTo(
                      index * MediaQuery.of(context).size.height,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: _currentIndex == index ? Colors.blue : Colors.blueGrey,
                    alignment: Alignment.center,
                    child: Text(
                      'Item $index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: List.generate(3, (index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.primaries[index % Colors.primaries.length],
                  alignment: Alignment.center,
                  child: Text(
                    'Topic $index',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
