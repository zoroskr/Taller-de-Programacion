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
public class Online extends Cursos {
    private String plataforma;

    public Online(String plataforma, String nombre, double costo, int n) {
        super(nombre, costo, n);
        this.plataforma = plataforma;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }
    
    @Override
    public void agregarLeccion(Lecciones leccion){
        if (leccion.getDuracion() < 45){
            super.agregarLeccion(leccion);
        }
    }

    @Override
    public double costoFinal() {
        double onlineCosto;
        if (plataforma.equals("Zoom")){
            onlineCosto = super.costoFinal() - super.costoFinal() * 0.10;
        }
        else {
            onlineCosto = super.costoFinal();
        }
        return onlineCosto;
    }
    
    @Override
    public String toString() {
        return "Online{" + super.toString() + ", costo=" + costoFinal() + '}';
    }
        
   }
    
    
