package com.nucleus.dao;

import java.util.Set;

import org.springframework.stereotype.Repository;

import com.nucleus.model.Question;

@Repository
public interface QuestionDao
{
	public void setToDb(Set<Question> setToDb);
}
