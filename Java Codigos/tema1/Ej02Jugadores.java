
package tema1;
import PaqueteLectura.GeneradorAleatorio;

import PaqueteLectura.Lector;

//Paso 1: Importar la funcionalidad para lectura de datos


public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int DF=7;
        double [] vector = new double[DF]; 
        //Paso 3: Crear el vector para 15 double 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        double altura = 0;
        int i = 0;
        double alturaTotal = 0;
        int cant = 0;
        double promedio = 0;        
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0; i < DF; i++){
        altura = Lector.leerDouble(); 
        alturaTotal = alturaTotal + altura;
        vector[i] = altura;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = alturaTotal / DF;
        System.out.println(promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i=0; i < DF; i++){
           if (vector[i]>promedio) {
               cant= cant + 1;
           }
        }
        //Paso 9: Informar la cantidad.
        System.out.println(cant);
    }
    
}
