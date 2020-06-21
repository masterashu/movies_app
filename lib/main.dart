import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Flutter Demo',
      color: Colors.grey[850],
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return MaterialPageRoute<T>(settings: settings, builder: builder);
      },
      home: ChangeNotifierProvider(
          create: (_) => Movies(<Movie>[
                Movie(
                  "Movie1",
                  "assets/lion-king-poster.jpg",
                  "assets/lion-king-logo.png",
                  r'-FDuSQ~9E3Ipso%004M}NHM|xZ%0^ioe$%xZNHR+E3xY%0%0oeIpE3E3j]t6WBWB%0-nxsoefkWCIWM|V[oLofoextoyoJn%jZbH',
                ),
                Movie(
                  "Movie2",
                  "assets/aladdin-poster.jpg",
                  "assets/aladdin-logo.png",
                  r'-OFE+$?sxuRoIqWG.7~8=|o#R-NIVur;xm-n%LozDlE4s*%0%Jox0#rxnTWAoafz^ONfEMVsRjs.WroexHR:V]V@j;n$W=oJjvs:',
                ),
                Movie(
                  "Movie3",
                  "assets/captain-marvel-poster.jpg",
                  "assets/captain-marvel-logo.png",
                  r'-8IWTj1805tk00t*=oNN0Kv{%g^i0J^Q1#-B~qR6JDIn=|%3R%0f00%0=?M{}tR4E.t4?GRPROxwHrInabbFyDTfXA$*ShXnogSh',
                ),
              ]),
          lazy: false,
          child: HomePage()),
    );
  }
}
