package sg.iss.team5cab.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {
	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
		this.context = filterConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized");

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		this.context.log("Requested Resource::"+uri);
		
		HttpSession session = req.getSession(true);

		String role = null;
		if (session.getAttribute("role") != null)
			role = session.getAttribute("role").toString();
		
		String uriRole = null;
		if (uri.contains("admin"))
			uriRole = "admin";
		else if (uri.contains("member"))
			uriRole = "member";
		
		if (role == null) {
			if (uriRole.equals("admin") || uriRole.equals("member"))
				res.sendRedirect("invalidpage");
		}
		else if (role.equals("member")) {
			if (uriRole == null || uriRole.equals("admin"))
				res.sendRedirect("invalidpage");
		}
		else if (role.equals("admin")) {
			if (uriRole == null || uriRole.equals("member"))
				res.sendRedirect("invalidpage");
		}	
		else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
