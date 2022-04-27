import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/color_constants.dart';

import '../providers/organs.dart';
import 'camera_screen.dart';

class OrgansScreen extends StatefulWidget{
  static const routeName = '/organs';

  @override
  _OrgansScreenState createState() => _OrgansScreenState();
}

class _OrgansScreenState extends State<OrgansScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final category = ModalRoute.of(context).settings.arguments as String;
    final organs = Provider.of<Organs>(context).getOrgansByCat(category);
    print(organs.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCardColor,
        centerTitle: true,
        title: Text(category),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3.75),
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 35),
                decoration: BoxDecoration(
                  color: kSearchBoxColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 14.5,
                      ),
                      hintText: "Search here ...",
                      prefixIcon: Icon(Icons.search, color: kTextColor),
                      border: InputBorder.none,
                      fillColor: kShadowColor,
                    ),
                    onTap: (){
                      // Navigator.of(context).pushNamed(
                      //   SearchScreen.routeName.
                      // );
                    }
                ),
              ),
              Container(
                height: deviceSize.height*.8,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3/2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                  ),
                  padding: EdgeInsets.only(left: 16, right: 16),
                  itemCount: organs.length,
                    itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
                        value: organs[i],
                    child: OrganCard(id: organs[i].id,name: organs[i].name),
                    ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OrganCard extends StatelessWidget{
  final String id;
  final String name;

  OrganCard({this.id,this.name});
  @override
  Widget build(BuildContext context) {
    print(name);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          CameraScreen.routeName,
          arguments: id,
        );
      },
      child: Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: kShadowColor,
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(8.0,8.0)
            )
          ],
          borderRadius: BorderRadius.circular(15),
          color: kCardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image(image:AssetImage("assets/images/$id.png"),color: Colors.white ,height: 70),
            SizedBox(height:9),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}