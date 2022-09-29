/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej04 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int[][] tabla = new int[8][4];
        int i, j;
        
        int oficina = GeneradorAleatorio.generarInt(4);
        int piso = GeneradorAleatorio.generarInt(8);
        
        while (piso != 3){
            tabla[piso][oficina] = tabla[piso][oficina] + 1;
            oficina = GeneradorAleatorio.generarInt(3);
            piso = GeneradorAleatorio.generarInt(7);
        }
        
        System.out.println("Elementos de la matriz numeros: ");
        for (i = 0; i < 8; i++) {
         for (j = 0; j < 4; j++) {
            System.out.print(tabla[i][j] + " ");
         }
         System.out.println();
        }
 
    }

}