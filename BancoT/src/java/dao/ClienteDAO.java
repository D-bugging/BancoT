
package dao;

import bean.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import utils.ConnectionFactory;

public class ClienteDAO {
    
    private final Connection c;
	
	public ClienteDAO() throws SQLException, ClassNotFoundException{
		this.c = new ConnectionFactory().getConnection();
	}
	
	public Cliente inserir(Cliente cli) throws SQLException{
		String sql = "insert into cliente" + "(nome,dataNascimento)" + "values (?,?)";
		
		PreparedStatement stmt = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		
		stmt.setInt(1,pac.getId());
		stmt.setString(2, pac.getNome());
		stmt.setString(3, pac.getLogin());
		stmt.setString(4, pac.getSenha());
		
		stmt.executeUpdate();
		
		ResultSet rs = stmt.getGeneratedKeys();
		if (rs.next()) {
			int id = rs.getInt(1);
			pac.setId(id);
		}
		stmt.close();
		return pac;
	}
    
}
