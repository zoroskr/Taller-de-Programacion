public abstract class serVivo { // si en la clase hay un metodo abstracto la clase tambien debe serlo
  public abstract void alimentarse();
}

public class Planta extends serVivo { // indico que heredo los metodos de serVivo
  @Override //significa que voy a sobreescribir el metodo invocado
  public void alimentarse{
    System.out.println("La planta se alimenta a traves de la fotosintesis");
  }
}
