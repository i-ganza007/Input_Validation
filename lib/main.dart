import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(), // Set GetStartedScreen as the home
    );
  }
}

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the MyFlutterForm screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyFlutterForm()),
            );
          },
          child: Text('Get Started'),
        ),
      ),
    );
  }
}

class MyFlutterForm extends StatefulWidget {
  @override
  _MyFlutterFormState createState() => _MyFlutterFormState();
}

class _MyFlutterFormState extends State<MyFlutterForm> {
  // Form key here
  final _formKey = GlobalKey<FormState>();
  // Variable to enable auto validating of the form
  bool _autoValidate = false; // Start with false to avoid immediate validation
  // Variable to enable toggling between showing and hiding password
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Wrap with Scaffold for proper layout
      appBar: AppBar(
        title: Text('Form Validation'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Container(
          padding: EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            top: 40,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'First Name',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      return value == null || value.isEmpty ? 'Name cannot be empty' : null;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Phone Number',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: validateMobile,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          child: Icon(Icons.remove_red_eye),
                        ),
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(),
                        labelText: 'Password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _hidePassword,
                    validator: (String? value) {
                      return value == null || value.length < 8
                          ? 'Password must be more than 8 characters'
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.all(20.0),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Form Validated, No errors'),
                          ));
                        } else {
                          setState(() {
                            _autoValidate = true; // Enable auto-validation
                          });
                        }
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || !regex.hasMatch(value)) {
      return 'Enter Valid Email';
    }
    return null;
  }
}