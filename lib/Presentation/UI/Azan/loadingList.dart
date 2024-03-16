import 'package:flutter/material.dart';

class AniamtedItem extends StatefulWidget {
  Widget item;
  int index;
  int itemcount;
  AniamtedItem(
      {required this.item, required this.index, required this.itemcount});
  @override
  _AniamtedItemState createState() => _AniamtedItemState();
}

class _AniamtedItemState extends State<AniamtedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> _items = List.generate(10, (index) => 'Item $index');

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = CurvedAnimation(
      parent: ModalRoute.of(context)!.animation!,
      curve: Interval(
        widget.index / widget.itemcount,
        1.0,
        curve: Curves.easeInOut,
      ),
    );

    return FadeTransition(opacity: animation, child: widget.item);
  }
}
