import 'package:example/all_mdil_icons.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:mdil/mdil_icons.dart';

import 'all_mdi_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(icon: Icon(MDI.xml), label: 'MD icons'),
          BottomNavigationBarItem(
              icon: Icon(MDIL.xml), label: 'MD icons Light'),
        ],
        onTap: (newValue) {
          _pageController.jumpToPage(newValue);
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MDL Icons"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double screenWidth = constraints.maxWidth;
          const double itemWidth = 100;
          final int crossAxisCount = (screenWidth / itemWidth).floor();

          return PageView(
            controller: _pageController,
            onPageChanged: (newPage) {
              setState(() {
                _page = newPage;
              });
            },
            children: [
              MDICollection(crossAxisCount: crossAxisCount),
              MDILCollection(crossAxisCount: crossAxisCount)
            ],
          );
        },
      ),
    );
  }
}

class MDICollection extends StatefulWidget {
  final int crossAxisCount;

  const MDICollection({super.key, required this.crossAxisCount});

  @override
  State<MDICollection> createState() => _MDICollectionState();
}

class _MDICollectionState extends State<MDICollection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        var borderRadius = BorderRadius.circular(8);
        var name = mdiIconsNames[index];
        var icon = mdiIcons[index];
        return Hero(
          tag: name,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            margin: EdgeInsets.zero,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) =>
                            IconViewer(icon: icon, name: name),
                        opaque: false));
              },
              child: GridTile(
                footer: Text(
                  name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                child: Icon(icon),
              ),
            ),
          ),
        );
      },
      itemCount: mdiIcons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MDILCollection extends StatefulWidget {
  final int crossAxisCount;

  const MDILCollection({super.key, required this.crossAxisCount});

  @override
  State<MDILCollection> createState() => _MDILCollectionState();
}

class _MDILCollectionState extends State<MDILCollection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        var borderRadius = BorderRadius.circular(8);
        var name = mdilIconsNames[index];
        var icon = mdilIcons[index];
        return Hero(
          tag: name,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            margin: EdgeInsets.zero,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) =>
                            IconViewer(icon: icon, name: name),
                        opaque: false));
              },
              child: GridTile(
                footer: Text(
                  name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                child: Icon(icon),
              ),
            ),
          ),
        );
      },
      itemCount: mdiIcons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class IconViewer extends StatelessWidget {
  final IconData icon;
  final String name;

  const IconViewer({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Material(
        color: Colors.black26,
        child: Center(
          child: Hero(
            tag: name,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(icon
                          .toString()
                          .replaceAll('IconData', '')
                          .replaceAll('(', '')
                          .replaceAll(')', '')),
                      const SizedBox(height: 16),
                      Icon(icon, size: 45),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
