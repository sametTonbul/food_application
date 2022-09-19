import 'package:flutter/material.dart';
import 'package:flutter_application_1/foodDetail.dart';
import 'package:flutter_application_1/foods.dart';


void main() {
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Foods>> getFoods() async {
    
    var food1 = Foods(1, "MeatBull", "meatbull.jpg", 124.99);
    var food2 = Foods(2, "Ayran", "ayran.jpg", 8.0);
    var food3 = Foods(3, "Fanta", "fanta.png", 18.0);
    var food4 = Foods(4, "Makarna", "makarna.jpg", 44.99);
    var food5 = Foods(5, "Fıstıklı Baklava", "fistiklibaklava.jpg", 48.50);
    
    var foodList = [food1, food2, food3, food4, food5];

    return foodList; }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FoodLiess")),
      body: FutureBuilder<List<Foods>>(
        future: getFoods(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var foodListINData = snapshot.data;
            return ListView.builder(
              itemCount: foodListINData!.length,
              itemBuilder: (context,indeks){
                var foodInData = foodListINData[indeks];
                return GestureDetector(
                  onTap: ()=>
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetail(foodInData),)),
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 125,
                          width: 125,
                          child: Image.asset("pics/${foodInData.food_picture_name}")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodInData.food_name,
                                style: TextStyle(fontSize: 25),),
                              SizedBox(height: 50,),
                              Text(
                                "${foodInData.food_price} \u{20BA}",
                                style: TextStyle(fontSize: 20,
                                color: Colors.blue),),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
