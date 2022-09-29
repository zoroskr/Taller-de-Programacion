/*Definir una clase para representar entrenadores de un club. Un entrenador se
caracteriza por su nombre, sueldo básico, antigüedad y cantidad de campeonatos ganados.
- Defina métodos para obtener/modificar el valor de cada atributo.
- Defina el método calcularEfectividad que devuelve la efectividad del entrenador, que
es el promedio de campeonatos ganados por año de antigüedad.
- Defina el método calcularSueldoACobrar que devuelve el sueldo a cobrar por el
entrenador. El sueldo a cobrar es el sueldo básico agregando un 10% del básico por
año de antigüedad, y además se adiciona un plus por campeonatos ganados (5000$ si
ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
50.000$ si ha ganado más de 10 campeonatos).
B- Realizar un programa que instancie un entrenador, cargándole datos leídos desde
teclado. Informe el sueldo a cobrar y la efectividad del entrenador. */

package tema3;

public class Entrenadores {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    private int ganados;
    private double efectividad;
    private double cobro;

    public Entrenadores(String nombre, double sueldo, int antiguedad, int ganados) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
        this.ganados = ganados;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getGanados() {
        return ganados;
    }

    public void setGanados(int ganados) {
        this.ganados = ganados;
    }
    
    public double calcularEfectividad() {
        this.efectividad = ganados / antiguedad;  
        return efectividad;
    }
    
    /* El sueldo a cobrar es el sueldo básico agregando un 10% del básico por
año de antigüedad, y además se adiciona un plus por campeonatos ganados (5000$ si
ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
50.000$ si ha ganado más de 10 campeonatos).*/
    
    
    public double calcularSueldoACobrar() {
        this.cobro = (sueldo + (sueldo * 0.10)* antiguedad);
        if (ganados > 0 && ganados < 5){
            this.cobro= cobro + 5000;
        }
        if (ganados > 4 && ganados < 11){
            this.cobro= cobro + 30000;
        }
        if (ganados > 10){
            this.cobro= cobro + 50000;
        }
        
        return cobro;
    }
    
    
    
}
