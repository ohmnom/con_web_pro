package com.nucleus.dao;

import java.util.Set;

import com.nucleus.model.Question;

public class QuestionsDaoImpl implements QuestionDao
{
	
	
	@Override
	public void setToDb(Set<Question> setToDb)
	{
		for(@SuppressWarnings("unused") Question ques:setToDb)
		{
			//to-do save
			
		}
		
	}
	
	

}
