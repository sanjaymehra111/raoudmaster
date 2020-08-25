package com.raoudmarket.controller;

import java.math.BigInteger;
import java.security.MessageDigest;

import org.springframework.stereotype.Repository;

@Repository
public class PasswordEncryption {

	public String PasswordEncrypt(String pwd)
	{
		String ecpwd = null;

		try
		{
			MessageDigest msg = MessageDigest.getInstance("SHA-512");
			msg.reset();
			msg.update(pwd.getBytes("utf-8"));
			ecpwd = String.format("%0128x", new BigInteger(1,msg.digest())); 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return ecpwd;
	}
}
