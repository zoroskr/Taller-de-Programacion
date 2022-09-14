System.out.print("Hola mundo!"); // un solo dato

int año = 2018;
System.out.println("Hola mundo" + año +"!"); // más de un dato

String nombre = Lector.leerString(); //lee y devuelve el string ingresado antes del enter, si deseamos otro tipo de datos debemos modificar el "leer"

GeneradorAleatorio.iniciar(); // inicia generador aleatorio
System.out.println(Generador.Aleatorio.generarDouble(10)) // imprime un double entre 0 y 9
  
int i;
for (i=1; 1<=10; i++) // la primera i es una inicializacion, la segunda es una condicion y la tercera incrementa en 1 a i cuando el for termina
    System.out.println(i); // imprime i desde 1 hasta 10

  
int[]contador = new int[10]; // se declara una array desde 0 a 9
for (i=0; i<10; i++)contador[i]=i; // en cada posicion del array lo iguala a i
...
 System.out.println("La Pos. 1 tiene" + contador[1]);


int[][]tabla = new int[3][4]; // se declara una array bidimencional de 3 filas y 4 columnas
for (i=0; i<3; i++)
  for (j=0; j<4; j++)
      tabla[i][j]=GeneradorAleatorio.generarInt(10); //guarda un entero aleatorio en la posicion i y j
...
 System.out.println("La Pos. 1,2 tiene" + tabla[1][2]); // imprime el array
  
 new Triangulo (10, 10, 10, "amarillo", "violeta"); // creacion de un objeto
 
 String saludo1 = new String("hola"); //estamos asignandole a la variable "saludo1" un objeto y lo inicializamos en "hola"
 String saludo1 = new String("hola"); //estamos asignandole a la variable "saludo2" un objeto y lo inicializamos en "hola"
 
 System.out.println(saludo1.lenght()); //imprime 4, con esto podemos imprimir el comportamiento del stream
 System.out.println(saludo1.toUpperCase().equals("HOLA")) //primero pone en mayusculas el string, luego compara con "HOLA" el string actual, imprime verdadero
 System.out.println(saludo1.charAt(0)) //imprime la primera letra del string "h"

 System.out.println(saludo1==saludo2); //esto retornaria falso porque más alla de que el comportamiento de los objetos sean iguales, no estan referenciados a lo mismo (compara referencias)
 System.out.println(saludo1.equals(saludo2)) // esto retorna verdadero porque su estado interno es igual en este caso (compara estados internos)
 saludo1 = saludo2 // le asignamos el mismo comportamiento y estado interno que "saludo" (estan referenciados al mismo objeto)
   
 public class Libro{     
 /*Declaracion del estado*/
 private String titulo;
 private String primerAutor;
 private String editorial;
 private int añoEdicion;
 private String ISBN;
 private double precio;
 
  /*Declaracion de metodos*/
  
 public String getTitulo(){ // el "string" despues de public hace referencia al tipo de dato que se retorna
  return titulo;
  } // devuelve el valor del titulo
  
 public String setTitulo(String unTitulo){ // "String unTitulo" es un parametro, para recibir argumentos
  titulo= unTitulo;
  } // permite modificar el valor del titulo
 
 public String toString(){
  String aux= titulo + "por" + primerAutor + "-" +
        añoEdicion +"- ISBN:" + ISBN;
  return aux;
  } //devuelve la informacion en un string
 }
 
public class Main {
    public static void main (String [] args) {
      String unTitulo = Lector.leerString(); // leemos un string y lo guardamos en "unTitulo"
      
      Libro libro1 = new Libro (); // creamos un objeto de tipo libro
      libro1.setTitulo(unTitulo); // llamamos al metodo "setTitulo" y le enviamos como argumento "unTitulo"
    }
}
 
 
  
 

 
