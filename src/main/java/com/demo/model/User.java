package com.demo.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@SuppressWarnings("serial")
@Component @Entity @Table(name="karizma_spring")
public class User implements Serializable
{
	@Id @Pattern(regexp="^[A-Z a-z0-9]*$") @Length(min = 6,max = 16) @NotEmpty @Column(name="USERNAME")
	private String userName;
	@NotEmpty @Column(name="PASSWORD")
	private String password;
	@Length(max = 1) @NotEmpty @Column(name="ENABLED")
	private String enabled;
	@Pattern(regexp="^[A-Z a-z]*$") @Length(min = 1,max = 20 ) @NotEmpty @Column(name="FIRSTNAME")
	private String firstName;
	@Pattern(regexp="^[A-Z a-z]*$") @Length(min = 1,max = 20 ) @NotEmpty @Column(name="LASTNAME")
	private String lastName;
	@Email @NotEmpty @Length(max = 100) @Column(name="EMAILID")
	private String emailID;
	@Pattern(regexp="^[A-Z a-z]*$") @Length(min = 1,max = 20 ) @NotEmpty @Column(name="CITY")
	private String city;
	@Column(name="CREATEDATE")
	private Date createDate;
	@ManyToOne(cascade=CascadeType.ALL)
	private Role roles;
	
	public Role getRoles() {
		return roles;
	}
	public void setRoles(Role roles) {
		this.roles = roles;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
