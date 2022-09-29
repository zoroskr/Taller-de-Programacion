package tema3;

import PaqueteLectura.Lector;

public class mainEntrenadores {

    public static void main(String[] args) {
         double sueldo = Lector.leerDouble();
         int ganados = Lector.leerInt();
         int antiguedad = Lector.leerInt();
         String nombre = Lector.leerString();
         

         Entrenadores e1 = new Entrenadores(nombre, sueldo, antiguedad, ganados);
         

         System.out.println("Efectividad" + " " + e1.calcularEfectividad());
         System.out.println("Sueldo" + " " + e1.calcularSueldoACobrar());
    }
    } 

