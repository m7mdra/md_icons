import 'package:example/all_mdil_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mdi/mdi.dart';
import 'package:mdil/mdil.dart';

import 'all_mdi_icons.dart';

void main() {
  runApp(const MyApp());
}

//
//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
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

  final _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
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
      body: SafeArea(
        child: LayoutBuilder(
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
    var scrollController = ScrollController();
    return Scrollbar(
      controller: scrollController,
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          var borderRadius = BorderRadius.circular(8);
          var name = mdiIconsNames[index];
          var icon = mdiIcons[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            margin: EdgeInsets.zero,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => IconViewerModal(
                    icon: icon,
                    name: name,
                    mdi: true,
                  ),
                );
              },
              child: GridTile(
                header: Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
                ),
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 40,
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
      ),
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
    var scrollController = ScrollController();
    return Scrollbar(
      controller: scrollController,
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          var borderRadius = BorderRadius.circular(8);
          var name = mdilIconsNames[index];
          var icon = mdilIcons[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            margin: EdgeInsets.zero,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => IconViewerModal(
                          icon: icon,
                          name: name,
                          mdi: false,
                        ));
              },
              child: GridTile(
                header: Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
                ),
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 40,
                ),
              ),
            ),
          );
        },
        itemCount: mdilIcons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class IconViewerModal extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool mdi;

  const IconViewerModal({
    super.key,
    required this.icon,
    required this.name,
    this.mdi = true,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50),
              const SizedBox(height: 8),
              Text(
                name,
                maxLines: 3,
                style: textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                icon
                    .toString()
                    .replaceAll('IconData', '')
                    .replaceAll('(', '')
                    .replaceAll(')', ''),
                style: textTheme.labelSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Usage: ',
                style:
                    textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (mdi)
                Column(
                  children: [
                    Markdown(data: '''```
Icon(MDI.$name);''', shrinkWrap: true),
                    const SizedBox(height: 4),
                    Text(
                      'OR',
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Markdown(data: '''```
Icon(MDIcons.$name);''', shrinkWrap: true),
                    const SizedBox(height: 4),
                    Text(
                      'OR',
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Markdown(data: '''```
Icon(MaterialDesignIconsLight.$name);''', shrinkWrap: true),
                  ],
                )
              else
                Column(
                  children: [
                    Markdown(
                      data: '''```
Icon(MDIL.$name);''',
                      shrinkWrap: true,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'OR',
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Markdown(data: '''```
Icon(MDILight.$name);''', shrinkWrap: true),
                    const SizedBox(height: 4),
                    Text(
                      'OR',
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Markdown(data: '''```
Icon(MaterialDesignIconsLight.$name);''', shrinkWrap: true),
                  ],
                ),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
