/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;


public class Ej01Tabla2 {
    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int [] tabla2 = new int[5]; // indices de 0 a 10
        int i = 0;
        int num;
        GeneradorAleatorio.iniciar();
        
        num = (GeneradorAleatorio.generarInt(11));
        while (num != 11 && i<5){  
            System.out.println(num);
            tabla2[i] = num * 2;
            i++;
            num = (GeneradorAleatorio.generarInt(11));
        }
        for (i=0 ; i < 5; i++){
            System.out.println(tabla2[i]);
        }
    }
   }