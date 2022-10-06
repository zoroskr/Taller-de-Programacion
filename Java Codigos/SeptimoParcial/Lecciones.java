/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SeptimoParcial;


public class Lecciones {
    private String tema;
    private String fecha;
    private int duracion;

    public Lecciones(String tema, String fecha, int duracion) {
        this.tema = tema;
        this.fecha = fecha;
        this.duracion = duracion;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    @Override
    public String toString() {
        return "Lecciones{" + "tema=" + tema + ", fecha=" + fecha + ", duracion=" + duracion + '}';
    }
    
    
    
}
