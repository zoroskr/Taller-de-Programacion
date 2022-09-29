/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;
import tema2.Persona;

public class Hotel {
    private int n;
    private Habitacion vector[];
    private int i;

    public Hotel(int n) {
        this.n = n;
        this.vector = new Habitacion[n];
        for (i=0; i<n; i++){
            this.vector[i] = new Habitacion();
            this.vector[i].setOcupada(false);
            this.vector[i].setCosto(200);
        }
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }

    public Habitacion[] getVector() {
        return vector;
    }

    public void setVector(Habitacion[] vector) {
        this.vector = vector;
    }
       
    
    public void ingresarCliente (Persona cliente, int x){
        this.vector[x].setCliente(cliente);
    }
    
    public void aumentarCosto (double monto){
        for (i=0; i<n; i++){
            vector[i].setCosto(vector[i].getCosto() + monto);
        }
    }

    public void imprimir() {
        for (i=0; i<n; i++){
            System.out.println ("Habitacion" + " " + vector[i].getCosto() + " " + vector[i].isOcupada());
        }     
}
}
