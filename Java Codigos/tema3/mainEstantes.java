/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author elmun
 */
public class mainEstantes {
    public static void main(String[] args) {
        Autor a1 = new Autor("Jorge", "Lindo", "ARG");
                Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               a1, "978-1512108347");
                Libro libro3= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               a1, "978-1512108347");
        Estante e1 = new Estante();
        e1.agregarLibro(libro3);
        e1.agregarLibro(libro2);
        e1.agregarLibro(libro3);
        
        
        System.out.println(e1.retornarLleno());
        System.out.println(e1.retornarEspecifico("Learning Java by Building Android Games"));
        System.out.println(e1.retornarLibros());
    }
    
}
