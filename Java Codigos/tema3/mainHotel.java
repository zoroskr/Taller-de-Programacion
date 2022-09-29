/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;
import tema2.Persona;

public class mainHotel {

    public static void main(String[] args) {
        int i;
        GeneradorAleatorio.iniciar();
        Hotel h1 = new Hotel(10);
        for (i=0; i<10; i++){
         Persona cliente = new Persona(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(10));
         h1.ingresarCliente(cliente, i);
        }
        
        h1.imprimir();

        h1.aumentarCosto(100);

        h1.imprimir();
    }
    
}
