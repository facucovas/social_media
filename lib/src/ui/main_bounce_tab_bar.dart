import 'package:flutter/material.dart';




class BounceTabBar extends StatefulWidget {

  const BounceTabBar({
    Key key,
    this.backgroundColor = Colors.white, 
    @required this.items,
    @required this.onTabChanged,
    this.initialIndex = 0,
    this.movement = 75.0
  }) : super(key: key);
  
  
  final Color backgroundColor;
  final List<Widget> items;
  final ValueChanged<int> onTabChanged;
  final int initialIndex;
  final double movement;



  @override
  _BounceTabBarState createState() => _BounceTabBarState();
}

class _BounceTabBarState extends State<BounceTabBar> 
  with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animTabBarIn;
  Animation _animTabBarOut;
  Animation _animCircleItem;
  Animation _animElevationIn;
  Animation _animElevationOut;

  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
    _controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 1200)
    );

    _animTabBarIn = CurveTween(
      curve: Interval(
        0.1, 
        0.6,
        curve: Curves.decelerate
      ),
    ).animate(_controller);

    _animTabBarOut = CurveTween(
      curve: Interval(
        0.6, 
        1.0,
        curve: Curves.bounceOut
      ),
    ).animate(_controller);

    _animCircleItem = CurveTween(
      curve: Interval(
        0.0, 
        0.5,
        curve: Curves.bounceOut
      ),
    ).animate(_controller);

     _animElevationIn = CurveTween(
      curve: Interval(
        0.3, 
        0.5,
        curve: Curves.decelerate
      ),
    ).animate(_controller);

    _animElevationOut = CurveTween(
      curve: Interval(
        0.55, 
        1,
        curve: Curves.bounceOut
      ),
    ).animate(_controller);

    _controller.forward(from: 1.0);
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    double currentWidth = width;
    double currentElevation = 0.0;
    final movement = widget.movement;

    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          currentWidth = width - (movement * _animTabBarIn.value) + (movement * _animTabBarOut.value);
          currentElevation = -movement * _animElevationIn.value + 
          (movement - kBottomNavigationBarHeight / 4) * _animElevationOut.value;
          return Center(
              child: Container(
              width: currentWidth,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(widget.items.length, (index) {
                  final child = widget.items[index];
                  final innerWidget = CircleAvatar(
                          radius: 30.0,
                          backgroundColor: widget.backgroundColor,
                          child: child,
                        );
                  if (index == _currentIndex) {
                    return Expanded(
                      child: CustomPaint(
                        foregroundPainter: _CircleItemPainter(
                          _animCircleItem.value
                        ),
                        child: Transform.translate(
                          offset: Offset(0.0, currentElevation),
                          child: innerWidget
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: GestureDetector(                        
                        onTap: () {
                          widget.onTabChanged(index);
                          setState(() {
                            _currentIndex = index;
                          });
                          _controller.forward(from: 0.0);
                        },
                        child: innerWidget
                      ),
                    );
                  }
                })
              ),
            ),
          );
        }
      ),
    );
  }
}

class _CircleItemPainter extends CustomPainter {

  final double progress;

  _CircleItemPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 20.0 * progress;
    final strokeWidth = 10.0;
    final currentStrokeWidth = strokeWidth * (1 - progress);
    if (progress < 1.0) {
      canvas.drawCircle(
        center, 
        radius, 
        Paint()
          ..color = Colors.black 
          ..style = PaintingStyle.stroke
          ..strokeWidth = currentStrokeWidth
      );
    }
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;



}