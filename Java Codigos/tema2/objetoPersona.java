/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.Lector;


public class objetoPersona{
    public static void main(String[] args) {
        Persona p1 = new Persona(Lector.leerString(), Lector.leerInt(), Lector.leerInt()); // le pasa los parametros
        System.out.println(p1.toString()); // utiliza el metodo de la clase persona
    }
}
