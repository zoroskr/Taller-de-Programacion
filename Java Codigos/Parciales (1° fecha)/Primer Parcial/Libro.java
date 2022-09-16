package Ejercicio1;

public abstract class Libro { // se declara una clase abstracta
    // se declaran los atributos
    private String titulo; 
    private double precio;
    private String[] autores;
    private int dimlaut;
    
    // se declara el constructor
    public Libro(String titulo, double precio) {
        this.titulo = titulo;
        this.precio = precio;
        this.autores = new String[7]; // se crea un vector de 8 posiciones
        this.dimlaut = 0; // se inicializa la dimL en 0 para recorrer el vector
    }

    // setters and getters clasicos
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

    // crea un meotodo para calcular el IVA
    public double IVA() {
        return this.getPrecio() * 0.21; // retorna la multiplicacion del precio ingresado por o.21
    }

    // crea un metodo para agregar un autor
    public void agregarAutor(String autor) {
        this.getAutores()[this.getDimlaut()] = autor; //guarda un autor en la posicion del vector "dimL"
        this.setDimlaut(this.getDimlaut() + 1); // aumenta la dimL en 1
    }

    public abstract double precioFinal();

    @Override
    public String toString() {
        return "Libro{" + "titulo=" + titulo + ", precio=" + this.precioFinal() + ", priautor=" + autores[0] + '}';
    }
}
