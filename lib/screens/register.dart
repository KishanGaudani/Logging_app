import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Register_page extends StatefulWidget {
  const Register_page({Key? key}) : super(key: key);

  @override
  State<Register_page> createState() => _Register_pageState();
}

class _Register_pageState extends State<Register_page> {
  GlobalKey<FormState> Formkey = GlobalKey();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String? username;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/images/2.jpg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Form(
                    key: Formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "User Name",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Name";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Globals.name = val;
                            },
                            controller: usernamecontroller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.pink.shade100,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.pink,
                                ),
                              ),
                              hintText: "User Name",
                              filled: true,
                              fillColor: Colors.pink.withOpacity(0.12),
                            ),
                          ),
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            controller: emailcontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Email";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Globals.email = val;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.pink.shade100,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.pink,
                                ),
                              ),
                              hintText: "Email",
                              filled: true,
                              fillColor: Colors.pink.withOpacity(0.12),
                            ),
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Password";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              Globals.password = val;
                            },
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.pink.shade100,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.pink,
                                ),
                              ),
                              hintText: "Password",
                              filled: true,
                              fillColor: Colors.pink.withOpacity(0.12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "Tap to Register your account",
                      style: TextStyle(color: Colors.pinkAccent),
                    )),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: SizedBox(
                      width: size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (Formkey.currentState!.validate()) {
                            Formkey.currentState!.save();
                            Navigator.of(context).pushNamed('login');
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool("isUserDetails", true);
                            prefs.setString("name", Globals.name.toString());
                            prefs.setString(
                                "password", Globals.password.toString());
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.pink,
                          ),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
