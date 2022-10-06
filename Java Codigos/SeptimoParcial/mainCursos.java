/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SeptimoParcial;

/**
 *
 * @author elmun
 */
public class mainCursos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Online o1 = new Online ("Zoom", "Curso Online", 100, 5);
        Presenciales p1 = new Presenciales ("Aula 5", true, "Objetos", 100, 5);
        
        Lecciones l1 = new Lecciones ("Java", "20/08", 20);
        Lecciones l2 = new Lecciones ("Pascal", "21/08", 20);
        
        Lecciones l3 = new Lecciones ("R-info", "22/08", 20);
        Lecciones l4 = new Lecciones ("Python", "23/08", 180);
        
        o1.agregarLeccion(l1);
        o1.agregarLeccion(l2);
        
        p1.agregarLeccion(l3);
        p1.agregarLeccion(l4);
        
        System.out.println(o1);
        System.out.println(p1);
        
    }
    
}
