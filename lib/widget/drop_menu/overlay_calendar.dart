import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:transaction_plus/utils/log_utils.dart';

import 'some_normal.dart';

class OverlayCalendar extends StatefulWidget {
  String initValue;
  void Function()? onChange;
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

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    Log.info(args.value);
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        closeOverlay();
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
        closeOverlay();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
        closeOverlay();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlay();
        Overlay.of(context)?.insert(_overlayEntry!);
        _hasOverlay = true;
      } else {
        closeOverlay();
      }
      setState(() {});
    });
    _setText();
  }

  void _setText() {
    _controller = TextEditingController(text: widget.initValue);
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant OverlayCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initValue != oldWidget.initValue) {
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
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                child: SfDateRangePicker(
                  showNavigationArrow: true,
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  maxDate: DateTime.now(),
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
                      EdgeInsets.symmetric(vertical: 0, horizontal: 3),
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
