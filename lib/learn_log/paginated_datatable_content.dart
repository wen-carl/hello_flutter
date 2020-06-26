import 'package:flutter/material.dart';

import 'datatable_content.dart';

class PaginatedDataTableContent extends StatefulWidget {
  @override
  _PaginatedDataTableContentState createState() =>
      _PaginatedDataTableContentState();
}

class _PaginatedDataTableContentState extends State<PaginatedDataTableContent> {
  var _models = List<DataModel>.generate(
      20,
      (index) => DataModel(
          'Title $index',
          'Author $index',
          index.isOdd
              ? 'https://hbimg.huabanimg.com/05c66011aba7c3078f2c4a40ba8cd0b2b1b550e95c0a6d-gRwEfB_fw658'
              : 'https://hbimg.huabanimg.com/8fd76349484f6717ac02daae564384e633dab0be252be-BdvKdP_fw658'));
  bool _ascending = true;
  int _sortIndex = 0;
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: PaginatedDataTable(
        sortAscending: _ascending,
        sortColumnIndex: _sortIndex,
        header: Text('第$_currentPage页'),
        rowsPerPage: 5,
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
        source: ModelDataSource(_models, onSelectChanged: (model, value) {
          if (model.selected != value) {
            setState(() {
              model.selected = value;
            });
          }
        }),
        initialFirstRowIndex: 0,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index ~/ 5 + 1;
          });
        },
      ),
    );
  }
}

typedef ValueChanged<M, T> = void Function(M model, T value);

class ModelDataSource extends DataTableSource {
  ValueChanged<DataModel, bool> onSelectChanged;
  List models;
  ModelDataSource(this.models, {this.onSelectChanged});

  @override
  DataRow getRow(int index) {
    var item = models[index];
    return DataRow.byIndex(
        index: index,
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
          onSelectChanged(item, value);
        });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => models.length;

  @override
  int get selectedRowCount => models.where((x) => x.selected).length;
}
