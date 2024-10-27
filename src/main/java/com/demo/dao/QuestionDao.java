package com.demo.dao;

import java.util.Set;

import org.springframework.stereotype.Repository;

import com.demo.model.Question;

@Repository
public interface QuestionDao
{
	public void setToDb(Set<Question> setToDb);
}
