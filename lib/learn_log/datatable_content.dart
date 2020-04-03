import 'package:flutter/material.dart';

class DataTableContent extends StatefulWidget {
  @override
  _DataTableContentState createState() => _DataTableContentState();
}

class _DataTableContentState extends State<DataTableContent> {
  final _models = List<DataModel>.generate(
      20,
      (index) => DataModel(
          'Title $index',
          'Author $index',
          index.isOdd
              ? 'https://hbimg.huabanimg.com/05c66011aba7c3078f2c4a40ba8cd0b2b1b550e95c0a6d-gRwEfB_fw658'
              : 'https://hbimg.huabanimg.com/8fd76349484f6717ac02daae564384e633dab0be252be-BdvKdP_fw658'));

  bool _ascending = true;
  int _sortIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: DataTable(
          sortAscending: _ascending,
          sortColumnIndex: _sortIndex,
          columns: [
            DataColumn(
                label: Text('Title'),
                onSort: (index, ascending) {
                  setState(() {
                    _sortIndex = index;
                    _ascending = ascending;
                    _ascending
                        ? _models.sort((x, y) => x.title.compareTo(y.title))
                        : _models.sort((x, y) => y.title.compareTo(x.title));
                  });
                }),
            DataColumn(
                label: Text('Author'),
                onSort: (index, ascending) {
                  setState(() {
                    _sortIndex = index;
                    _ascending = ascending;
                    _ascending
                        ? _models.sort((x, y) => x.author.compareTo(y.author))
                        : _models.sort((x, y) => y.author.compareTo(x.author));
                  });
                }),
            DataColumn(label: Text('Image'))
          ],
          dataRowHeight: 88,
          rows: _models
              .map((item) => DataRow(
                      cells: [
                        DataCell(Text(item.title)),
                        DataCell(Text(item.author)),
                        DataCell(Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            item.imageUrl,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ))
                      ],
                      selected: item.selected,
                      onSelectChanged: (value) {
                        if (item.selected != value) {
                          setState(() {
                            item.selected = value;
                          });
                        }
                      }))
              .toList(),
        ),
      ),
    );
  }
}

class DataModel {
  final String title;
  final String author;
  final String imageUrl;
  bool selected = false;

  DataModel(this.title, this.author, this.imageUrl);
}
