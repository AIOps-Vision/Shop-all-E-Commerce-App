import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/buy_or_sell.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'package:intl/intl.dart';
import 'login.dart';
import '../main.dart';

class SignUp extends StatelessWidget {
  final emailControl = TextEditingController();
  final firstNameControl = TextEditingController();
  final lastNameControl = TextEditingController();
  final passControl = TextEditingController();
  final birthDayControl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeCubit(),
      child: BlocConsumer<ChangeCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          return Material(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  right: 15.0,
                  left: 15,
                  bottom: 5,
                  top: 10,
                ),
                padding: EdgeInsets.all(5.0),
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'times',
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        controller: firstNameControl,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'First Name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.text_fields_outlined,
                            )),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'first name must not be empty';
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        controller: lastNameControl,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Last Name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.text_fields_outlined,
                            )),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'last name must not be empty';
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        controller: emailControl,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                            labelText: 'Email Adress',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email,
                            )),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'email address must not be empty';
                          }
                          return null;
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2023-02-20'),
                          ).then((value) {
                            if (value != null)
                              birthDayControl.text =
                                  DateFormat.yMMM().format(value);
                          });
                        },
                        controller: birthDayControl,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                            labelText: 'Birth Day',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.edit_calendar_outlined,
                            )),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'birth day must not be empty';
                          }
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        controller: passControl,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ChangeCubit.get(context).isPasswordShow,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          suffixIcon: Icon(
                                      ChangeCubit.get(context).isPasswordShow
                                          ? Icons.visibility_off
                                          : Icons.visibility) !=
                                  null
                              ? IconButton(
                                  onPressed: () {
                                    ChangeCubit.get(context).isPasswordShow =
                                        !ChangeCubit.get(context)
                                            .isPasswordShow;
                                  },
                                  icon: Icon(
                                    ChangeCubit.get(context).isPasswordShow
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                )
                              : null,
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'password must not be empty';
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Main(),
                              ));
                        }
                      },
                      child: Container(
                        height: 40.0,
                        width: 90,
                        child: Center(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'times',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an acount?',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'times',
                              fontSize: 13,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context); // to go to back page use pop not push
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => LogIn(),
                                //     ));
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'times',
                                  fontSize: 15,
                                ),
                              ))
                        ],
                      ),
                    ),
                    // ElevatedButton.icon(
                    //   icon: Icon(
                    //     Icons.keyboard_backspace_sharp,
                    //     size: 20,
                    //     color: Colors.blue,
                    //   ),
                    //   label: Text(
                    //     "Do you have an account?",
                    //     style: TextStyle(
                    //       fontFamily: 'times',
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 13,
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //   ),
                    // ),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
