package com.demo.model;

import java.util.List;

public class Question implements Comparable<Question>
{
	private int quesId;
	private String ques;
	private int vote;
	private String linkId;
	private String userName;
	private List<String> votedBy;
	private String status;
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<String> getVotedBy() {
		return votedBy;
	}
	public void setVotedBy(List<String> votedBy) {
		this.votedBy = votedBy;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getQuesId()
	{
		return quesId;
	}
	public void setQuesId(int quesId)
	{
		this.quesId = quesId;
	}
	public String getQues()
	{
		return ques;
	}
	
	public void setLinkId(String linkId) {
		this.linkId = linkId;
	}
	public void setQuestion(String ques) {
		this.ques= ques;
	}
	public int getVote()
	{
		return vote;
	}
	public void setVote(int vote)
	{
		this.vote = vote;
	}
	public String getLinkId()
	{
		return linkId;
	}
	public void setSessionId(String linkId)
	{
		this.linkId = linkId;
	}
	
	public Question() 
	{
		
	}
	
	public Question(int quesId,String ques,String linkId,int vote, String userName, List<String> votedBy,String status)
	{
		super();
		this.quesId=quesId;
		this.ques=ques;
		this.vote=vote;
		this.linkId=linkId;
		this.userName=userName;
		this.votedBy = votedBy;
		this.status = status;
	}
		
	public int compareTo(Question q) 
	{
		if(vote>q.vote)
			return -1;
		else
			return 1;
	}
	@Override
	public String toString()
	{
		return "Question [quesId=" + quesId + ", ques=" + ques + ", vote=" + vote + ", linkId=" + linkId + ", userName="
				+ userName + ", votedBy=" + votedBy + ", status=" + status + "]";
	}
	
	
}
