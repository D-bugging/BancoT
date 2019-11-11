
package bean;

public class TransacoesCaixa {
    
    private int idTransacao;
    private String dataTransacao, tipo, posBalanco;
    private double valor;

    public int getIdTransacao() {
        return idTransacao;
    }

    public void setIdTransacao(int idTransacao) {
        this.idTransacao = idTransacao;
    }

    public String getDataTransacao() {
        return dataTransacao;
    }

    public void setDataTransacao(String dataTransacao) {
        this.dataTransacao = dataTransacao;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPosBalanco() {
        return posBalanco;
    }

    public void setPosBalanco(String posBalanco) {
        this.posBalanco = posBalanco;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
    
    
    
}
