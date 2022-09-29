package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author elmun
 */
public class mainCirculo {
    public static void main(String[] args) {
         double radio = Lector.leerDouble();
         String relleno = Lector.leerString();
         String linea = Lector.leerString();
         circulos c1 = new circulos (radio, relleno, linea);
         
         System.out.println("Area" + " " + c1.calcularArea());
         System.out.println("Perimetro" + " " + c1.calcularPerimetro());
    }
    
}
