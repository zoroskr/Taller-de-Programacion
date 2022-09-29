/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

public class mainTriangulos {


    public static void main(String[] args) {
        double lado1 = Lector.leerDouble() ;
        double lado2 = Lector.leerDouble();
        double lado3 = Lector.leerDouble();
        
        triangulos t1 = new triangulos(lado1, lado2, lado3, Lector.leerString(), Lector.leerString());
        
        System.out.println("Area:" + " " + t1.calularArea(lado1, lado2, lado3));
        System.out.println("Perimetro:" + " " + t1.calularPerimetro(lado1, lado2, lado3));
    }
    
}
