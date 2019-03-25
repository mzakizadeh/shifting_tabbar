library shifting_tabbar;

import 'package:flutter/material.dart';

class ShiftingTabBar extends StatefulWidget implements PreferredSizeWidget {
  ShiftingTabBar({
    Key key,
    @required this.tabs,
    this.controller,
    this.color,
    this.brightness,
  })  : assert(tabs != null),
        super(key: key);

  final List<ShiftingTab> tabs;
  final TabController controller;
  final Color color;
  final Brightness brightness;

  createState() => _ShiftingTabBarState();

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _ShiftingTabBarState extends State<ShiftingTabBar> {
  TabController _controller;
  Color _color;
  Brightness _brightness;

  didChangeDependencies() {
    super.didChangeDependencies();

    _controller = widget.controller ?? DefaultTabController.of(context);
    _color = widget.color ?? Theme.of(context).primaryColor;
    _brightness = widget.brightness ?? Brightness.light;

    _controller.animation.addListener(() => setState(() {}));
  }

  build(context) {
    return Container(
      color: _color,
      child: SafeArea(
        top: true,
        child: Row(
          children: _buildTabWidgets(),
        ),
      ),
    );
  }

  _buildTabWidgets() {
    final margin =
        (MediaQuery.of(context).size.width / (widget.tabs.length + 1) - 19) / 2;
    final tabWidgets = List<Widget>(widget.tabs.length);

    for (var i = 0; i < widget.tabs.length; i++) {
      tabWidgets[i] = _ShiftingTabWidget(
        key: widget.tabs[i].key,
        animation: ShiftingAnimation(_controller, i),
        margin: margin,
        icon: widget.tabs[i].icon,
        onTap: () => _controller.animateTo(i),
        text: widget.tabs[i].text,
        brightness: _brightness ??
            (_color.computeLuminance() > 0.5
                ? Brightness.dark
                : Brightness.light),
      );
    }

    return tabWidgets;
  }
}

class ShiftingTab {
  ShiftingTab({
    this.key,
    this.text,
    this.icon,
  });

  final Key key;
  final String text;
  final Icon icon;
}

class _ShiftingTabWidget extends AnimatedWidget {
  _ShiftingTabWidget({
    Key key,
    Animation<double> animation,
    this.onTap,
    this.text,
    this.icon,
    this.margin,
    this.brightness,
  }) : super(key: key, listenable: animation);

  final Function onTap;
  final String text;
  final Icon icon;
  final double margin;
  final Brightness brightness;

  final int iconSize = 19;
  final int textSize = 16;

  build(context) {
    final Animation<double> animation = listenable;
    final color = brightness == Brightness.dark
        ? Color.lerp(Colors.white54, Colors.white, animation.value)
        : Color.lerp(Colors.black54, Colors.black, animation.value);

    return Expanded(
      flex:
          (Tween(begin: 1.0, end: 2.0).animate(animation).value * 1000).round(),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: _buildTab(animation, color, margin, Directionality.of(context)),
      ),
    );
  }

  _buildTab(animation, color, margin, dir) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildIcon(color, margin, dir),
        _buildText(animation, color, dir),
      ],
    );
  }

  _buildIcon(color, margin, dir) {
    return Container(
      margin: dir == TextDirection.ltr
          ? EdgeInsets.only(left: margin)
          : EdgeInsets.only(right: margin),
      child: IconTheme.merge(
        data: IconThemeData(
          color: color,
          size: iconSize.toDouble(),
        ),
        child: icon,
      ),
    );
  }

  _buildText(animation, color, dir) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        child: Container(
          margin: dir == TextDirection.ltr
              ? EdgeInsets.only(left: 12)
              : EdgeInsets.only(right: 12),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            DefaultTextStyle(
              style: TextStyle(fontSize: 17, color: color, fontFamily: "Sans"),
              child: Text(text),
            )
          ]),
        ),
        axis: Axis.horizontal,
        axisAlignment: -1.0,
        sizeFactor: Tween(begin: 0.0, end: 1.0).animate(animation),
      ),
    );
  }
}

class ShiftingAnimation extends Animation<double>
    with AnimationWithParentMixin<double> {
  ShiftingAnimation(this.controller, this.index);

  final TabController controller;
  final int index;

  @override
  Animation<double> get parent => controller.animation;

  @override
  double get value => _indexChangeProgress(controller, index);
}

double _indexChangeProgress(TabController controller, int index) {
  final double controllerValue = controller.animation.value;
  final double previousIndex = controller.previousIndex.toDouble();
  final double currentIndex = controller.index.toDouble();

  if (index != currentIndex && index != previousIndex) if (controller
      .indexIsChanging)
    return 0.0;
  else if (controller.offset < 0 && index == controller.index - 1)
    return controller.offset.abs().clamp(0.0, 1.0);
  else if (controller.offset > 0 && index == controller.index + 1)
    return controller.offset.abs().clamp(0.0, 1.0);
  else
    return 0.0;

  if (!controller.indexIsChanging) {
    if (index == currentIndex)
      return 1.0 - controller.offset.abs().clamp(0.0, 1.0);
    else
      return (controller.index + 1 == previousIndex && controller.offset > 0) ||
              (controller.index - 1 == previousIndex && controller.offset < 0)
          ? controller.offset.abs().clamp(0.0, 1.0)
          : 0.0;
  }

  double val = (controllerValue - currentIndex).abs() /
      (currentIndex - previousIndex).abs();
  return index == currentIndex ? 1.0 - val : val;
}
