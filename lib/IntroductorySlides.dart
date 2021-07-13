import 'dart:io';

import 'package:flutter/material.dart';

import 'CustomColors.dart';

class IntroductorySlides extends StatefulWidget {
  @override
  _IntroductorySlidesState createState() => _IntroductorySlidesState();
}

class _IntroductorySlidesState extends State<IntroductorySlides> {

  PageController _pageController = PageController();
  double currentPage = 0;
  List Slides = [
    {"title":"How to be healthy ? ","Data":"Healthy mothers mean healthy families. According to the United Nations Population Fund (UNFPA), “When mothers die, their families are much more vulnerable, and their infants are more likely to die before reaching their second birthday.","image":"https://insideretail.asia/wp-content/uploads/2020/09/Mothercare-babies.jpg"},
    {"title":"Things to remeber !! ","Data":"Yet progress hasn’t been fast enough, and today, on average, almost 800 women die each day from complications from pregnancy and childbirth. Making sure all women have access to the health care they need and deserve is the right thing to do; it’s also the smart thing to do to build healthier families and communities.","image":"https://previews.123rf.com/images/irontrybex/irontrybex1902/irontrybex190200029/121104774-closeup-on-small-feet-of-a-newborn-baby.jpg"},
    {"title":"Feel Happy Always  ","Data":"One of the best ways to improve the health of women and reduce maternal deaths is to expand access to voluntary family planning. Right now, more than 225 million women around the world don’t want to get pregnant, but aren’t using modern contraception – largely because they don’t have access. If this unmet need was filled, 79,000 fewer women would die in childbirth, and women around the world would have the power to decide to get pregnant if and when they want.","image":"https://previews.123rf.com/images/irinazharkova31/irinazharkova311908/irinazharkova31190800032/129639425-feet-of-the-newborn-baby-fingers-on-the-foot-maternal-care-love-and-family-hugs-tenderness.jpg"},
    {"title":"How to be healthy ? ","Data":"Aisha has a quiet smile and a calming presence. Sitting on a colorful blanket outside her family’s home, her more boisterous sisters laugh and talk around her. She waits patiently for a break in the excitement to explain that one of her younger sisters is soon to be married and the family is discussing the wedding arrangements.","image":"https://previews.123rf.com/images/irontrybex/irontrybex1902/irontrybex190200029/121104774-closeup-on-small-feet-of-a-newborn-baby.jpg"},
    {"title":"Somefun facts ","Data":"The first time Aisha heard about family planning, it was through rumors in her village. Contraceptives cause cancer and infertility, she was told; good women produce large families.","image":"https://previews.123rf.com/images/epokrovsky/epokrovsky2010/epokrovsky201000195/156706859-happy-young-woman-holding-her-little-baby-girl-outdoors-mother-walking-with-daughter-on-a-spring-day.jpg"},
    {"title":"More Challenging...","Data":"Challenging the cultural norms did not prove to be as easy. Her family was furious. They believed that not only had she put herself at risk, she had made herself seem immoral. But the memory of her mother’s life and the everyday reminders of young, struggling mothers – including her own sisters – were too powerful. She persevered. When she and her husband felt ready to have a second child, they stopped using contraceptives and Aisha became pregnant again. This surprised her family and helped to dispel the myths they had once believed.","image":"https://previews.123rf.com/images/nejron/nejron1906/nejron190600132/124309614-happy-middle-aged-mother-with-her-child-in-a-bed.jpg"},
    {"title":"Enjoy Motherhood   ","Data":"The strength of the women in my community, is the ability to sustain themselves – to persevere,” she said. “If given the opportunity, they can work hard and live strong lives. And all women deserve the right to do so.","image":"https://insideretail.asia/wp-content/uploads/2020/09/Mothercare-babies.jpg"},
  ];


  @override
  void initState() {
    _pageController.addListener((){
      setState(() {
        currentPage = _pageController.page;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: themeColor,),
          onPressed:(){
            exit(1);
          },
        ),
      ),
      body:Container(
        color: bgColor,
        child: Column(
          children: [
            Container(height:40,color:bgColor,child: Center(child: Text("Welcome",style: TextStyle(color: themeColor,fontSize: 30),))),
            Container(
              height: 500,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: Slides.length,
                  itemBuilder: (BuildContext contex,int index){
                    return _mainframe("${Slides[index]["image"]}","${Slides[index]["title"]}", "${Slides[index]["Data"]}" );
                  }),
            ),
          ],
        ),
      ),
//      PageView(
//        controller: _pageController,
//        children: <Widget>[
//          _mainframe('assets/Bank_accounts.svg', cnst.slider_1_1,cnst.slider_1_2,false ),
//          _mainframe('assets/Transfermoney.svg', cnst.slider_2_1,cnst.slider_2_2,false ),
//          _mainframe('assets/AddBenificary.svg', cnst.slider_3_1,cnst.slider_3_2,false ),
//          _mainframe('assets/ComingSoon.svg', cnst.slider_4_1,cnst.slider_4_2,false ),
//          _mainframe('assets/GetStarted.svg', '','',true ),
//        ],
//        scrollDirection: Axis.horizontal,
//      ),
        bottomNavigationBar:Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.only(bottom :18.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children:_buildPageIndicator()
            ),
          ),
        ),
    );

  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    print("pagecontroller,has clients value is ${_pageController.hasClients}");
    for (int i = 0; i < Slides.length; i++) {
      list.add(i == (_pageController.hasClients?_pageController.page:0) ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _mainframe(String image,String header,String maintxt){
    return Padding(
        padding: EdgeInsets.only(bottom: 40,left: 40,right: 40,top:40),
        child:Container(
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),

          child: ListView(
            children: [
              FadeInImage.assetNetwork(
                image: image,
                placeholder:'assets/defaultimage11.png',
                height:200,
                width: 300,
                fit: BoxFit.fill,
                fadeInDuration: Duration(seconds: 1),
//                fadeInCurve: Curves.bounceIn,
                ),
                  //Image.network(image,),
                  Padding(
                    padding: const EdgeInsets.only(top:18.0),
                    child: Center(child: Text("$header",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500),),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    child: Text("$maintxt",style: TextStyle(color: Colors.black45),textAlign: TextAlign.center,),
                  )
            ],
          ),
        ) );


  }

  Widget _indicator(bool isActive) {
    return Container(
      color: bgColor,
      height: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 110),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive
            ? 10:8.0,
        width: isActive
            ? 12:8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
              color: themeColor.withOpacity(0.92),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            ) : BoxShadow(
              color: Colors.transparent,
            )
          ],
          shape: BoxShape.circle,
          color: isActive ? Colors.white : themeColor.withOpacity(0.2),
        ),
      ),
    );
  }
}
