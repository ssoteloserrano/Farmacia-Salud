package sample.modelo;

import javafx.beans.property.*;

public class Producto {
    private IntegerProperty IDproducto;
    private StringProperty Nombre;
    private StringProperty Forma_farmaceutica;
    private IntegerProperty Dosis_Contenido;
    private StringProperty Unidad_medida;
    private BooleanProperty Restriccion;
    private BooleanProperty Descontinuado;
    private BooleanProperty Generico;
    private IntegerProperty StockBodega;
    private IntegerProperty StockEstante;

    public Producto(int IDproducto, String Nombre, String Forma_farmaceutica,
                    int Dosis_Contenido, String Unidad_medida, boolean Restriccion,
                    boolean Descontinuado, boolean Generico, int StockBodega,
                    int StockEstante) {
        this.IDproducto = new SimpleIntegerProperty(IDproducto);
        this.Nombre = new SimpleStringProperty(Nombre);
        this.Forma_farmaceutica = new SimpleStringProperty(Forma_farmaceutica);
        this.Dosis_Contenido = new SimpleIntegerProperty(Dosis_Contenido);
        this.Unidad_medida = new SimpleStringProperty(Unidad_medida);
        this.Restriccion = new SimpleBooleanProperty(Restriccion);
        this.Descontinuado = new SimpleBooleanProperty(Descontinuado);
        this.Generico = new SimpleBooleanProperty(Generico);
        this.StockBodega = new SimpleIntegerProperty(StockBodega);
        this.StockEstante = new SimpleIntegerProperty(StockEstante);
    }

    //Metodos atributo: IDproducto
    public int getIDproducto() {
        return IDproducto.get();
    }
    public void setIDproducto(int IDproducto) {
        this.IDproducto = new SimpleIntegerProperty(IDproducto);
    }
    public IntegerProperty IDproductoProperty() {
        return IDproducto;
    }

    //Metodos atributo: Nombre
    public String getNombre() {
        return Nombre.get();
    }
    public void setNombre(String Nombre) {
        this.Nombre = new SimpleStringProperty(Nombre);
    }
    public StringProperty NombreProperty() {
        return Nombre;
    }

    //Metodos atributo: Forma_farmaceutica
    public String getForma_farmaceutica() {
        return Forma_farmaceutica.get();
    }
    public void setForma_farmaceutica(String Forma_farmaceutica) {
        this.Forma_farmaceutica = new SimpleStringProperty(Forma_farmaceutica);
    }
    public StringProperty Forma_farmaceuticaProperty() {
        return Forma_farmaceutica;
    }

    //Metodos atributo: Dosis_Contenido
    public int getDosis_Contenido() {
        return Dosis_Contenido.get();
    }
    public void setDosis_Contenido(int Dosis_Contenido) {
        this.Dosis_Contenido = new SimpleIntegerProperty(Dosis_Contenido);
    }
    public IntegerProperty Dosis_ContenidoProperty() {
        return Dosis_Contenido;
    }

    //Metodos atributo: Unidad_medida
    public String getUnidad_medida() {
        return Unidad_medida.get();
    }
    public void setUnidad_medida(String Unidad_medida) {
        this.Unidad_medida = new SimpleStringProperty(Unidad_medida);
    }
    public StringProperty Unidad_medidaProperty() {
        return Unidad_medida;
    }

    //Metodos atributo: Restriccion
    public boolean getRestriccion() {
        return Restriccion.get();
    }
    public void setRestriccion(boolean Restriccion) {
        this.Restriccion = new SimpleBooleanProperty(Restriccion);
    }
    public BooleanProperty RestriccionProperty() {
        return Restriccion;
    }

    //Metodos atributo: Descontinuado
    public boolean getDescontinuado() {
        return Descontinuado.get();
    }
    public void setDescontinuado(boolean Descontinuado) {
        this.Descontinuado = new SimpleBooleanProperty(Descontinuado);
    }
    public BooleanProperty DescontinuadoProperty() {
        return Descontinuado;
    }

    //Metodos atributo: Generico
    public boolean getGenerico() {
        return Generico.get();
    }
    public void setGenerico(Boolean Generico) {
        this.Generico = new SimpleBooleanProperty(Generico);
    }
    public BooleanProperty GenericoProperty() {
        return Generico;
    }

    //Metodos atributo: StockBodega
    public int getStockBodega() {
        return StockBodega.get();
    }
    public void setStockBodega(int StockBodega) {
        this.StockBodega = new SimpleIntegerProperty(StockBodega);
    }
    public IntegerProperty StockBodegaProperty() {
        return StockBodega;
    }

    //Metodos atributo: StockEstante
    public int getStockEstante() {
        return StockEstante.get();
    }
    public void setStockEstante(int StockEstante) {
        this.StockEstante = new SimpleIntegerProperty(StockEstante);
    }
    public IntegerProperty StockEstanteProperty() {
        return StockEstante;
    }
}