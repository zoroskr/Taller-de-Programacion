package Ejercicio1;

public class LibroFisico extends Libro {

    private String tipotapa;

    public LibroFisico(String tipotapa, String titulo, double precio) {
        super(titulo, precio);
        this.tipotapa = tipotapa;
    }

    public String getTipotapa() {
        return tipotapa;
    }

    private void setTipotapa(String tipotapa) {
        this.tipotapa = tipotapa;
    }

    @Override
    public double precioFinal() {
        return this.getPrecio() + this.IVA();
    }

}
