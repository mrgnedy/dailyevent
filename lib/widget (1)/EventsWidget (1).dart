import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EcentsWidget extends StatelessWidget {
  final String image;
  final String tittel;
  EcentsWidget({this.image, this.tittel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width * .42,
        height: MediaQuery.of(context).size.height * .2,
        color: Colors.blue,
        child: GridTile(
          child: CachedNetworkImage(
              imageUrl: this.image,
              placeholder: (context, url) => Center(
                    child: CupertinoActivityIndicator(
                      radius: 17,
                      animating: true,
                    ),
                  ),
              fit: BoxFit.fill,
              // height: MediaQuery.of(context).size.height * .2,
              // width: MediaQuery.of(context).size.width,
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Colors.black)),
          footer: Stack(
      
            children: <Widget>[
              Opacity(
                  opacity: .4,
                  child: Container(
                    color: Colors.grey[600],
                    width:MediaQuery.of(context).size.width ,
                    height: 40,
                
                  )),
                 Center(
                   child: Text(
                      this.tittel,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontFamily: "black", color: Colors.white),
                    ),
                 )
           
            ],
          ),
        ),
      ),
    );
  }
}
