import 'package:flutter/material.dart';

class ExpansionPanelContent extends StatefulWidget {
  @override
  _ExpansionPanelContentState createState() => _ExpansionPanelContentState();
}

class _ExpansionPanelContentState extends State<ExpansionPanelContent> {
  final _items = List<PanelItem>.generate(3, (index) {
    return PanelItem('Title $index', 'Content $index');
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ExpansionPanelList(
              children: _items.map((item) {
                return ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: item.isExpanded,
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(item.headerText),
                        selected: item.isExpanded,
                      );
                    },
                    body: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      color: Colors.lightBlue,
                      child: Text(
                        item.contentText,
                      ),
                    ));
              }).toList(),
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _items[panelIndex].isExpanded = !isExpanded;
                });
              },
              animationDuration: kThemeAnimationDuration,
            ),
          ],
        ),
      ),
    );
  }
}

class PanelItem {
  final String headerText;
  final String contentText;
  bool isExpanded;

  PanelItem(this.headerText, this.contentText, {this.isExpanded = false});
}
