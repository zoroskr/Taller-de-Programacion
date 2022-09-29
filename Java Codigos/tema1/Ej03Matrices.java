/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
//Paso 1. importar la funcionalidad para generar datos aleatorios

public class Ej03Matrices {

    public static void main(String[] args) {
        //Paso 2. iniciar el generador aleatorio   
        GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int[][] tabla = new int[5][5];
        int i, j;
       
         
         for (i=0; i<5; i++){
             for (j=0; j<5; j++){
                 tabla[i][j] = GeneradorAleatorio.generarInt(10);
             }
         } 
        //Paso 4. mostrar el contenido de la matriz en consola
       /* for (i=0; i<5; i++){
             for (j=0; j<5; j++){
                 System.out.print(tabla[i][j]);
             }
             System.out.println();
         }*/
        
        System.out.println("Elementos de la matriz numeros: ");
         for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
             System.out.print(tabla[i][j] + " ");
            }
             System.out.println();
           }
         
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        System.out.println("Suma de los Elementos fila 1");
        int suma = 0;
        for (j=0; j<5; j++){
            suma = suma + tabla[0][j];
        }
        System.out.println(suma);
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        int columna = 0;
        int[] vector = new int[5];
        for (j=0; j<5; j++){
            for (i=0; i<5; i++){
                columna= columna + tabla[i][j];
            }
            vector[j] = columna;
            columna = 0;
        }
        
        for (i=0;i<5;i++){
            System.out.println(vector[i]);
        }

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        
        int valor = Lector.leerInt();
        boolean esta = false;
        for (i=0; i<5; i++){
             for (j=0; j<5; j++){
                 if (valor == (tabla[i][j])){
                     esta = true;
                 }
             }
         } 
        System.out.println(esta);
        
    }   
}
