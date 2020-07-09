import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tindermovies/services/auth.dart';
import 'package:tindermovies/utils/utils.dart';
import 'package:tindermovies/widgets/loading.dart';

class SignInPage extends StatefulWidget {
  final int page;
  SignInPage({Key key, @required this.page}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email;
  String _pass;
  String _confirmPass;
  bool _autoValidate = false;
  bool _loading = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return _loading
    ? LoadingWidget()
    : Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      this.widget.page == 0
                      ? Text('Hi, welcome to tinder movies app.',
                          style: Theme.of(context).textTheme.bodyText1)
                      : Text(
                          'Hello guys!, just one more step to find the best movies.',
                          style: Theme.of(context).textTheme.bodyText1),
                      Row(
                        children: <Widget>[
                          this.widget.page == 0
                          ? Text(
                              'Login with:',
                              style: Theme.of(context).textTheme.bodyText2)
                          : Text(
                              'Register with:',
                              style: Theme.of(context).textTheme.bodyText2),
                          _googleButton(context),
                          _facebookButton(context),
                        ],
                      ),
                      _loginBox(context),
                      SizedBox(height: 32.0)
                    ],
                  ),
                ),
              ),
              Container(
                height: 300,
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
          Positioned(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  size: 52,
                  color: Theme.of(context).canvasColor,
                ),
                onPressed: () {
                  if (this.widget.page == 0) {
                    _validateInputsSignIn(context);
                  } else {
                    _validateInputsSignUp(context);
                  }
                }),
            ),
            bottom: 270,
            right: 48,
          ),
        ],
      );
  }

  Widget _googleButton(BuildContext context) {
    return FlatButton(
      child: Text(
        'Google',
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18),
      ),
      onPressed: () async {
        setState(() {
          _loading = true;
        });
        final result = await _auth.signInWithGoogle();
        if (result == null) {
          print('error');
        }
        setState(() {
          _loading = false;
        });
      },
    );
  }

  Widget _facebookButton(BuildContext context) {
    return FlatButton(
      child: Text(
        'Facebook',
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18),
      ),
      onPressed: () async {
        setState(() {
          _loading = true;
        });
        final result = await _auth.sigInWithFacebook();
        if (result == null) {
          print('error');
        }
        setState(() {
          _loading = false;
        });
      },
    );
  }

  Widget _loginBox(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: 'Email address'),
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            onSaved: (String val) => _email = val),
          SizedBox(height: 8.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: GestureDetector(
                dragStartBehavior: DragStartBehavior.down,
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            textInputAction: TextInputAction.done,
            obscureText: _obscureText,
            validator: (String pass) {
              if (pass.length < 8) {
                return 'The pass should be more than 7 characters';
              } else {
                return null;
              }
            },
            onSaved: (String val) => _pass = val,
            onChanged: (String val) => _pass = val,
          ),
          SizedBox(height: 8.0),
          this.widget.page == 0
          ? Container()
          : TextFormField(
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                suffixIcon: GestureDetector(
                  dragStartBehavior: DragStartBehavior.down,
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(_obscureText
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
              textInputAction: TextInputAction.done,
              obscureText: _obscureText,
              validator: (String pass) {
                if (pass.length < 8) {
                  return 'The pass should be more than 7 characters';
                } else if (pass != _pass) {
                  return 'Diferent passwords';
                } else {
                  return null;
                }
              },
              onSaved: (String val) => _confirmPass = val,
            ),
        ],
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<void> _validateInputsSignIn(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      //    If all data are correct then save data to out variables
      _formKey.currentState.save();
      final result = await _auth.signInEmailPass(_email, _pass);
      setState(() {
        _loading = false;
      });
      if (result == null) {
        Utils.showSnackbar(context, 'Couldn\'t sign in with those credentials');
      }
    } else {
      //    If all data are not valid then start auto validation.
      _autoValidate = true;
    }
  }

  Future<void> _validateInputsSignUp(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      //    If all data are correct then save data to out variables
      _formKey.currentState.save();
      final result = await _auth.signUpEmailPass(_email, _pass);
      setState(() {
        _loading = false;
      });
      if (result == null) {
        Utils.showSnackbar(context, 'The email address is already in use by another account.');
      }
    } else {
      //    If all data are not valid then start auto validation.
      _autoValidate = true;
    }
  }
}
