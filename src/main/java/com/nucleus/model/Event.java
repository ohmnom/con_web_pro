package com.nucleus.model;

import java.util.List;
public class Event 
{
	private String eventId;
	private String linkId;
	private String eventName;
	private String date;
	private String location;
	private String description;
	private List<Question> question;
	private String hostName;
	private List<User> activeMembers;
	private boolean eventState;
	
	
	public Event(String eventName, String linkId, String date, String description, String hostName , List<Question> question, List<User> activeMembers, boolean eventState,String location ) 
	{
		super();
		this.eventName = eventName;
		this.linkId = linkId;
		this.hostName = hostName;
		this.date = date;
		this.description = description;
		this.question = question;
		this.activeMembers = activeMembers;
		this.eventState = eventState;
		this.location = location;
	}
	
	public Event()
	{
		super();
	}
	
	public List<Question> getQuestion()
	{
		return question;
	}
	public void setQuestion(List<Question> question)
	{
		this.question = question;
	}
		
	public String getEventName()
	{
		return eventName;
	}
	public void setEventName(String eventName)
	{
		this.eventName = eventName;
	}
	public String getEventId()
	{
		return eventId;
	}
	public void setEventId(String eventId)
	{
		this.eventId = eventId;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	public String getLocation()
	{
		return location;
	}

	public void setLocation(String location)
	{
		this.location = location;
	}
	public String getDescription()
	{
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getLinkId() {
		return linkId;
	}

	public void setLinkId(String linkId) {
		this.linkId = linkId;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public List<User> getActiveMembers() {
		return activeMembers;
	}

	public void setActiveMembers(List<User> activeMembers) {
		this.activeMembers = activeMembers;
	}

	public boolean isEventState() {
		return eventState;
	}

	public void setEventState(boolean eventState) {
		this.eventState = eventState;
	}
	
	
}
