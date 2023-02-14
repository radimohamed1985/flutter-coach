import 'package:coach/services/coches.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _coach = Coaches();

    int tab_index = 0;

    return Stack(
      children: [
        DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Text('boxing'),
                    Text('kick boxing'),
                    Text('Swimming'),
                    Text('football'),
                  ],
                  onTap: (value) => setState(() {
                    tab_index = value;
                    print(value);
                  }),
                ),
              ),
              body: TabBarView(children: [
                sport(_coach, 1),
                sport(_coach, 2),
                sport(_coach, 3),
                sport(_coach, 4),

                // sport(_coach, tab_index),
                // sport(_coach, tab_index),
                // sport(_coach, tab_index),
              ]),
            ))
      ],
    );
  }

  FutureBuilder<dynamic> sport(Coaches _coach, int tab_index) {
    return FutureBuilder(
        future: _coach.getCoach(tab_index.toString()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: [
                  // Image.network("${snapshot.data[index]['image_url']}"),
                  Image.network("${snapshot.data[index]['url']}"),
                  // Image(
                  //     image:
                  //         NetworkImage("${snapshot.data[index]['image_url']}")),
                  // Text('${snapshot.data[index]['name']}'),
                  Text('${snapshot.data[index]['title']}'),
                ]);
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

//   sport(Coaches _coach, int tab_index) async {
//     return StreamBuilder(
//         stream: _coach.getCoach(tab_index.toString()),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Stack(children: [
//                   // Image.network("${snapshot.data[index]['image_url']}"),
//                   Image.network("${snapshot.data[index]['url']}"),
//                   // Image(
//                   //     image:
//                   //         NetworkImage("${snapshot.data[index]['image_url']}")),
//                   // Text('${snapshot.data[index]['name']}'),
//                   Text('${snapshot.data[index]['title']}'),
//                 ]);
//               },
//             );
//           } else {
//             return CircularProgressIndicator();
//           }
//         });
//   }
// }
