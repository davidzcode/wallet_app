import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'DrawerCustom.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MaterialApp(
    title: 'Wallet UI Ejemplo',
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[HomeHeaderContainer(), HomeBottomContainer()],
        ),
      ),
      drawer: DrawerCustom(),
    );
  }
}

class HomeHeaderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          child: Image.network(
            "https://beinspiredchannel.com/wp-content/uploads/2017/04/black-abstract-wallpaper-hd-min-e1491927561381.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 80.0,
                        ),
                        InkWell(
                          onTap: (){
                            Scaffold.of(context).openDrawer();
                          },
                            child: Icon(
                          Icons.list,
                          color: Colors.white,
                        )),
                        Spacer(),
                        InkWell(
                          onTap: (){

                          },
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Cartera",
                          style: TextStyle(color: Colors.white, fontSize: 28.0),
                        ),
                        Spacer(),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView(
                  controller: PageController(initialPage: 1,keepPage: true,viewportFraction: 2),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    TarjetaCredito("5409", "06/23", "VISA"),
                    TarjetaCredito("9988", "02/21", "MASTERCARD"),
                    TarjetaCredito("3452", "01/19", "VISA"),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}


class HomeBottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Enviar Dinero"),
              Spacer(),
              Icon(Icons.keyboard_arrow_right, color: Colors.grey)
            ],
          ),
          Container(
            height: 140,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Contacto(
                    "David", "https://randomuser.me/api/portraits/men/84.jpg"),
                Contacto(
                    "Jaime", "https://randomuser.me/api/portraits/men/25.jpg"),
                Contacto(
                    "Carlos", "https://randomuser.me/api/portraits/men/35.jpg"),
                Contacto(
                    "Javier", "https://randomuser.me/api/portraits/men/73.jpg"),
                Contacto(
                    "Lucas", "https://randomuser.me/api/portraits/men/71.jpg"),
                Contacto(
                    "Marco", "https://randomuser.me/api/portraits/men/23.jpg"),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text("Todos", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: 10.0,
              ),
              Text("Recibido", style: TextStyle(color: Colors.grey)),
              SizedBox(
                width: 10.0,
              ),
              Text("Enviado", style: TextStyle(color: Colors.grey)),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Text(
                "23 Julio 2019",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Transaccion(Icons.home,Colors.red ,"Peluqueria", "23-05", "12:30", -40),
          Transaccion(Icons.movie,Colors.blue ,"Cine", "23-05", "22:00", -7),
          Transaccion(Icons.lightbulb_outline,Colors.pinkAccent ,"Luz", "23-05", "13:30", -80),
          Transaccion(Icons.directions_car,Colors.deepPurpleAccent ,"Gasolina", "23-05", "20:30", -30),
        ],
      ),
    );
  }
}


class TarjetaCredito extends StatelessWidget {
  final String ultimosDigitos, exp, tipo;

  TarjetaCredito(this.ultimosDigitos, this.exp, this.tipo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: 160,
          width: 320,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Spacer(),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    color: Colors.pinkAccent,
                    child: Text(
                      tipo,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[Text("Card no.")],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "****",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "****",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "****",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ultimosDigitos,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Expira",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    exp,
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Contacto extends StatelessWidget {
  final String nombre, pathImage;

  Contacto(this.nombre, this.pathImage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    child: Container(
                      child: Image.network(
                        pathImage,
                        fit: BoxFit.cover,
                        scale: 2.6,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(nombre)
                ],
              )),
        ],
      ),
    );
  }
}

class Transaccion extends StatelessWidget {
  final Color colorCiruclo;
  final String nombre, fecha, hora;
  final IconData icono;
  final int cantidad;
  final formatCurrency = NumberFormat.simpleCurrency(locale: "es");

  Transaccion(this.icono,this.colorCiruclo,this.nombre, this.fecha, this.hora, this.cantidad);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(179, 179, 179, 0.3),))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    color: colorCiruclo),
                height: 40,
                width: 40,
                child: Center(
                  child: Icon(icono, color: Colors.white,),
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(nombre, style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(fecha),
                      SizedBox(width: 10.0,),
                      Text(hora),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    formatCurrency.format(cantidad),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  )
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
