import 'package:flutter/material.dart';
import 'package:transaction_plus/utils/array_helper.dart';

class GroupListModel<T> {
  String? title;
  List<T>? children;
}

typedef GroupItemBuilder<T> = Widget Function(T value);

class GroupListWidget<T> extends StatefulWidget {
  final List<GroupListModel<T>> list;
  final GroupItemBuilder<T> groupItemBuilder;
  final EdgeInsetsGeometry? padding;

  const GroupListWidget({
    Key? key,
    required this.list,
    required this.groupItemBuilder,
    this.padding,
  });

  @override
  State<StatefulWidget> createState() {
    return _GroupListState<T>();
  }
}

class _GroupListState<T> extends State<GroupListWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        final GroupListModel<T> groupListModel =
            ArrayHelper.get(widget.list, index)!;
        return _LevelOneListWidget<T>(
          item: groupListModel,
          padding: widget.padding,
          groupItemBuilder: widget.groupItemBuilder,
        );
      },
    );
  }
}

class _LevelOneListWidget<T> extends StatefulWidget {
  final GroupListModel<T> item;
  final GroupItemBuilder<T> groupItemBuilder;
  final EdgeInsetsGeometry? padding;

  const _LevelOneListWidget({required this.item, required this.groupItemBuilder, this.padding});

  @override
  State<StatefulWidget> createState() {
    return _LevelOneListState<T>();
  }
}

class _LevelOneListState<T> extends State<_LevelOneListWidget<T>>
    with SingleTickerProviderStateMixin {
  bool _isExpand = false;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        lowerBound: 0.0,
        upperBound: 0.25,
        vsync: this,
        duration: const Duration(milliseconds: 400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.only(left: 14, right: 14, top: 28, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              if (_animationController.isCompleted) {
                _isExpand = false;
                _animationController.reverse();
              } else {
                _isExpand = true;
                _animationController.reset();
                _animationController.forward();
              }
              setState(() {});
            },
            child: Row(
              children: [
                RotationTransition(
                  turns: _animationController,
                  child: Icon(Icons.arrow_right),
                ),
                Container(
                  child: Text('${widget.item.title ?? ''}'),
                ),
              ],
            ),
          ),
          RepaintBoundary(
            child: _levelTwoListWidget(),
          ),
        ],
      ),
    );
  }

  Widget _levelTwoListWidget() {
    if (_isExpand == false) {
      return Container();
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.item.children?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final T text = ArrayHelper.get(widget.item.children, index)!;
        return Container(
          margin: const EdgeInsets.only(left: 25),
          child: widget.groupItemBuilder(text),
        );
      },
    );
  }
}
