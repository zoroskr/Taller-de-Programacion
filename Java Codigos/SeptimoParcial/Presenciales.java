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
public class Presenciales extends Cursos {
    private String aula;
    private boolean cBreak;

    public Presenciales(String aula, boolean cBreak, String nombre, double costo, int n) {
        super(nombre, costo, n);
        this.aula = aula;
        this.cBreak = cBreak;
    }

    public String getAula() {
        return aula;
    }

    public void setAula(String aula) {
        this.aula = aula;
    }

    public boolean iscBreak() {
        return cBreak;
    }

    public void setcBreak(boolean cBreak) {
        this.cBreak = cBreak;
    }
    
    
    @Override
    public void agregarLeccion(Lecciones leccion){
        super.agregarLeccion(leccion);
    }
    
    @Override
    public double costoFinal(){
        double presencialCosto;
        if (cBreak == true){
            presencialCosto = super.costoFinal() + super.costoFinal() * 0.05;
        }
        else{
            presencialCosto = super.costoFinal();
        }
        return presencialCosto;
    }

    @Override
    public String toString() {
        return "Presenciales{" + super.toString() + ", costo=" + costoFinal() + '}';
    }
    
    
}
