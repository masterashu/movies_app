import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekDatePicker extends StatefulWidget {
  final List<String> days;
  final List<String> dates;

  WeekDatePicker({
    @required this.days,
    @required this.dates,
  }) : assert(days.length == dates.length);

  @override
  _WeekDatePickerState createState() => _WeekDatePickerState();
}

class _WeekDatePickerState extends State<WeekDatePicker> with TickerProviderStateMixin {
  int selected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              for (var i = 0; i < widget.days.length; i++)
                Text(
                  widget.days[i],
                  style: GoogleFonts.nunito(),
                ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Row(
            children: [
              for (var i = 0; i < widget.days.length; i++)
                (i == selected)
                    ? Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red[800],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              offset: Offset(1.0, 1.0),
                            )
                          ],
                        ),
                        child: Text(
                          widget.dates[i],
                          style: GoogleFonts.nunito(fontSize: 14.0, color: Colors.white),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = i;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200],
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(1.0, 1.0),
                                )
                              ]),
                          child: Text(
                            widget.dates[i],
                            style: GoogleFonts.nunito(fontSize: 16.0),
                          ),
                        ),
                      ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
