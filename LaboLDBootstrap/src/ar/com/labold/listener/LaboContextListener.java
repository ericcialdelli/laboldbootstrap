package ar.com.labold.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class LaboContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("Se destruyo la aplicacion");

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("Se inicio la aplicacion");

	}

}
