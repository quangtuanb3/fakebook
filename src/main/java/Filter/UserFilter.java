package Filter;

import Model.Enum.ERole;
import Model.User;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@javax.servlet.annotation.WebFilter("/users/*")
public class UserFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        var session = ((HttpServletRequest)servletRequest).getSession();
        if(session.getAttribute("user") == null){
            ((HttpServletResponse)servletResponse).sendRedirect("/auths");
            return;
        }
        if(!((User)session.getAttribute("user")).getRole().equals(ERole.USER)){
            ((HttpServletResponse)servletResponse).sendRedirect("/auths?action=403");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }
}