/*Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI. */




package tema2;
import PaqueteLectura.GeneradorAleatorio;


public class vectorPersonas{
    public static void main(String[] args) {
        Persona [] vector = new Persona [15]; 
        GeneradorAleatorio.iniciar();
        int edad, DNI;
        int dimL = 0;
        int i;
        int contador = 0;
        int min = 9999;
        String nombre;
        
        
        edad = GeneradorAleatorio.generarInt(15); 
        
        while (edad != 0 && dimL<15){
        nombre = GeneradorAleatorio.generarString(5);
        DNI = GeneradorAleatorio.generarInt(155);
        vector[dimL] = new Persona(nombre, DNI, edad);
        edad = GeneradorAleatorio.generarInt(250);
        dimL++;
        }
        
        
        Persona minp = (vector[0]);
        
        System.out.println("Personas mayores: ");
        for (i = dimL-1; i > 0; i--) {
            if ((vector[i].getEdad()) > 65){
                contador = contador + 1;
            }
            if ((vector[i].getDNI()) < min){
                min = (vector[i].getDNI());
                minp = (vector[i]);
            }
         }
        System.out.println(contador);
        System.out.println(minp.toString());
         
        
    }
}
