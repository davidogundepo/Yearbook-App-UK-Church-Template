import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_church.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../thrown_searches/choir_thrown_search.dart';
import '../api/choir_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/choir_details_page.dart';
import '../notifier/choir_notifier.dart';


String churchName = "AAB Church";
String thrownName = "Choristers";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $churchName";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/c_landing_1.jpeg";


Color backgroundColor = Color.fromRGBO(36, 120, 129, 1);
Color appBarBackgroundColor = Color.fromRGBO(36, 120, 129, 1);
Color appBarTextColor = Colors.white;
Color appBarIconColor = Colors.white;
Color modalColor = Colors.transparent;
Color modalBackgroundColor = Color.fromRGBO(36, 120, 129, 1);
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Color.fromRGBO(36, 120, 129, 1);
Color splashColorTwo = Colors.black87;
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(36, 120, 129, 1);
Color borderColor = Colors.black;

class MyChoirPage extends StatefulWidget with NavigationStates{
  MyChoirPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyChoirPage createState() => _MyChoirPage();
}

class _MyChoirPage extends State<MyChoirPage> {

  Widget _buildProductItem(BuildContext context, int index) {
    ChoirNotifier choirNotifier = Provider.of<ChoirNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              choirNotifier.currentChoir = choirNotifier.choirList[index];
              navigateToChoirDetailsPage(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                choirNotifier.choirList[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  choirNotifier.choirList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600
                                  )
                              ),
                              SizedBox(width: 10),
                              Icon (
                                MdiIcons.shieldCheck,
                                color: iconColor,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              choirNotifier.choirList[index].staffPosition,
                              style: GoogleFonts.tenorSans(
                                  color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic
                              )
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: backgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToChoirDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChoirDetailsPage()));
  }

  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutSchoolDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => aboutChurchDetails()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  @override
  void initState() {
    ChoirNotifier choirNotifier = Provider.of<ChoirNotifier>(context, listen: false);
    getChoir(choirNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ChoirNotifier choirNotifier = Provider.of<ChoirNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,

          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: modalColor,
                            context: context,
                            builder: (context) => Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: modalBackgroundColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColorTwo,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom,
                                          color: iconColor),
                                          title: new Text(whoWeAre,
                                          style: GoogleFonts.zillaSlab(
                                            color: textColor
                                          ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen,
                                          color: iconColor),
                                        title: new Text(aboutSchool,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),),
                                        onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutSchoolDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending,
                                            color: iconColor),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity,
                                          color: iconColor),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),),
                                        onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutAppDetailsPage(context);
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: choirNotifier.choirList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyChoirSearch(all: choirNotifier.choirList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Center(
                        heightFactor: 0.6,
                        child: Text(thrownName,
                            style: GoogleFonts.abel(
                              color: textColor,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                      background: Image.asset(imgAsset,
                      fit: BoxFit.cover,)
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: choirNotifier.choirList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
