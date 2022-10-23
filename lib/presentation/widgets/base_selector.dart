import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_card.dart';

class BaseSelector extends StatefulWidget {
  final EdgeInsets margin;
  final List<String> values;
  final ValueChanged<String> onSelect;

  const BaseSelector({
    super.key,
    this.margin = EdgeInsets.zero,
    required this.values,
    required this.onSelect,
  });

  @override
  State<BaseSelector> createState() => _BaseSelectorState();
}

class _BaseSelectorState extends State<BaseSelector> {
  int selectedIndex = 0;

  Widget mapValues(String value) => Center(child: Text(value));

  void onSelect(int index) {
    setState(() => selectedIndex = index);
    widget.onSelect(widget.values[index]);
  }

  void showSelect(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: CupertinoPicker(
          itemExtent: 50,
          onSelectedItemChanged: onSelect,
          children: widget.values.map(mapValues).toList(),
        ),
      ),
    );
  }

  BorderRadius get radius => BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      onTap: () => showSelect(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.values[selectedIndex]),
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
