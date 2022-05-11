import 'package:flutter/material.dart';

import '../../common/shelf_colors.dart';

class BookRequestFail extends StatelessWidget {
  const BookRequestFail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Card em si
    return Card(
      shadowColor: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 250),
      color: ShelfColors.yellowLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),

      //Coluna contendo o ícone, descrição e botão
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [

          //Ícone
          const Center(
            child: Icon(
              Icons.cancel,
              color: ShelfColors.pink,
              size: 320,
            ),
          ),

          //Descrição
          const Center(
            child: Text(
              'Envio de solicitação falhou.',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Botão do tipo Elevated Button
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 60),
                  primary: ShelfColors.pink,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
                onPressed: () {}, //Função pendente
                child: const Text(
                  'Voltar',
                  style: TextStyle(color: Colors.black),
          ),),),),

        ],
      ),
    );
  }
}
