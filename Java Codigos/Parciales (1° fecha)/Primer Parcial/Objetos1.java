package Ejercicio1;

public class Objetos1 {

    public static void main(String[] args) { // se crea la super clase 
        
        // se crean los objetos
        LibroDigital l1 = new LibroDigital("pdf", 10, "tituloLibroDigital", 10); 
        LibroFisico l2 = new LibroFisico("dura", "tituloLibroFisico", 10); 
        
        // se crean variables para autores
        String a1 = "a1";
        String a2 = "a2";
        String a3 = "a3";
        
        // se utiliza el metodo agregar autor en el libro digital pasandole los "a´s" creados
        l1.agregarAutor(a1);
        l1.agregarAutor(a2);
        l1.agregarAutor(a3);

         // se utiliza el metodo agregar autor en el libro fisico pasandole los "a´s" creados
        l2.agregarAutor(a1);
        l2.agregarAutor(a2);
        l2.agregarAutor(a3);
        
        
        // se imprimen los libros
        System.out.println(l1.toString());
        System.out.println(l2.toString());
    }

}
/*
1) Queremos representar libros electrónicos e impresos. De cualquier libro se conoce: título, precio base y
el nombre de los autores (a lo sumo 8).

Adicionalmente: los libros electrónicos tienen el formato (ej: “.pdf”, “.epub”) y su tamaño en MB; mientras que los libros impresos registran si es tapa dura o no.

a) Implemente las clases del modelo con sus atributos y getters/setters adecuados. Provea constructores para iniciar los libros a partir de toda su información y sin autores.

b) Agregue a las clases implementadas los métodos necesarios para incorporar la siguiente funcionalidad:
i- Agregar al libro un autor cuyo nombre se recibe. Asuma que hay espacio..
ii- Obtener el precio final del libro. 
Para ambos libros el precio final surge de adicionar al precio base el IVA (21% del precio base).
Además, para los libros electrónicos se adiciona un impuesto de descarga de 2,5$ por MB.

iii- Obtener la representación String del libro, la cual se compone de título, precio final y el nombre de su primer autor.

2) Realice un programa que instancie un libro electrónico y un libro impreso. Cargue 3 autores a cada uno. Para finalizar, muestre la representación String de los libros.
 */
