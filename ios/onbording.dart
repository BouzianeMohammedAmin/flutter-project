import 'package:first_project/pagemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;

  void _addPages() {
    this.pages = new List<PageModel>();
    pages.addAll([
      PageModel(
        image: "assets/images/pic0.jpg",
        title: "1-Welcom",
        description:
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has" ,
        icon: Icons.all_inclusive,

      ),
      PageModel(
        image: "assets/images/pic1.jpg",
        title: "2-Welcom",
        description:
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has" ,
        icon: Icons.alternate_email,
      ),
      PageModel(
        image: "assets/images/pic2.jpg",
        title: "3-Welcom",
        description:
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has" ,
        icon: Icons.album,
      ),
      PageModel(
        image: "assets/images/pic3.jpg",
        title: "4-Welcom",
        description:
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has" ,
        icon: Icons.clear_all,
      ),
      PageModel(
        image: "assets/images/pic4.jpg",
        title: "5-Welcom",
        description:
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's"
            " standard dummy text ever since the 1500s, when an unknown "
            "printer took a galley of type and scrambled"
            " it to make a type specimen book. It has" ,
        icon: Icons.all_out,
      )
    ]);
  }

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
          itemCount:this.pages.length,
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
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
