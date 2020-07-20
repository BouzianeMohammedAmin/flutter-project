import 'package:first_project/pagemodel.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;
  ValueNotifier<int> _pageViewNotify = ValueNotifier(0);

  Map<int, MaterialColor> _mapColorsIndicateur = {
    0: Colors.red,
    1: Colors.grey,
    2: Colors.grey,
    3: Colors.grey,
    4: Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView.builder(
          itemBuilder: (BuildContext context, index) {
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(this.pages[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Transform.translate(
                      child: Icon(
                        this.pages[index].icon,
                        size: 150,
                        color: Colors.white,
                      ),
                      offset: Offset(0, -100),
                    ),
                    Text(
                      this.pages[index].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48, right: 48),
                      child: Text(
                        this.pages[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          itemCount: this.pages.length,
          onPageChanged: (index) {
            _pageViewNotify.value = index;
            /*    setState(() {
              int k;
              _mapColorsIndicateur.forEach((key, value) {
                if (value == Colors.red) k = key;
              });
              _mapColorsIndicateur[k] = Colors.grey;
              _mapColorsIndicateur[index] = Colors.red;
            });*/
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'GET STARTRD ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: ()async {
                  //TODO Update Seen
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool('seen', true);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>HomeScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Transform.translate(
          child: Align(
            child: _displayPpageIndicateur(pages.length),
            alignment: Alignment.bottomCenter,
          ),
          offset: Offset(0, -100),
        ),

        /*
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _drawCircle(_mapColorsIndicateur[0]),
            _drawCircle(_mapColorsIndicateur[1]),
            _drawCircle(_mapColorsIndicateur[2]),
            _drawCircle(_mapColorsIndicateur[3]),
            _drawCircle(_mapColorsIndicateur[4]),

          ],
        )*/
      ],
    ));
  }

  Widget _displayPpageIndicateur(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotify,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _drawCircle(MaterialColor color) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          margin: EdgeInsets.only(bottom: 100, left: 10),
          width: 20,
          height: 20,
          decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          )),
    );
  }

  void _addPages() {
    this.pages = new List<PageModel>();
    pages.addAll([
      PageModel(
        image: "assets/images/pic0.png",
        title: "1-Welcom",
        description: "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has",
        icon: Icons.all_inclusive,
      ),
      PageModel(
        image: "assets/images/pic1.png",
        title: "2-Welcom",
        description: "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has",
        icon: Icons.alternate_email,
      ),
      PageModel(
        image: "assets/images/pic2.png",
        title: "3-Welcom",
        description: "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has",
        icon: Icons.album,
      ),
      PageModel(
        image: "assets/images/pic3.png",
        title: "4-Welcom",
        description: "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has",
        icon: Icons.clear_all,
      ),
      PageModel(
        image: "assets/images/pic4.png",
        title: "5-Welcom",
        description: "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has",
        icon: Icons.all_out,
      )
    ]);
  }
}
