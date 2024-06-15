import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/image_assets.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
          ),
          child: Stack(
            children: [
              //Blur Effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(),
              ),
              //Gradient Effect
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.20)),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // CustomColors.primaryGradient.withOpacity(0.2),
                        // CustomColors.secondaryGradient.withOpacity(0.2),
                      ]),
                ),
              ),
              //Child
              Center(
                  child: Image.asset(
                ImageAssets.myPic,
                filterQuality: FilterQuality.high,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
