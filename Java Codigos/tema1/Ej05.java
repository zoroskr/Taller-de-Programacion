
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej05 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int[] vector = new int[4];
        
        int i, j, puntaje, promedio;
        
        for (i=0; i < 5; i++){
            for (j=0; j < 4; j++){
                puntaje = GeneradorAleatorio.generarInt(10);
                System.out.println("Puntaje" + i + " " + puntaje);
                vector[j] = vector[j] + puntaje;
            }
        }
        System.out.println("Los promedios son");
        for (i=0; i < 4; i++){
            promedio = vector[i] / 5;
            System.out.println(promedio);
        }
        
    }
}