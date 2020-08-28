package com.raoudmarket.dao;

import java.util.UUID;

import org.springframework.stereotype.Repository;

@Repository
public class UniqueCodeGenerator {
	public String GetUniqueCode() 
	{
		UUID uuid=UUID.randomUUID();
	    String str=uuid.toString().replace("-", "");
	    return str;
	}
	
	

}
 

