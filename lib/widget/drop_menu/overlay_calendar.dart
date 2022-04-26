import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:transaction_plus/utils/datetime_utils.dart';
import 'package:transaction_plus/utils/log_utils.dart';

import 'some_normal.dart';

class OverlayCalendar extends StatefulWidget {
  String initValue;
  void Function(DateRangePickerSelectionChangedArgs value)? onChange;
  double maxHeight;
  Decoration? decoration;
  TextStyle? textStyle;

  OverlayCalendar({
    Key? key,
    required this.initValue,
    this.maxHeight = 40,
    this.decoration,
    this.textStyle,
    this.onChange,
  }) : super(key: key);

  @override
  _OverlayCalendarState createState() => _OverlayCalendarState();
}

class _OverlayCalendarState extends State<OverlayCalendar> {
  final FocusNode _focusNode = FocusNode();

  OverlayEntry? _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  bool _hasOverlay = false;
  late TextEditingController _controller;
  DateRangePickerController _dateRangePickerController = DateRangePickerController();

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    Log.info(args.value);
    widget.onChange?.call(args);
    closeOverlay();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlay();
        Overlay.of(context)?.insert(_overlayEntry!);
        _hasOverlay = true;
      }
      setState(() {});
    });
    _setText();
  }

  void _setText() {
    Log.info(widget.initValue);
    _dateRangePickerController.selectedDate = DateTime.parse(widget.initValue);
    _controller = TextEditingController(text: widget.initValue);
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant OverlayCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (this.widget.initValue != oldWidget.initValue) {
      _setText();
    }
  }

  OverlayEntry _createOverlay() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;

    return OverlayEntry(
      builder: (BuildContext context) => Positioned(
        width: 300,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 4.0),
          child: Material(
            elevation: 4,
            child: RepaintBoundary(
              child: MouseRegion(
                onExit: (_) {
                  closeOverlay();
                },
                child: SfDateRangePicker(
                  showNavigationArrow: true,
                  controller: _dateRangePickerController,
                  onSelectionChanged: _onSelectionChanged,
                  onViewChanged: (a) {
                    Log.info(a.view);
                    _focusNode.unfocus();
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                  maxDate: DateTime.now(),
                  minDate: DateTime.utc(2000),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void closeOverlay() {
    if (_hasOverlay) {
      Log.info('close');
      _overlayEntry!.remove();
      _focusNode.unfocus();
      setState(() {
        _hasOverlay = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        decoration: widget.decoration ?? NormalInput.normal,
        padding: const EdgeInsets.only(right: 4),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                readOnly: true,
                focusNode: _focusNode,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00ffffff),
                      width: 0.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00ffffff),
                      width: 0.0,
                    ),
                  ),
                ),
                style: widget.textStyle,
                onChanged: (String value) {},
              ),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).requestFocus(_focusNode);
              },
              child: const Icon(
                Icons.calendar_month,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry!.dispose();
    }

    _focusNode.removeListener(() {
      if (_focusNode.hasFocus)
        _createOverlay();
      else
        closeOverlay();
    });
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}
