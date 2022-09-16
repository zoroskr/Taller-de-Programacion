package Ejercicio1;

public abstract class Libro {

    private String titulo;
    private double precio;
    private String[] autores;
    private int dimlaut;

    public Libro(String titulo, double precio) {
        this.titulo = titulo;
        this.precio = precio;
        this.autores = new String[7];
        this.dimlaut = 0;
    }

    public int getDimlaut() {
        return dimlaut;
    }

    private void setDimlaut(int dimlaut) {
        this.dimlaut = dimlaut;
    }

    public String getTitulo() {
        return titulo;
    }

    private void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public double getPrecio() {
        return precio;
    }

    private void setPrecio(double precio) {
        this.precio = precio;
    }

    public String[] getAutores() {
        return autores;
    }

    private void setAutores(String[] autores) {
        this.autores = autores;
    }

    public double IVA() {
        return this.getPrecio() * 0.21;
    }

    public void agregarAutor(String autor) {
        this.getAutores()[this.getDimlaut()] = autor;
        this.setDimlaut(this.getDimlaut() + 1);
    }

    public abstract double precioFinal();

    @Override
    public String toString() {
        return "Libro{" + "titulo=" + titulo + ", precio=" + this.precioFinal() + ", priautor=" + autores[0] + '}';
    }
}
