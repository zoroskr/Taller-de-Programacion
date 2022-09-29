/*
Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el área y devolverla (método calcularArea)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
 */
package tema3;

public class triangulos {
    double lado1;
    double lado2;
    double lado3;
    String colorRelleno;
    String colorLinea;

    public triangulos(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calularArea(double lado1, double lado2, double lado3){ 
        double s = (lado1 + lado2 + lado3)/2;
        double area = Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
        return area;
    }
    
    public double calularPerimetro(double lado1, double lado2, double lado3){ 
        double perimetro = lado1 + lado2 + lado3;
        return perimetro;
    }

    @Override
    public String toString() {
        return "triangulos{" + "lado1=" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 + ", colorRelleno=" + colorRelleno + ", colorLinea=" + colorLinea + '}';
    }
    
    
    
}
