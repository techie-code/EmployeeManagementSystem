package employeerecord.database;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryption {
	public static String encryption(String password) throws NoSuchAlgorithmException {
		MessageDigest messageDigest=MessageDigest.getInstance("SHA-256");
		messageDigest.update(password.getBytes());
		byte[] encrypt=messageDigest.digest();
		StringBuilder encryptPassword=new StringBuilder();
		for(byte b: encrypt) {
			encryptPassword.append(String.format("%02x", b));
		}
		return encryptPassword.toString();
	}
}
