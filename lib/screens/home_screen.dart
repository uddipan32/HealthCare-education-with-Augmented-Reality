import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color_constants.dart';
import 'organs_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCardColor,
        centerTitle: true,
        title: Text("Healthcare Education Project - Group 2"),
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
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text("Categories",
                  style: GoogleFonts.roboto(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: kTextColor,
                    ),
                  ),
                ),
                Container(
                  height: deviceSize.height * .6,
                  padding: EdgeInsets.only(top:26, left: 28.0, right: 28.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(name:"Circulatory"),
                          CategoryCard(name: "Skeletal"),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryCard(name:"Respiratory"),
                            CategoryCard(name: "Digestive"),
                          ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryCard(name:"Urinary"),
                            CategoryCard(name: "Nervous"),
                          ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}

class CategoryCard extends StatelessWidget{
  final String name;
  CategoryCard({this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          OrgansScreen.routeName,
          arguments: name,
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
            Image(image:AssetImage("assets/images/$name.png"),color: Colors.white ,height: 70),
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