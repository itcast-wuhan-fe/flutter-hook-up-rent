class InfoItem {
  final String title;
  final String imageUri;
  final String source;
  final String time;
  final String navigateUri;
  const InfoItem({this.title, this.imageUri,this.source,this.time, this.navigateUri});
}

const List<InfoItem> infoData = [
  const InfoItem(
      title:'置业选择 | 安贞西里 三室一厅 河间的古雅别院', 
      imageUri:'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l4obbj305v04fjsw.jpg', 
      source:"新华网" ,
      time:"两天前",
      navigateUri:'login'
      ),
  const InfoItem(
      title:'置业佳选 | 大理王宫 苍山洱海间的古雅别院', 
      imageUri:'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l6hnsj305v04fab7.jpg', 
      source:"新华网" ,
      time:"一周前",
      navigateUri:'login'
      ),
  const InfoItem(
      title:'置业选择 | 安居小屋 花园洋房 清新别野', 
      imageUri:'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg', 
      source:"新华网" ,
      time:"一周前",
      navigateUri:'login'
      ),
];