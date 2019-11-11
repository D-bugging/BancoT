
package bean;

public class Cliente extends Pessoa {
    
    private int numeroCartao,pin;
    private String nome, dataNascimento;
    private Endereco endereco;


    public int getNumeroCartao() {
        return numeroCartao;
    }

    public void setNumeroCartao(int numeroCartao) {
        this.numeroCartao = numeroCartao;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }
    
}
