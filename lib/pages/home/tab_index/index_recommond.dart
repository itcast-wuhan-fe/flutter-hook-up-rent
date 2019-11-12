import 'package:flutter/material.dart';

import 'index_recommond_data.dart';
import 'index_recommond_item_widget.dart';

class IndexRecommond extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexRecommond({Key key, this.dataList = indexRecommendData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Color(0x08000000)),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text('房屋推荐',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          Text('更多',style: TextStyle(color: Colors.black54),),

        ],),
        Padding(padding: EdgeInsets.all(5),),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: dataList.map((item)=>IndexRecommondItemWidget(item)
          
        ).toList()),
      ],),
    );
  }
}
