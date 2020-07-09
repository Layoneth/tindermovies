import 'package:flutter/material.dart';
import 'package:tindermovies/pages/auth/sign_in_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  double _currentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: _pageButton('Sign in', 0, 0.0)
              ),
              Expanded(
                child: _pageButton('Sign up', 1, 1.0)
              )
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int page) =>
                _pageController.addListener(() {
                  setState(() {
                    _currentPage = _pageController.page;
                  });
                }),
              children: <Widget>[
                SignInPage(page: 0),
                SignInPage(page: 1),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _pageButton(String text, int page, double currentPage){
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          decoration: _currentPage == currentPage
            ? TextDecoration.underline
            : TextDecoration.none)),
      onPressed: () => _changePage(page)
    );
  }

  void _changePage(int page){
    _pageController.animateToPage(page,
      duration: Duration(milliseconds: 50),
      curve: Curves.easeIn);
    _pageController.addListener(() {
      setState(() { _currentPage = _pageController.page; });
    });
  }
}
