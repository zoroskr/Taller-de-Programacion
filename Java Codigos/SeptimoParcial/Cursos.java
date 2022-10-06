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
public class Cursos {
    private String nombre;
    private double costo;
    private Lecciones vector[];
    private int dimF;
    private int dimL = 0;

    public Cursos(String nombre, double costo, int n) {
        this.nombre = nombre;
        this.costo = costo;
        this.dimF = n;
        this.vector= new Lecciones [n];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public Lecciones[] getVector() {
        return vector;
    }

    public void setVector(Lecciones[] vector) {
        this.vector = vector;
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void agregarLeccion(Lecciones leccion){
        if (dimL < dimF){
            vector[dimL] = leccion;
            dimL++;
        }
    }
    
    public double costoFinal (){
        double costoF = dimL * costo;
        return costoF;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i=0; i<dimL; i++){
            aux = aux + vector[i];
        }
        return "Cursos{" + "nombre=" + nombre + " " + aux;
    }
    
    
}
