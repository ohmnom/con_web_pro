  package com.demo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Event;
import com.demo.model.Question;
import com.demo.model.User;
import com.demo.service.Service;
import com.demo.utility.MainFunctinaltity;

@Controller
public class EventController
{
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	User user;
	
	@Autowired
	Service service;
	
	private static final String MESSAGEPAGE = "MessagePrintUser";
	private static final String MESSAGE = "message";
	private static final String EVENTID = "eventId";
	private static final String QUESTIONS = "questions";
	private static final String EVENTREDIRECT = "redirect:/event/";
	private static final String SESSIONENDMESSAGE = "Session Already Ended, Please Proceed To Dashboard.";
	
	MainFunctinaltity mainFunctinaltity = new MainFunctinaltity();
	
	String tempId;
	List<Event> tempListForActiveEvents = new ArrayList<>();
	
	String eventDate= null;
	Date tempDate = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String presentDate=simpleDateFormat.format(tempDate);
	
	
	
	@RequestMapping("/dashBoard")
	public ModelAndView dashboardRedirect(Authentication authentication, HttpServletRequest request) 
	{
		if(request.isUserInRole("ROLE_USER"))
		{
			return new ModelAndView("DashBoard");
		}
		return new ModelAndView("DashBoard", "scheduledEvents",mainFunctinaltity.getAllScheduledEvents(authentication.getName(), servletContext));
	}
	
	@RequestMapping("/NewEvent")
	public ModelAndView newEventRedirect(HttpServletRequest request)
	{
		return new ModelAndView("CreateEvent");
	}
	
	@RequestMapping("/ScheduleEvent")
	public String scheduledEventRedirect()
	{
		return "ScheduleEvent";
	}
	
	@RequestMapping(value="/createEventSubmit", method=RequestMethod.POST)
	public ModelAndView confirmEventRedirect(@RequestParam("eventName")String eventName ,@RequestParam("location")String location , @RequestParam("eventDesc")String description,  Authentication authentication )
	{
		mainFunctinaltity.setServletContext(servletContext);
		eventDate = presentDate;   
		String id = UUID.randomUUID().toString();
		String linkId = id.substring(0, 8).toUpperCase();
		User speaker = service.findUser(authentication.getName());
		ModelAndView model=new ModelAndView("ConfirmEvent");	
			 
		Event event = new Event(eventName, linkId, presentDate, description, authentication.getName(),null,null,true,location);
		mainFunctinaltity.createEvent(event,servletContext);
		model.addObject(EVENTID, linkId);
		model.addObject("eventName", eventName);
		model.addObject("description", description);
		model.addObject("date", presentDate);
		model.addObject("speakerName",speaker.getFirstName()+" "+speaker.getLastName());
		model.addObject("user",user);		
		return model;
	}  
	
	@RequestMapping(value="/scheduledEventSubmit", method=RequestMethod.POST)
	public ModelAndView confirmScheduledEventRedirect(@RequestParam("eventName")String eventName , @RequestParam("eventDesc")String description, @RequestParam("location")String location ,@RequestParam("date")String date , @RequestParam("location")String locations, Authentication authentication,User user)
	{
		eventDate = date;
		String id = UUID.randomUUID().toString();
		String linkId = id.substring(0, 8).toUpperCase();
		if(eventDate.equals(presentDate))
		{

			ModelAndView model = new ModelAndView(MESSAGEPAGE);
			model.addObject(MESSAGE,"Event Date Is Today, Please Start An Event Directly.");
			model.addObject("user",user);
			return model;
		}
		Event event = new Event(eventName, linkId, eventDate, description, authentication.getName(), null,null, false,location);
		
		mainFunctinaltity.getAllScheduledEvents(authentication.getName(),servletContext);
		mainFunctinaltity.createScheduledEvent(event, servletContext);
		
		
		ModelAndView model = new ModelAndView(MESSAGEPAGE);
		model.addObject(MESSAGE,"Event Successfully Scheduled. Please Proceed To The DashBoard");
		model.addObject("user",user);
		return model;
	}
	         
	@RequestMapping(value="/event/{eventId}")
	public ModelAndView event(@PathVariable(EVENTID) String linkId)
	{	
		List<Question> filteredQuestions = new ArrayList<>();
		
		tempId=linkId;
		
		ModelAndView model=new ModelAndView("QuestionWall");
		model.addObject(EVENTID, linkId);
		
		for(Question question : mainFunctinaltity.getAllQuestions(tempId,servletContext))
		{
			if(question.getLinkId().equals(linkId))
			{
				filteredQuestions.add(question);
				
			}
		}
		model.addObject(QUESTIONS,filteredQuestions);
		
		return model;
	}
	
	@RequestMapping(value="/event/{eventId}/submitQuestion", method = RequestMethod.POST)
	public ModelAndView addQuestionToList(@PathVariable("eventId") String linkId,@RequestParam ("comment") String questionString, Authentication authentication)
	{
		if (mainFunctinaltity.checkForActiveEvent(linkId, servletContext))
		{
			mainFunctinaltity.saveQuestion(questionString, linkId, servletContext, authentication);
			return new ModelAndView(EVENTREDIRECT + linkId);
		}
		else
		{
			return new ModelAndView("redirect:/sessionEnded");
		}
	}
	
	@RequestMapping("/joinEvent")
	public ModelAndView joinEventRedirect()
	{
		return new ModelAndView("JoinEvent");
	}
	
	@RequestMapping(value="/joinEventSubmit", method=RequestMethod.POST)
	public ModelAndView joinEventSubmitRedirect(@RequestParam(EVENTID) String linkId, User user)
	{
		ModelAndView model = new ModelAndView(MESSAGEPAGE);	
		
		if(mainFunctinaltity.checkForActiveEvent(linkId,servletContext))
			{
				if (presentDate.equals(eventDate))
				{
					Event event = mainFunctinaltity.getEventDetails(linkId, servletContext);
					User userSpeaker = service.findUser(event.getHostName());
					ModelAndView modelAndView = new ModelAndView("ConfirmEvent");
					modelAndView.addObject("eventId", linkId);
					modelAndView.addObject("eventName",(String) event.getEventName());
					modelAndView.addObject("description", event.getDescription());
					modelAndView.addObject("date", eventDate);
					modelAndView.addObject("speakerName", userSpeaker.getFirstName()+" "+userSpeaker.getLastName());
					modelAndView.addObject("user",user);
					return modelAndView;
				} 
				else
				{
					return new ModelAndView(MESSAGEPAGE, MESSAGE,"Event With ID : " + linkId + " Is Not Live Right Now, Please Try Again Later.");
				}
			}
		else
		{
			model.addObject(MESSAGE, "Event With LinkId : "+ linkId+" Does Not Exists.");
			model.addObject("user",user);
			
			return model;
		}
	}
	
	@RequestMapping(value="/event/{linkId}/target/{target}", method = RequestMethod.GET)
	public ModelAndView speakerQuestionWallRedirect(@PathVariable("linkId") String linkId, @PathVariable("target") String target,Authentication authentication)
	{
		List<Event> tempList = new ArrayList<>();

		if (target.equals("end") && mainFunctinaltity.checkForActiveEvent(linkId, servletContext) )
		{
			tempList.addAll(mainFunctinaltity.getAllActiveEvents(servletContext));
				for (Event event : mainFunctinaltity.getAllActiveEvents(servletContext))
				{
					if (event.getLinkId().equals(linkId))
					{
						tempList.remove(event);
						mainFunctinaltity.removeSessionQuestions(linkId, servletContext); 
					}
				}
				servletContext.setAttribute("activeEvents", tempList);
				tempListForActiveEvents = mainFunctinaltity.getAllActiveEvents(servletContext);

				return new ModelAndView("redirect:/sessionEndSuccess");			
		}
		else if(target.equals("switchView") && mainFunctinaltity.checkForActiveEvent(linkId, servletContext))
		{
			return new ModelAndView(EVENTREDIRECT + linkId + "/projectorMode");					
		}
		else if(target.equals("answerQuestion") && mainFunctinaltity.checkForActiveEvent(linkId, servletContext) )
		{
			return new ModelAndView(EVENTREDIRECT + linkId + "/answerQuestion");			
		}
		else
		{
			return new ModelAndView("redirect:/sessionEnded");
		}
	}
	
	@RequestMapping(value="/sessionEnded")
	public ModelAndView sessionAlreadyEndedRedirect()
	{
		ModelAndView model = new ModelAndView(MESSAGEPAGE);
		model.addObject("user", user);
		model.addObject(MESSAGE, SESSIONENDMESSAGE);
		return model;
	}
	
	@RequestMapping(value="/event/{linkId}/projectorMode")
	public ModelAndView projectorModeRedirect(@PathVariable("linkId") String linkId)
	{
		List<Question> filteredQuestions = new ArrayList<>();
		
		tempId=linkId;
		
		ModelAndView model=new ModelAndView("ProjectorMode");
		model.addObject(EVENTID, linkId);
		
		for(Question question : mainFunctinaltity.getAllQuestions(tempId,servletContext))
		{
			if(question.getLinkId().equals(linkId))
			{
				filteredQuestions.add(question);
			}
		}
		model.addObject("questions",filteredQuestions);
		
		return model;
	}
	
	
	@RequestMapping(value = "/event/{linkId}/answerQuestion")
	public ModelAndView answerQuestionRedirect(@PathVariable("linkId") String linkId,User user)
	{
		List<Question> filteredQuestions = new ArrayList<>();
		
		tempId = linkId;
		
		ModelAndView model = new ModelAndView("AnswerQuestion");
		model.addObject(EVENTID, linkId);
		
		for (Question question : mainFunctinaltity.getAllQuestionsForSpeakerAnswering(tempId, servletContext))
		{
			if (question.getLinkId().equals(linkId))
			{
				filteredQuestions.add(question);
			}
		}
		if (filteredQuestions.isEmpty())
		{
			return new ModelAndView(EVENTREDIRECT+linkId);
		} 
		else
		{
			model.addObject("question", filteredQuestions.get(0));
			return model;
		}
	}
	
	
	@RequestMapping(value = "/event/{linkId}/questionAnswered", method = RequestMethod.POST)
	public ModelAndView questionAnsweredRedirect(@PathVariable("linkId") String linkId,@RequestParam("status") int quesId) 
	{
		tempListForActiveEvents = mainFunctinaltity.getAllActiveEvents(servletContext);

		List<Question> questionList = mainFunctinaltity.getAllQuestionsForSpeakerAnswering(linkId, servletContext);
		
		for (Event event : tempListForActiveEvents)
		{
			if (event.getLinkId().equals(linkId))
			{
				for (Question question : questionList)
				{
					if (quesId == question.getQuesId())
					{
						question.setStatus("Answered By Speaker");
						mainFunctinaltity.removeAnsweredQuestion(quesId, servletContext);
					}
				}
			}
		}
		return new ModelAndView(EVENTREDIRECT + linkId + "/answerQuestion");
	}	
	
	@RequestMapping(value="/sessionEndSuccess")
	public ModelAndView sessionEnd()
	{
		servletContext.setAttribute("activeEvents", tempListForActiveEvents);
		
		ModelAndView model = new ModelAndView(MESSAGEPAGE);
		model.addObject(MESSAGE,"Thank You, Your Session ended Successfully.");
		model.addObject("user", user);
		
		return model;
	}
	
	@RequestMapping(value="/{eventId}/QuestionLike")
	public ModelAndView like(@PathVariable(EVENTID) String linkId, Authentication authentication, @RequestParam("data") int data)
	{
		tempListForActiveEvents = mainFunctinaltity.getAllActiveEvents(servletContext);
		
		List<Question>  questionList = mainFunctinaltity.getAllQuestions(linkId, servletContext);
		
		for(Event event : tempListForActiveEvents)
		{
			if(event.getLinkId().equals(linkId))
			{
				for(Question question: questionList)
				{
					if(!question.getVotedBy().contains(authentication.getName()) && question.getQuesId()== data)
					{
						question.getVotedBy().add(authentication.getName());
						question.setVote(question.getVote()+1);
					}
				}
			}
		}
		return new ModelAndView(EVENTREDIRECT+linkId);
	}
	
	@RequestMapping(value="/event/{eventId}/eventQuestionList")
	public ModelAndView eventQuestionList(@PathVariable(EVENTID) String linkId)
	{	
		List<Question> filteredQuestions = new ArrayList<>();
		
		tempId=linkId;
		
		ModelAndView model=new ModelAndView("QuestionWallList");
		model.addObject(EVENTID, linkId);
		
		for(Question question : mainFunctinaltity.getAllQuestions(tempId,servletContext))
		{
			if(question.getLinkId().equals(linkId))
			{	
				filteredQuestions.add(question);
			}
		}
		model.addObject(QUESTIONS,filteredQuestions);
		
		return model;
	}
	
	@RequestMapping(value="/nucleus/dashBoard/startEvent")
	public ModelAndView startScheduledEvent(@RequestParam("data")String data)
	{
		System.out.println(data);
		return new ModelAndView("DashBoard");
	}
	
}
