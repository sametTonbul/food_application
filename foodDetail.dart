// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/foods.dart';

class FoodDetail extends StatefulWidget {
  Foods foodFromFoodsClass; 
   FoodDetail(this.foodFromFoodsClass);
  @override
  State<FoodDetail> createState() => _FoodDetailState();}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.foodFromFoodsClass.food_name)),
      body: 
        Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 260,
                width: 200,
                child: Image.asset('pics/${widget.foodFromFoodsClass.food_picture_name}')),
              SizedBox(
                height: 40,
                width: 80,
                child: Text(
                textAlign : TextAlign.center,
                '${widget.foodFromFoodsClass.food_price} \u{20BA}',
                style: TextStyle(fontSize: 20,
                color: Colors.blue)),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orangeAccent)),
                  child: Text('Order',selectionColor: Colors.white,),
                  onPressed: (){
                    // You Write here Everything you want :)
                  },
                ),
              )
            ],
          ),
        ),
    );
  }
}