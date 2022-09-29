/*
Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String). El círculo debe saber:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el área y devolverla (método calcularArea)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.PI
 */
package tema3;

public class circulos {
    private double radio;
    private String relleno;
    private String linea;
    private double area;
    private double perimetro;

    public circulos(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
    public double calcularArea (){
        this.area = Math.PI * radio;
        return area;
    }
    
    public double calcularPerimetro (){
        this.perimetro = 2*Math.PI * radio;
        return perimetro;
    }
}
