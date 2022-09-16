package Ejercicio1;

public class LibroDigital extends Libro {

    private String formato;
    private double tamanio;

    public LibroDigital(String formato, double tamanio, String titulo, double precio) {
        super(titulo, precio);
        this.formato = formato;
        this.tamanio = tamanio;
    }

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

    private double precioPeso() {
        return this.getTamanio() * 2.5;
    }

    @Override
    public double precioFinal() {
        return this.getPrecio() + this.IVA() + this.precioPeso();
    }
}
