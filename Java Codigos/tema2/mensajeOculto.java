/*
Realice un programa que cargue un vector con 10 Strings leídos desde teclado. El vector
generado tiene un mensaje escondido que se forma a partir de la primera letra de cada
string. Genere un nuevo string con el mensaje escondido y muéstrelo en consola.
NOTA: La primer letra de un String se obtiene enviando el mensaje charAt(0) al objeto.
Ingrese: humo oso lejos ala menos usado nene de ocho ! Debería imprimir: holamundo!
 */
package tema2;
import PaqueteLectura.Lector;

public class mensajeOculto {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int i;
        String cadena;
        String [] vector = new String [10];
        char [] vectorChar = new char [10];
        
        for (i=0; i < 10; i++){
            cadena = Lector.leerString();
            vector[i]=cadena;
        }
        
        for (i=0; i < 10; i++){
            vectorChar[i] = vector[i].charAt(0);
        }
        
        for (i=0; i < 10; i++){
            System.out.println(vectorChar[i]);
        }
        
    }
    
}
