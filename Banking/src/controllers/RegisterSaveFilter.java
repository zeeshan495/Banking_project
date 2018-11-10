package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import service.Service;
import model.UserInfo;

/**
 * Servlet Filter implementation class RegisterSaveFilter
 */
@WebFilter("/RegisterSaveFilter")
public class RegisterSaveFilter implements Filter {

	private static final String EMAIL_REGEX = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
	private static Pattern pattern;
	private Matcher matcher;
    /**
     * Default constructor. 
     */
    public RegisterSaveFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		PrintWriter pw = response.getWriter();
		String userName = request.getParameter("uName");
		String fullName = request.getParameter("fName");
		String mailId = request.getParameter("mail");
		String password = request.getParameter("Password");
		System.out.println(userName+" "+fullName);		
		pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
		matcher = pattern.matcher(mailId);
		if(matcher.matches()==true && 
				userName.length()>3 && 
					fullName.length()>3){
			UserInfo info=new UserInfo();
			Service service=new Service();
			info.setUsername(userName);
			info.setFullname(fullName);
			info.setMailid(mailId);
			info.setPassword(password);
			boolean userExist;
			try {
				userExist = service.checkRegisterUser(mailId);
				
				if(userExist)
				{
					String userExistMsg = "User already exists";
					RequestDispatcher rd = request.getRequestDispatcher("registerForm.jsp");
					request.setAttribute("userExist", userExistMsg);
					rd.include(request, response);
				}
					else {int status = service.save(info);
						if (status > 0) {
						chain.doFilter(request, response);
					} else {
						pw.println("oops......something went wrong");
						request.getRequestDispatcher("index.jsp").include(request, response);
					}
			}
					}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
			else
			{
				System.out.println("something went wrong....check input");
			}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}