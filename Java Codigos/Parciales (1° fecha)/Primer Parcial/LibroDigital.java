package Ejercicio1;

public class LibroDigital extends Libro { // crea un Libro Digital a partir de un libro

    // atributos
    private String formato; 
    private double tamanio;

    //constructor
    public LibroDigital(String formato, double tamanio, String titulo, double precio) {
        super(titulo, precio);
        this.formato = formato;
        this.tamanio = tamanio;
    }

    // getters and setters clasicos
    public String getFormato() {
        return formato;
    }

    private void setFormato(String formato) {
        this.formato = formato;
    }

    public double getTamanio() {
        return tamanio;
    }

    private void setTamanio(double tamanio) {
        this.tamanio = tamanio;
    }

    // para obtener el precio total por peso
    private double precioPeso() {
        return this.getTamanio() * 2.5; // retorna el tamaño por 2.5
    }

    @Override // sobre escribe el metodo del Libro
    public double precioFinal() {
        return this.getPrecio() + this.IVA() + this.precioPeso(); // retorna la suma del precio más el iva más el precio por peso
    }
}
