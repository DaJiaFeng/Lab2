package cmysql;
//连接数据库的方法
import java.sql.*;
public class Cmysql {
	 Connection con =null;
    Statement stat=null;
    ResultSet rs=null;

    public int InsertBook(String s1,String s2,String s3,String s4,String s5,float f){
    	String sql2 = "insert into book values (?,?,?,?,?,?) ";
    	if(s1=="" ||s2=="" ||s3=="")
    	{
    		return -1;
    	}
    	try{
    		String username = System.getenv("ACCESSKEY");
    		String password = System.getenv("SECRETKEY");
    		//System.getenv("MYSQL_HOST_S"); 为从库，只读
    		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
    		Class.forName("com.mysql.jdbc.Driver");//连接驱动
            con=DriverManager.getConnection(dbUrl,username,password);//连接数据库
            stat=con.createStatement();
  	  PreparedStatement qst = con.prepareStatement(sql2);
  	  qst.setString(1, s1);
  	  qst.setString(2, s2);
  	  qst.setString(3, s3);
  	  qst.setString(4, s4);
  	  qst.setString(5,s5);
  	  qst.setFloat(6,f);
  	qst.executeUpdate();
	  qst.close();
	  stat.close();
	  con.close();
	  return 0;
    	}
    	catch(Exception e){
    		return -1;
    		
    	}
    }
    public int InsertAuthor(String s1,String s2,int i,String s3){
    	String sql="insert into author values(?,?,?,?)";
    	if(s1==""||s2==""){
    		return -1;
    	}
    	try{
    		String username = System.getenv("ACCESSKEY");
    		String password = System.getenv("SECRETKEY");
    		//System.getenv("MYSQL_HOST_S"); 为从库，只读
    		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
    		Class.forName("com.mysql.jdbc.Driver");//连接驱动
            con=DriverManager.getConnection(dbUrl,username,password);//连接数据库
            stat=con.createStatement();
  	  PreparedStatement qst = con.prepareStatement(sql);
  	  qst.setString(1, s1);
  	  qst.setString(2, s2);
  	  qst.setInt(3, i);
  	  qst.setString(4, s3);
  	qst.executeUpdate();
	  qst.close();
	  stat.close();
	  con.close();
	  return 0;
    	}
    	catch(Exception e){
    		return -1;
    		
    	}
    }
    
    public String IndexTitle(String name){
    	String sql1="select AuthorID from author where Name=?";
    	String bb;
    	try{
    		String username = System.getenv("ACCESSKEY");
    		String password = System.getenv("SECRETKEY");
    		//System.getenv("MYSQL_HOST_S"); 为从库，只读
    		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
    		Class.forName("com.mysql.jdbc.Driver");//连接驱动
            con=DriverManager.getConnection(dbUrl,username,password);//连接数据库
            stat=con.createStatement();
  	  PreparedStatement qst = con.prepareStatement(sql1);
  	  qst.setString(1, name);
  	  rs=qst.executeQuery();
  	  rs.next();
  	  bb=rs.getString(1);
	  qst.close();
	  stat.close();
	  con.close();
	  return bb;
    	}catch(Exception e){
    		e.printStackTrace(); 
    		return null;
    	}
    	
    }
 
}

