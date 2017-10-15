package struts; 
import cmysql.Cmysql;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

import com.opensymphony.xwork2.ActionSupport;

import java.util.*;

import com.opensymphony.xwork2.ActionContext;
@SuppressWarnings("serial")
public class Login extends ActionSupport{
	//Book类
	private String ISBN;
    private String Title;
    private String AuthorID;
	private String Publisher;
    private String PublishDate;
    private float price;
    public String getISBN() {
		return ISBN;
	}
	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String Title) {
		this.Title = Title;
	}
	public String getAuthorID() {
		return AuthorID;
	}
	public void setAuthorID(String AuthorID) {
		this.AuthorID = AuthorID;
	}
	public String getPublisher() {
		return Publisher;
	}
	public void setPublisher(String Publisher) {
		this.Publisher = Publisher;
	}
	public String getPublishDate() {
		return PublishDate;
	}
	public void setPublishDate(String PublishDate) {
		this.PublishDate = PublishDate;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float Price) {
		this.price = Price;
	}
	public String execute() throws Exception {
		  Cmysql mycon=new Cmysql();
		  int x=mycon.InsertBook(ISBN, Title, AuthorID, Publisher, PublishDate, price);
		  if(x==0){
	      return "success";}
		  else
		  { return "false";}
	   }
	public String exe() throws Exception{
		Cmysql mycon=new Cmysql();
		  int x=mycon.InsertAuthor(AuthorID, Name, Age, Country);
		  if(x==0){
	      return "success";}
		  else
		  { return "false";}
	}
	public String exf() throws Exception{
		Cmysql mycon=new Cmysql();
		String bb=mycon.IndexTitle(SerchName);
		if(bb==null){
			return "false";
		}else{
			 ActionContext context= ActionContext.getContext();
	          Map<String,String> request = (Map<String,String>)context.get("request");
	          request.put("key",bb);
			return "success";
		}
	}
	
	//Author类
	private String Name;
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		this.Name = name;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		this.Age = age;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		this.Country = country;
	}

	private int Age;
	private String Country;
	private String SerchName;
	public String getSerchName() {
		return SerchName;
	}
	public void setSerchName(String serchName) {
		this.SerchName = serchName;
	}
}
