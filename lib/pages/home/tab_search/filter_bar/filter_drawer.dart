import 'package:flutter/material.dart';
import 'package:hook_up_rent/models/general_type.dart';

import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    var roomTypeList = dataList['roomTypeList'];
    var orientedList = dataList['orientedList'];
    var floorList = dataList['floorList'];

    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(val);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            CommonTitle('户型'),
            FilterDrawerItem(
              list: roomTypeList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            CommonTitle('朝向'),
            FilterDrawerItem(
              list: orientedList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            CommonTitle('楼层'),
            FilterDrawerItem(
              list: floorList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;

  const FilterDrawerItem({Key key, this.list, this.selectedIds, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list.map((item) {
          var isActive = selectedIds.contains(item.id);
          return GestureDetector(
              onTap: () {
                if (onChange != null) onChange(item.id);
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 100.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: isActive ? Colors.green : Colors.white,
                    border: Border.all(width: 1.0, color: Colors.green)),
                child: Center(
                  child: Text(
                    item.name,
                    style: TextStyle(
                        color: isActive ? Colors.white : Colors.green),
                  ),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
