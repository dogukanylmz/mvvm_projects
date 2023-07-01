import 'dart:math';

import 'package:flutter/material.dart';

import '../Model-View/user_model_view.dart';

class FlipableCard extends StatefulWidget {
  const FlipableCard({super.key, required this.index, required this.postUserModel});

  final int index;
  final PostUserModel postUserModel;

  @override
  State<FlipableCard> createState() => _FlipableCardState();
}

class _FlipableCardState extends State<FlipableCard> {

  bool isfliped = false;
  double angle = 0;
  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
      isfliped = !isfliped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isfliped == false
        ? InkWell(
            onTap: _flip,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1000),
              tween: Tween<double>(begin: 0, end: angle),
              builder: (context, value, _) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(2*value),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.4))],
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                       
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text("User Name:${widget.postUserModel.users[widget.index].username}",style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 14,),),
                          Text("Full Name: ${widget.postUserModel.users[widget.index].name}",style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                        ],
                      ),
                    ]),
                  ),
                );
              },
            ),
          )
        : InkWell(
            onTap: _flip,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1000),
              tween: Tween<double>(begin: 0, end: angle),
              builder: (context, value, _) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                    ..rotateX(2*value),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.17,
                     padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                     decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.4))],
                      borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network("https://loremflickr.com/320/240",fit: BoxFit.cover,))),
                                  const SizedBox(width: 8,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(widget.postUserModel.users[widget.index].name.toString()),
                                      Text(widget.postUserModel.users[widget.index].email.toString()),
                                      Text(widget.postUserModel.users[widget.index].username.toString())
                                    ],
                                  ),
                            ],
                          ),
                          Container(
                            width: 1,
                            color: Colors.black.withOpacity(0.4),
                            height: MediaQuery.of(context).size.height*0.15,
                          ),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const Text("Address"),
                                 Text(widget.postUserModel.users[widget.index].address!.city.toString()),
                                 Text(widget.postUserModel.users[widget.index].address!.street.toString()),
                                 Text(widget.postUserModel.users[widget.index].address!.suite.toString()),
                               ],
                             )
                        ],
                      ),
                  ),
                );
              },
            ),
          );
  }
}

