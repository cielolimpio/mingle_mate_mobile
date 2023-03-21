import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/constants/color.dart';

class MingleMateDropdown extends StatefulWidget {
  final List<String> options;
  String selectedOption;
  double height;
  double fontSize;


  MingleMateDropdown({
    Key? key,
    required this.options,
    this.selectedOption = 'initial',
    this.height = 50.0,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  State createState() => _MingleMateDropdownState();
}

class _MingleMateDropdownState extends State<MingleMateDropdown> {
  bool _showOverlay = false;
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapMainBox(),
      child: _getMainBox(),
    );
  }

  BorderSide borderSide = const BorderSide(
    color: Colors.grey,
    width: 1.5,
  );

  EdgeInsets edgeInsets = const EdgeInsets.only(left: 15.0, right: 10.0);

  _onTapMainBox() {
    if (!_showOverlay) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
    }
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  LayoutBuilder _getMainBox() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double parentWidth = constraints.maxWidth;
          return Container(
            width: parentWidth,
            height: widget.height,
            foregroundDecoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR,
                width: 2.0,
              ),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10)
              ),
            ),
            child: Padding(
              padding: edgeInsets,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.selectedOption,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: widget.fontSize,
                      ),
                    ),
                    Icon(
                      _showOverlay ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: PRIMARY_COLOR,
                    )
                  ]
              ),
            ),
          );
        }
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + renderBox.size.height,
        width: renderBox.size.width,
        height: renderBox.size.height * 4,
        child: Material(
          child: Container(
            foregroundDecoration: BoxDecoration(
                border: Border.fromBorderSide(borderSide),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10))
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: _getOverlayEntryElement(index),
                  onTap: () => _onTapOverlayList(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onSelectOption(String option) {
    setState(() {
      widget.selectedOption = option;
      _showOverlay = !_showOverlay;
    });
  }

  void _onTapOverlayList(int index) {
    _overlayEntry?.remove();
    _onSelectOption(widget.options[index]);
  }

  Container _getOverlayEntryElement(int index) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.selectedOption == widget.options[index]
              ? PRIMARY_COLOR
              : Colors.transparent,
          border: _getBorder(index),
      ),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: edgeInsets,
        child: Text(
          widget.options[index],
          style: TextStyle(
            color: widget.selectedOption == widget.options[index]
                ? Colors.white
                : Colors.black87,
            fontSize: widget.fontSize,
          ),
        ),
      ),
    );
  }

  BoxBorder _getBorder(int index) {
    if (index == widget.options.length - 1) {
      return const Border();
    }
    else {
      return Border(
        bottom: borderSide,
      );
    }
  }
}