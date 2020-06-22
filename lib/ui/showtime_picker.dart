import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowtimePicker extends StatefulWidget {
  final String date;

  const ShowtimePicker({Key key, this.date}) : super(key: key);
  @override
  _ShowtimePickerState createState() => _ShowtimePickerState();
}

class _ShowtimePickerState extends State<ShowtimePicker> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    if (widget.date != null) _controller.forward();
  }

  @override
  void didUpdateWidget(ShowtimePicker oldWidget) {
    if (widget.date != null) {
      _controller.forward(from: 0.25);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              var opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  curve: Interval(0, 0.4, curve: Curves.easeOutCirc), parent: _controller));
              return Opacity(opacity: opacity.value, child: child);
            },
            child: Text(
              'Select Time',
              style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Wrap(
            children: [],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
