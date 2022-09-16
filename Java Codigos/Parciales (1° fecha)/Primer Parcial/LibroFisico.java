package Ejercicio1;

public class LibroFisico extends Libro { // crea un Libro Fisico a partir de libro

    // atributos
    private String tipotapa;

    // constructor
    public LibroFisico(String tipotapa, String titulo, double precio) {
        super(titulo, precio);
        this.tipotapa = tipotapa;
    }
    // getters and setter clasicos

    public String getTipotapa() {
        return tipotapa;
    }

    private void setTipotapa(String tipotapa) {
        this.tipotapa = tipotapa;
    }

    @Override // sobre escribe el metodo de Libro
    public double precioFinal() {
        return this.getPrecio() + this.IVA(); // retorna el precio más el iva
    }

}
