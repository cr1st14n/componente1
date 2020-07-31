import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.flpb2-2.fna.fbcdn.net/v/t31.0-8/s960x960/13767377_10154363872736543_672179801977189739_o.jpg?_nc_cat=1&_nc_sid=85a577&_nc_ohc=GsrpL0yxlTcAX-cNpjg&_nc_ht=scontent.flpb2-2.fna&_nc_tp=7&oh=6d12f7cab2221a1fa7e93f692e69d06d&oe=5F45D9F2'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200), 
            image: NetworkImage('https://hipertextual.com/files/2019/04/hipertextual-avengers-endgame-contiene-ultimo-cameo-stan-lee-2019632812-scaled.jpg')
          ),
      ),
    );
  }
}
