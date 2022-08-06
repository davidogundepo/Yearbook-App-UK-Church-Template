
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/church_arial_images_api.dart';
import '../api/achievement_images_api.dart';
import '../notifier/church_arial_notifier.dart';
import '../notifier/achievement_images_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pie_chart/pie_chart.dart';


String churchName = "AAB Church";
String aboutChurch = "About $churchName";

String visionSwipe = "Swipe left on 'OUR VISION STATEMENT'  >>>";
String visionTitle = "OUR VISION STATEMENT";
String visionStatement = "Raising the total livelihood through comprehensive christian structure.";
String missionTitle = "OUR MISSION STATEMENT";
String missionStatement = "Mobilizing Moral, Social, and Religious tools, by dedicated and vision driven congregation in a proactive environment of pastoral and learning, which is geared towards impacting and equipping our members to be THE TOTAL YOUTH the world will be proud of.";

String coreValues = "OUR CORE VALUES";
String cvStatement1 = "1. We are dedicated to the success of each members \n\n";
String cvStatement2 = "2. We provide church as well as hope for the future\n\n";
String cvStatement3 = "3. We are genuinely interested in deploying the full capacity of each members.\n\n";
String cvStatement4 = "4. We create a social atmosphere for members and we believe everyone can excel.";

String whyChurch = "WHY $churchName?".toUpperCase();
String whyChurchStatement = "$churchName was established on the 3rd of October 2015 out of the vision and passion of Dr. Edwin Greaves to empower today’s youth for tomorrows challenges.\n\nWe offer members (both domestic and international) the opportunity to earn an unparalleled high-quality spiritual experience. With passionate and  qualified pastoral staff, a clean and caring church atmosphere, and the resources to supply members with the skills necessary for their continued personal success, our church looks to help members to realize their potential.";
String staffBody = "Staff Body\n\n";
String staffBodyStatement = "We have 12 pastoral staff and 32 non-pastoral staff (including management body) in $churchName.";
String populationChart = "$churchName Population Chart";
String membersBody = "Members Body\n\n";
String membersBodyStatement = "We currently have 206 members in $churchName, 61 male members and 145 female members.";
String membersPopulationChart = "$churchName Members Population Chart";

String standardSwipe = "Swipe up for all Church exercises offered";
String standardsOffered = "Some of the church exercises provided in $churchName are:\n\n";
String standardsOffered1 = "1. Physiological needs\n";
String standardsOffered2 = "2. Safety driven\n";
String standardsOffered3 = "3. Social driven\n";
String standardsOffered4 = "4. Esteem driven\n";
String standardsOffered5 = "5. Evident person-centred ministrations\n";
String standardsOffered6 = "6. A Homely Environment\n";
String standardsOffered7 = "7. Efficient Communication\n";
String standardsOffered8 = "8. Happy and responsible congregations\n";
String standardsOffered9 = "9. Toilet Mobility to aid relief\n";
String standardsOffered10 = "10. Appealing and tasty foods.\n\n";


String extraCurricularActs = "Extra-curricular Activities offered in $churchName\n\n";
String extraCurricularActsStatement1 = "1. Evangelism\n";
String extraCurricularActsStatement2 = "2. Annual Praise week\n";
String extraCurricularActsStatement3 = "3. Children classes and grooming\n";
String extraCurricularActsStatement4 = "4. Easter celebrations and Christmas celebrations\n";

String churchArialViewsSwipe = "Swipe left or right for more photos";
String churchArialViews = "Some Arial views of $churchName";
String churchAchievementsSwipe = "Swipe left or right for more photos";
String churchAchievements = "Some of our achievements";
String moreInfoAboutChurch = "For more information about $churchName please trust and click me";
String moreInfoAboutChurchURL = "https://rccghgz.uk/";

double maleMembersPopulation = 61;
double femaleMembersPopulation = 145;
double pastoralStaffPopulation = 12;
double nonPastoralStaffPopulation = 32;


Color backgroundColor = Color.fromRGBO(78, 78, 136, 1.0);
Color cardBackgroundColor = Color.fromRGBO(105, 105, 181, 1.0);
Color appBarIconColor = Colors.white;
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(78, 78, 136, 1.0);
Color cardTextColor = Colors.white;
Color cardColor = Color.fromRGBO(105, 105, 181, 1.0);
Color boxDecorationColor = Color.fromRGBO(105, 105, 181, 1.0);
Color chartBackgroundColor = Color.fromRGBO(28, 26, 26, 1.0);
Color materialColor = Colors.transparent;
Color textColor = Colors.white;
Color firstChurchChartColor = Color.fromRGBO(65, 65, 93, 1.0);
Color secondChurchChartColor = Color.fromRGBO(141, 141, 186, 1.0);
Color thirdChurchChartColor = Color.fromRGBO(105, 105, 181, 1.0);
Color fourthChurchChartColor = Color.fromRGBO(87, 87, 117, 1.0);
Color firstMembersChartColor = Color.fromRGBO(65, 65, 93, 1.0);
Color secondMembersChartColor = Color.fromRGBO(141, 141, 186, 1.0);


class aboutChurchDetails extends StatefulWidget {

  aboutChurchDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _aboutChurchDetailsState createState() => _aboutChurchDetailsState();
}

class _aboutChurchDetailsState extends State<aboutChurchDetails> {

  final controlla = PageController(
    initialPage: 0,
  );

  var scrollDirection = Axis.horizontal;


  @override
  void initState() {
    ChurchArialNotifier churchArialNotifier = Provider.of<ChurchArialNotifier>(context, listen: false);
    getChurchArial(churchArialNotifier);

    AchievementsNotifier achievementsNotifier = Provider.of<AchievementsNotifier>(context, listen: false);
    getAchievements(achievementsNotifier);

    churchMap.putIfAbsent("Male Congregations", () => 61);
    churchMap.putIfAbsent("Female Congregations", () => 145);
    churchMap.putIfAbsent("Pastoral Staff", () => 12);
    churchMap.putIfAbsent("Non Pastoral Staff", () => 32);

    membersMap.putIfAbsent("Male Congregations", () => 61);
    membersMap.putIfAbsent("Female Congregations", () => 145);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ChurchArialNotifier churchArialNotifier = Provider.of<ChurchArialNotifier>(context);
    AchievementsNotifier achievementsNotifier = Provider.of<AchievementsNotifier>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(aboutChurch,
          style: TextStyle(
            color: appBarIconColor
          )
        ),
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(visionSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 500,
              child: PageView(
                controller: controlla,
                scrollDirection: scrollDirection,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin: EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    visionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                visionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    missionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                missionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    coreValues,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: cvStatement1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement2,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement3,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement4,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    whyChurch,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                whyChurchStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: staffBody,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: staffBodyStatement,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: Text(populationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: churchMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 42,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: churchColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: cardTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: textColor.withOpacity(0.9),
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: membersBody,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: membersBodyStatement,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 370,
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: Text(membersPopulationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: membersMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 42,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: membersColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: cardTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: textColor.withOpacity(0.9),
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(standardsOffered,
                style: TextStyle(
                    fontSize: 20,
                    color: cardTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(standardSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: standardsOffered,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered5,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered6,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered7,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered8,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered9,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: standardsOffered10,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: extraCurricularActs,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(churchArialViews,
              style: TextStyle(
                fontSize: 20,
                color: cardTextColor,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(churchArialViewsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: churchArialNotifier.churchArialList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  churchArialNotifier.churchArialList[index]
                                      .image
                              ),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: cardColor
                        ),
                        child: ListTile(
                          title: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                churchArialNotifier.churchArialList[index]
                                    .toastName,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(churchAchievements,
              style: TextStyle(
                fontSize: 20,
                color: cardTextColor,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(churchArialViewsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: achievementsNotifier.achievementsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          image: DecorationImage(
//                            colorFilter: ColorFilter.linearToSrgbGamma(),
                            image: CachedNetworkImageProvider(
                                achievementsNotifier.achievementsList[index].image
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          color: cardColor
                        ),
                        child: ListTile(
                          title: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                achievementsNotifier.achievementsList[index].toastName,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemWidth: 350,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, top: 20),
              child: RichText(
                text: TextSpan(
                  text: moreInfoAboutChurch,
                  style: TextStyle(
                    fontSize: 17,
                    color: cardTextColor,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    launch(moreInfoAboutChurchURL);
                  }
                ),
              )
            ),

          ],
        ),
      ),
    );

  }
}

class ChurchMembersPopulation{
  String x;
  double y;
  ChurchMembersPopulation(this.x,this.y);
}

dynamic getMembersPopulationData(){
  List<ChurchMembersPopulation> membersPopulationData = <ChurchMembersPopulation>[
    ChurchMembersPopulation('Male Members', maleMembersPopulation),
    ChurchMembersPopulation('Female Members', femaleMembersPopulation),
  ];
  return membersPopulationData;
}

class ChurchPopulation{
  String x;
  double y;
  ChurchPopulation(this.x,this.y);
}

dynamic getChurchPopulationData(){
  List<ChurchPopulation> churchPopulationData = <ChurchPopulation>[
    ChurchPopulation('Male Members', maleMembersPopulation),
    ChurchPopulation('Female Members', femaleMembersPopulation),
    ChurchPopulation('Pastoral Staff', pastoralStaffPopulation),
    ChurchPopulation('Non Pastoral Staff', nonPastoralStaffPopulation),
  ];
  return churchPopulationData;
}


bool toggle = false;
Map<String, double> churchMap = Map();

Map<String, double> membersMap = Map();

List<Color> churchColorList = [
  firstChurchChartColor,
  secondChurchChartColor,
  thirdChurchChartColor,
  fourthChurchChartColor,
];

List<Color> membersColorList = [
  firstMembersChartColor,
  secondMembersChartColor,
];