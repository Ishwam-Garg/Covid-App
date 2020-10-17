import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String  state = "Choose State";


  List<String> States = ["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chhattisgarh","Goa","Gujarat",
    "Haryana","Himachal Pradesh","Jharkand","Karnataka","Kerela","Madhya Pradesh","Maharashtra","Manipur","Meghalaya",
    "Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Tripura","Uttar Pradesh",
    "Uttarakhand","West Bengal"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40,top: 50,right: 20),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        colors: [
                          Color(0xFF3383CD),
                          Color(0xFF11249F),
                        ]
                    ),
                    image: DecorationImage(
                        image: AssetImage("assets/images/virus.png"))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (){},
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                        child: Stack(
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/Drcorona.svg",
                              width: 230,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topRight,
                            ),
                            Positioned(
                              top: 20,
                              left: 150,
                              child: Text("All you need \nis stay at home.",style: TextStyle(color: Colors.white,fontSize: 18),),
                            ),
                            Container(),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE5E5E5)),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20,),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                    value: state,
                    items: States.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        state = value;
                      });
                    },
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Case Update\n",
                            style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: "Newest update October 17",
                              style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold,fontSize: 16)
                          ),
                        ],
                      ),
                      ),
                      Spacer(),
                      Text("See details",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: Colors.black12,
                      ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(color: Colors.black,
                          number: 1046,
                          title: "Deaths",
                        ),Counter(color: Colors.redAccent,
                          number: 1046,
                          title: "Infected",
                        ),Counter(color: Colors.green,
                          number: 1046,
                          title: "Recovered",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

class Counter extends StatelessWidget {

  final int number;
  final Color color;
  final String title;
  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.30),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: color,width: 2),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text("$number",style: TextStyle(fontSize: 30,color: color),),
        Text(title,style: TextStyle(fontSize: 18,color: Colors.black38),),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,size.height-80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}
