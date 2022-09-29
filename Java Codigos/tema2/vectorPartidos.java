/*
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:
- La cantidad de partidos que ganó River.
- El total de goles que realizó Boca jugando de local.
- El porcentaje de partidos finalizados con empate.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class vectorPartidos {

    public static void main(String[] args) {
        Partido []vector = new Partido [20];
        GeneradorAleatorio.iniciar();
        int dimL= 0;
        String local;
        int golLocal;
        int golVisitante;
        int i;
        int cant=0;
        int golesB = 0;
        int empates = 0;
        
        String visitante = GeneradorAleatorio.generarString(5);
        
        
        while(visitante.compareTo("ZZZ") != 0 && dimL<20){      
            //local = GeneradorAleatorio.generarString(5);
            local = Lector.leerString();
            golLocal = GeneradorAleatorio.generarInt(5);
            golVisitante = GeneradorAleatorio.generarInt(5);
            vector[dimL]= new Partido(local, visitante, golLocal, golVisitante);
            visitante = GeneradorAleatorio.generarString(5);
            dimL++;
        }
        
        for (i=dimL-1;i>-1;i--){
            if (vector[i].getGanador().equals("River")){
                cant++;
            }
            if (vector[i].getLocal().equals("Boca")){
                golesB = golesB + vector[i].getGolesLocal();
            }
            if (vector[i].hayEmpate()){
                empates++;
            }  
        }
        System.out.println("La cantidad de partidos que ganó River" + " " + cant);
        System.out.println(" ");
        System.out.println("Total de goles que realizó Boca jugando de local." + " " + golesB);
        System.out.println(" ");
        System.out.println("El porcentaje de partidos finalizados con empate" + " " + empates);
        }  
    }
