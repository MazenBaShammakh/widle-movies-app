import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:widle_studio_practical_test/constants.dart';
import 'package:widle_studio_practical_test/providers/auth.dart';

import 'package:widle_studio_practical_test/screens/home/home_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController _controller;
  String? errorText;
  bool hasError = false;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacingUnit * 4),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: hasError ? kError : kNeutralDark,
                  ),
                  borderRadius: BorderRadius.circular(kSpacingUnit * 2),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: hasError ? kError : kNeutralDark,
                    ),
                    const SizedBox(width: kSpacingUnit * 2),
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(fontSize: 16),
                        ),
                        validator: (value) {
                          _validator(value);
                        },
                        onChanged: (value) {
                          _validator(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kSpacingUnit * 2),
              Visibility(
                visible: hasError,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: kSpacingUnit * 2),
                  child: Text(
                    errorText.toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: kError,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: kSpacingUnit * 2),
              ElevatedButton(
                onPressed: _authenticate,
                child: const Text('Go'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validator(String? value) {
    final _alphanumeric = RegExp(r'^[a-zA-Z0-9_]+$');
    if (value == null || value.isEmpty) {
      setState(() {
        hasError = true;
        errorText = 'Username field is compulsory';
      });
    } else if (value.length > 20) {
      setState(() {
        hasError = true;
        errorText = 'Username should be less than 20 characters';
      });
    } else if (!_alphanumeric.hasMatch(value)) {
      setState(() {
        hasError = true;
        errorText = 'Use only alphabets, numbers, and underscore.';
      });
    } else {
      setState(() {
        hasError = false;
        errorText = null;
      });
    }
  }

  Future<void> _authenticate() async {
    if (!hasError) {
      try {
        await Provider.of<Auth>(context, listen: false)
            .authenticate(_controller.text, context)
            .then((isSuccess) {
          if (isSuccess) {
            Navigator.of(context).pushReplacementNamed(
              HomeScreen.routeName,
              arguments: _controller.text,
            );
          }
        });
      } catch (error) {
        rethrow;
      }
    }
  }
}
