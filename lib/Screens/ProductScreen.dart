import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/productprovider.dart';
import '../Widgets/productwidget.dart';
class Productscreen extends StatelessWidget {
  const Productscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text("Products", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child){
          final newProvider = provider.productModel?.data;
          if(newProvider == null){
            provider.fetchData();
            return Center(child: CircularProgressIndicator(),);
          }else{
            return GridView.builder(
              itemCount: newProvider.length,
              itemBuilder:(context, index) {
                return ProductWidget(
                    img: provider.productModel?.data[index]["image"],
                    name: provider.productModel?.data[index]["name"],
                    price: provider.productModel?.data[index]["price"]
                );
              } ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2 ,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              //semanticChildCount: 2,

            );
          }
        },
      ),
    );  }
}
