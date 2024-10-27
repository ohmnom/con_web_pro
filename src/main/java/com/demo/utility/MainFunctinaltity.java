package com.demo.utility;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.security.core.Authentication;
import org.springframework.web.context.ServletContextAware;

import com.demo.model.Event;
import com.demo.model.Question;
import com.demo.model.User;

public class MainFunctinaltity implements ServletContextAware
{
	private static int quesId = 0;
	
	private static final String QUESTIONSLIST = "questions";
	private static final String ACTIVEEVENTS = "activeEvents";
	private static final String WITHOUTANSWEREDQUESTIONS = "questionsListWithoutAnsweredQuestions";
	private static final String SCHEDULEDEVENNTS = "scheduledEvents";
	
	List<Question> setDemo=new ArrayList<>();
	List<Question> setToDb=new ArrayList<>();
	List<Event> eventList = new ArrayList<>();
	List<User> activeUsers = new ArrayList<>();
	List<Question> questionsListWithoutAnsweredQuestions = new ArrayList<>();	
	List<Event> scheduledEvents = new ArrayList<>();
	Queue<Question> setQDemo=new PriorityQueue<>();
	Set<String> setSDemo = new HashSet<>();
	Map<Integer,Question> setMDemo = new HashMap<>();
	
		
	@Override
	public void setServletContext(ServletContext servletContext) 
	{
		//Saving various lists to ServletContext.
		setSDemo.add("Ashutosh");
		setSDemo.add("Ashutosh");
		servletContext.setAttribute(QUESTIONSLIST, setDemo);
		servletContext.setAttribute(ACTIVEEVENTS, eventList);
		servletContext.setAttribute(WITHOUTANSWEREDQUESTIONS, questionsListWithoutAnsweredQuestions);
		servletContext.setAttribute(SCHEDULEDEVENNTS, scheduledEvents);
	}
	
	@SuppressWarnings("unchecked")
	public void saveQuestion(String ques,String sessionId,ServletContext servletContext, Authentication authentication)
	{	
		//quesId has to be unique so it will come from DB(auto generated)
		Question question=new Question(++quesId,ques,sessionId,0,authentication.getName(),new ArrayList<String>(),"Un-Answered");		
		((List<Question>) servletContext.getAttribute(QUESTIONSLIST)).add(question);
		((List<Question>) servletContext.getAttribute(WITHOUTANSWEREDQUESTIONS)).add(question);
            //to-do null-pointer exception handling for event not created
	}
		
	@SuppressWarnings("unchecked")
	public List<Question> getAllQuestions(String sessionId, ServletContext servletContext)
	{
		//returns list of questions with sessionId given as parameter
		List<Question> specialList = new ArrayList<>();		
		for(Question ques : setDemo)
		{
			if(ques.getLinkId()==sessionId)
			{
				specialList.add(ques);				
			}
		}
		specialList = (List<Question>) servletContext.getAttribute(QUESTIONSLIST);
		Collections.sort(specialList);
		return specialList;
	}
		
	public void pushSessionQuestions(String sessionId)
	{
		//pushes data to database and removes data from TreeSet corresponding to a sessionId
		for(Question ques : setDemo)
		{
			//to-do
			//query to push data from TreeSet to Database
			if(ques.getLinkId()==sessionId)
			{
				setToDb.add(ques);
				setDemo.remove(ques);
			}
		}
	}
	
	public List<Question> pushToDao()
	{
		return setToDb;
	}

	@SuppressWarnings("unchecked")
	public void createEvent(Event event, ServletContext servletContext)
	{
		//Saves object of event to active events.
		
		event.setQuestion(new ArrayList<Question>());
		List<Event> activeEvents = (List<Event>) servletContext.getAttribute(ACTIVEEVENTS);
		activeEvents.add(event);
		servletContext.setAttribute(ACTIVEEVENTS, activeEvents);
	}
	
	//For Scheduled Events
	@SuppressWarnings("unchecked")
	public void createScheduledEvent(Event event, ServletContext servletContext)
	{
		scheduledEvents = (List<Event>) servletContext.getAttribute(SCHEDULEDEVENNTS);
		scheduledEvents.add(event);
		servletContext.setAttribute(SCHEDULEDEVENNTS, scheduledEvents);
	}
	
	@SuppressWarnings("unchecked")
	public List<Event> getAllActiveEvents(ServletContext servletContext)
	{
		//Returns list of all active events.
		if(servletContext.getAttribute(ACTIVEEVENTS)==null)
		{
			this.setServletContext(servletContext);
		}
		return (List<Event>) servletContext.getAttribute("activeEvents");
	}
	
	
	public List<Event> getAllScheduledEvents(String userName,ServletContext servletContext)
	{
		//Returns filtered list of event scheduled.
		
		List<Event> filteredList = new ArrayList<>();
		
		if(servletContext.getAttribute(SCHEDULEDEVENNTS)==null)
		{
			this.setServletContext(servletContext);
			filteredList = null;
			return filteredList;
		}
		else
		{
			for(Event event : scheduledEvents)
			{
				System.out.println("============="+event.getHostName()+"============"+userName+"============");
				if(event.getHostName().equals(userName))
				{
					filteredList.add(event);				
				}
			}
			return filteredList;
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Question> getAllQuestionsForSpeakerAnswering(String sessionId, ServletContext servletContext)
	{
		//Returns list of questions with sessionId given as parameter.
		
		List<Question> specialList = new ArrayList<>();		
		for(Question ques : questionsListWithoutAnsweredQuestions)
		{
			if(ques.getLinkId()==sessionId)
			{
				specialList.add(ques);				
			}
		}
		specialList = (List<Question>) servletContext.getAttribute(WITHOUTANSWEREDQUESTIONS);
		Collections.sort(specialList);
		return specialList;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public void removeAnsweredQuestion(int quesId,ServletContext servletContext)
	{
		//This method removes answered from not answered question's list.
		
		List<Question> tempListWithoutAnsweredQuestions = new ArrayList<>();
		tempListWithoutAnsweredQuestions.addAll((List<Question>) servletContext.getAttribute(WITHOUTANSWEREDQUESTIONS));
		
		for(Question ques : setDemo)
		{
			if(ques.getQuesId()==quesId)
			{
				tempListWithoutAnsweredQuestions.remove(ques);
			}
		}
		servletContext.setAttribute(WITHOUTANSWEREDQUESTIONS, tempListWithoutAnsweredQuestions);
	}
	
	@SuppressWarnings("unchecked")
	public void removeSessionQuestions(String linkId,ServletContext servletContext)
	{
		//This methods removes the session generated questions at the end of the session.
		
		List<Question> tempListOfQuestions = new ArrayList<>();
		tempListOfQuestions.addAll((List<Question>) servletContext.getAttribute(QUESTIONSLIST));
		
		for(Question ques : (List<Question>) servletContext.getAttribute(QUESTIONSLIST))
		{
			if(ques.getLinkId().equals(linkId))
			{
				tempListOfQuestions.remove(ques);
			}
		}
		servletContext.setAttribute(QUESTIONSLIST, tempListOfQuestions);
	}
	
	public boolean checkForActiveEvent(String linkId,ServletContext servletContext)
	{
		//This method checks for active event with linkId in active events list.
		
		int temp = 0;
		
		for(Event event : this.getAllActiveEvents(servletContext))
		{
			if(event.getLinkId().equals(linkId))
			{
				++temp;
			}
		}
		return (temp>0);
	}
	
	public Event getEventDetails(String linkId, ServletContext servletContext)
	{
		//Returns Object of Event based on parameter "Link Id".
		
		Event tempEvent = null;
		
		for(Event event : this.getAllActiveEvents(servletContext))
		{
			if(event.getLinkId().equals(linkId))
			{
				tempEvent = event;
			}
		}
		return tempEvent;
	}
		
}
