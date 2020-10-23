package com.sample.proj.gmap.listener;

import javax.servlet.*;

/**
 * This is the handler class to run when the applicaton starts
 * @author hsuwai
 *
 */
public final class ContextListener implements ServletContextListener {
    private ServletContext context = null;

    // This method gets called when the application is deployed
    public void contextInitialized(ServletContextEvent event) {
        context = event.getServletContext();

        context.setAttribute("API_KEY", "API_KEY");
       
    }

    // This method gets called when the application is undeployed
    public void contextDestroyed(ServletContextEvent event) {
        context = event.getServletContext();

        context.removeAttribute("API_KEY");
    }
}
