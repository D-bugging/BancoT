/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backendcarapicuibateste.controle;

import backendcarapicuibateste.bean.Usuario;
import backendcarapicuibateste.dao.UsuarioDao;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author ProfAlexandre
 */
public class ControleUsuario {
    
    static UsuarioDao usuDao ;
    static ControlePessoaFisica pesCont ;
    
    public ControleUsuario() throws SQLException, ClassNotFoundException {
        usuDao = new UsuarioDao();
        pesCont = new ControlePessoaFisica();
    }
    
    public List<Usuario> listarTodosUsuario() throws SQLException {
        return usuDao.listaTodos();
    }
    
    public Usuario validaUsuario(Usuario usu) throws SQLException, ClassNotFoundException {
        usu = usuDao.validaLogin(usu);
        usu.setPf(pesCont.buscaPessoaFisica(usu));
        return usu;
    }
    
    public Usuario inserirUsuario(Usuario usu) throws SQLException, ClassNotFoundException {
        return usuDao.inseri(usu);
    }
    
    public Usuario inserirUsuarioComPessoa(Usuario usu) throws SQLException, ClassNotFoundException {
        usu.setPf(pesCont.inseriPessoaFisica(usu.getPf()));
        return usuDao.inseri(usu);
    }
    
    public Usuario excluirUsuario(Usuario usu) throws SQLException {
        return usuDao.exclui(usu);
    }

    public Usuario buscarUsuario(Usuario usu) throws SQLException {
        return usuDao.busca(usu);
    }

    public Usuario alterarUsuario(Usuario usu) throws SQLException {
        return usuDao.altera(usu);
    }
    
    public List<Usuario> listarUsuario(Usuario usu) throws SQLException {
        return usuDao.lista(usu);
    }
    
}
