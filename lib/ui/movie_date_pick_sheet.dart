import 'dart:math' show max;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/week_date_picker.dart';
import 'package:provider/provider.dart';

class MovieDatePickSheet extends StatefulWidget {
  final index;
  static show(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListenableProvider.value(
          value: Provider.of<Movies>(context),
          child: MovieDatePickSheet(index),
        );
      },
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  MovieDatePickSheet(this.index);

  @override
  _MovieDatePickSheetState createState() => _MovieDatePickSheetState();
}

class _MovieDatePickSheetState extends State<MovieDatePickSheet> {
  Movie get movie => Provider.of<Movies>(context)[widget.index];
  Movie get movieNL => Provider.of<Movies>(context, listen: false)[widget.index];

  get titleStyle =>
      GoogleFonts.nunito(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold);

  get descriptionStyle => GoogleFonts.nunito(color: Colors.black87, fontSize: 11.0);

  @override
  Widget build(BuildContext context) {
    var posterThumb = Image(image: movie.poster.image, width: 105, height: 140);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        color: Colors.grey[50],
      ),
      padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 20,
              indent: MediaQuery.of(context).size.width / 2 - 80,
              endIndent: MediaQuery.of(context).size.width / 2 - 80,
              color: Colors.black,
              thickness: 2.0,
            ),
            Row(
              children: [
                // Poster Thumbnail
                ClipRRect(
                  child: posterThumb,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                // Movie Description
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(movie.name, style: titleStyle),
                        Text.rich(
                          TextSpan(
                              text: '${movie.genres}    ${movie.duration}',
                              style: descriptionStyle),
                        ),
                        Text('IMDb: ${movie.imdb}\n', style: descriptionStyle),
                        Text(
                          movie.description,
                          style: descriptionStyle,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
                // Week Date Picker
              ],
            ),
            WeekDatePicker(
              days: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
              dates: ['15', '16', '17', '18', '19', '20', '21'],
            )
          ],
        ),
      ),
    );
  }
}
