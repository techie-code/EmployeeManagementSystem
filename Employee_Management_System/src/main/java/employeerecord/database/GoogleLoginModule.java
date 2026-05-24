package employeerecord.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.security.auth.Subject;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.UnsupportedCallbackException;
import javax.security.auth.login.LoginException;
import javax.security.auth.spi.LoginModule;

public class GoogleLoginModule implements LoginModule {
	private CallbackHandler callbackHandler;
	private Subject subject;
	private UserPrincipal userPrincipal;
	private RolePrincipal rolePrincipal;
	private String username;
	private String role;
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	public GoogleLoginModule() throws ClassNotFoundException,SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
	}
	@Override
	public void initialize(Subject subject, CallbackHandler callbackHandler, Map<String, ?> sharedState,
			Map<String, ?> options) {
		// TODO Auto-generated method stub
		this.callbackHandler=callbackHandler;
		this.subject=subject;
	}
    //To login
	@Override
	public boolean login() throws LoginException {
		// TODO Auto-generated method stub
		boolean validuser=false;
		Callback[] callback=new Callback[1];
		callback[0]=new NameCallback("Username");
		try {
			callbackHandler.handle(callback);
			String name=((NameCallback)callback[0]).getName();
			System.out.println(name);
			validuser=isValidUser(name);
			if(validuser==true) {
				username=name;
				role=userRole(name);
				return validuser;
			}
			System.out.println("authentication failed");
			throw new LoginException("Authentication failed");
		}catch(Exception e) {
			System.out.println("Exception in login "+e);
		}
		return validuser;
	}
	//To check role
	private String userRole(String name) throws SQLException {
		String roleval=new String();
		ps=con.prepareStatement("SELECT * FROM user_roles WHERE username='"+name+"'");
		rs=ps.executeQuery();
		if(rs.next()) {
			System.out.println(rs.getString(2));
			roleval=rs.getString(2);
		}
		return roleval;
	}
	//To check the user is valid or not
	private boolean isValidUser(String name) throws SQLException {
		// TODO Auto-generated method stub
		boolean validuser=false;
		ps=con.prepareStatement("SELECT * FROM user_roles WHERE username='"+name+"'");
		rs=ps.executeQuery();
		validuser=rs.isBeforeFirst();
		return validuser;
	}
	@Override
	public boolean commit() throws LoginException {
		userPrincipal=new UserPrincipal(username);
		subject.getPrincipals().add(userPrincipal);
		rolePrincipal=new RolePrincipal(role);
		subject.getPrincipals().add(rolePrincipal);
		return true;
	}

	@Override
	public boolean abort() throws LoginException {
		// TODO Auto-generated method stub
		return false;
	}
	//To logout
	@Override
	public boolean logout() throws LoginException {
		subject.getPrincipals().remove(userPrincipal);
		subject.getPrincipals().remove(rolePrincipal);
		return true;
	}

}
