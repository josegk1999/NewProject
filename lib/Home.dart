import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'constants.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 36),
          height: size.height * 0.2 - 27,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)),
          ),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/images/logocircle.png",
                width: 60,
                height: 80,
                fit: BoxFit.contain,
                color: Colors.white,
                colorBlendMode: BlendMode.darken,
                semanticLabel: "Logo",
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Feed",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.add),
                iconSize: 30,
                color: Colors.black,
                splashColor: Colors.purple,
                onPressed: (){},),
              IconButton(icon: Icon(Icons.mail),
                iconSize: 30,
                color: Colors.black,
                splashColor: Colors.purple,
                onPressed: (){},),
            ],
          ),
        ),
        Positioned(
            top: 115,
            left: 10,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Chip(label: Text("#Trending",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,shape: StadiumBorder(side: BorderSide(color: Colors.red),),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Chip(label: Text("#Food"),backgroundColor: Colors.transparent,shape: StadiumBorder(side: BorderSide(color: Colors.red),),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Chip(label: Text("#Activity"),backgroundColor: Colors.transparent,shape: StadiumBorder(side: BorderSide(color: Colors.red),),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Chip(label: Text("#SHAPE"),backgroundColor: Colors.transparent,shape: StadiumBorder(side: BorderSide(color: Colors.red),),),
                ),
              ],
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 165.0),
              child: SingleChildScrollView(
                child: Container(
                  child: StaggeredGridView.count(crossAxisCount: 4,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                    children: List.generate(10, (int i) {return _Tile(i);},),
                    staggeredTiles: List.generate(10, (int index) {return StaggeredTile.fit(2);}),),
                ),
              ),
            ),
            ],
          ),
        );
  }
}

class _Tile extends StatelessWidget {
  _Tile(this.i);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10),),
          child: Image.asset("assets/images/$i.jpg", colorBlendMode: BlendMode.darken,)),
    );
  }

}
