// consiste en reutilizar codigo, donde hay una super clase y una/algunas clases hijas

public class Persona {
  protected String nombre; // protected indica que puede ser accedido por la clase y por los hijos de esta
  private String apellido;
  private int edad;
  
  public Persona (String nombre, String apellido, int edad) {
    this.nombre = nombre;
    this.apellido = apellido;
    this.edad = edad;
  }
  
  public String getNombre () {
    return nombre;
  }
  
   public String getApellido () {
    return apellido;
  }

   public int getEdad () {
    return edad;
  }
}

public class Estudiante extends Persona{ // con la palabra "extends" decimos que "estudiante" hereda los atributos y metodos de "persona"
    private int codigoEstudiante;
    private float notaFinal; // atributos propios de "estudiante"
  
    public Estudiante (String nombre, String apellido, int edad, int codigoEstudiante, float notaFinal){
      super(nombre,apellido,edad); // con la palabra super le indicamos a java que esos atributos ya estan inicializados
      this.codigoEstudiante = codigoEstudiante;
      this.notaFinal = notaFinal;
    }
    public void mostrarDatos (){
       System.out.println("Nombre:" + nombre);
       System.out.println("Apellido:" + getApellido()); // como apellido es de tipo private no puede ser invocado, entonces debemos llamar a uno de los metodos heredados
    }
}

public class Principal {
   public static void main(String [] args) {
     Estudiante estudiante = new Estudiante("Alejandro", "Taboada",21,123,15,6f);
     
     estudiante.mostrarDatos();
   }
}
