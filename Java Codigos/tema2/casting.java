/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author elmun
 */
public class casting {
    public static void main(String[] args) {
       Persona [][] tabla = new Persona [5][8];
       
       GeneradorAleatorio.iniciar();
       int i, j;
       String nombre = "asasd";
       int DNI;
       int edad;
       int dimJ = 0;
       int dimI = 0;
       
       for (i=0; i<5;i++){
           for (j=0; j<8; j++){
               nombre = Lector.leerString();
               DNI = GeneradorAleatorio.generarInt(155);
               edad = GeneradorAleatorio.generarInt(250);
               
               Persona p = new Persona(nombre, DNI, edad);
               if (nombre.equals("ZZZ")){
                   i=6;
                   j=9;
               }
               else{
                   tabla[i][j]= p;  
                   dimJ= j;
                   dimI= i;
               }
           }
       }
       
       
       for (i=dimI; i>-1; i--){
           for (j=dimJ; j>-1; j--){
               System.out.println(i + tabla[i][j].toString());
           }
           dimJ=7;
       }
    }
    
}
