package org.mediameter.cliff.servlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Health check for load balancing
 *
 */
public class HealthServlet extends HttpServlet{

	private static final Logger logger = LoggerFactory.getLogger(HealthServlet.class);

	public HealthServlet() {
	}
	
	@Override
    @SuppressWarnings("rawtypes")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{

        response.getWriter().write("{ \"status\": \"healthy\" }");
	}
	
}
