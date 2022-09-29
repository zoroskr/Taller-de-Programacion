package tema3;

public class Estante {
    private Libro libro;
    private int dimF=5;
    private Libro vector[] = new Libro [dimF];
    private int dimL=0;
    private boolean ok = false;
    private Libro especifico;
    private int i;

    public Estante() {
    }

    public Estante(Libro libro) { 
        this.vector[dimL] = libro;
        this.dimL++;
    }

    public int retornarLibros(){
        return dimL;
    }
    
    public boolean retornarLleno (){
        if (dimL == dimF){
            this.ok = true;
        }
        return ok;
    }
    
    public void agregarLibro (Libro libro){
        this.vector[dimL] = libro;
        this.dimL++;
    }
    
    public Libro retornarEspecifico (String titulo){
        for (i=0; i<dimL; i++){
            if (vector[i].getTitulo().equals(titulo)){
                this.especifico = vector[i];
            }
        }
        return especifico;
    }
    
}
