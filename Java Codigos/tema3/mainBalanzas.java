/*
B- Realizar un programa que instancie una balanza e inicie una compra. Lea desde teclado
información de los ítems comprados (peso en kg y precio por kg) hasta ingresar peso 0.
Registre cada producto en la balanza. Al finalizar, informe el resumen de la compra.
 */
package tema3;

import PaqueteLectura.Lector;

public class mainBalanzas {

    public static void main(String[] args) {
         double precio;
         double peso = Lector.leerDouble();
         balanzas b1 = new balanzas(0, 0);
         
         while (peso != 0){
         precio = Lector.leerDouble();
         b1.registrarProducto(peso, precio);
         peso = Lector.leerDouble();
        }
         System.out.println(b1.getResumenDeCompra());
    }
    
}
