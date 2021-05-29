import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BannerPanel extends StatelessWidget {
  final String title, value;

  const BannerPanel({Key key, this.title, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left:12.0),
                child: Text(
                  title+" :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red,),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(right:12.0),
                child: Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.end,
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}