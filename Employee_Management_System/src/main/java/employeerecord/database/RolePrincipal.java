package employeerecord.database;

import java.security.Principal;

public class RolePrincipal implements Principal {

	private String name;
	public RolePrincipal(String name) {
		// TODO Auto-generated constructor stub
		this.name=name;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return name;
	}

}
