package edu.TiendaVirtual.TiendaVirtual;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class TiendaVirtualApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		System.setProperty("server.servlet.context-path", "/Grupo11Cucuta");
		SpringApplication.run(TiendaVirtualApplication.class, args);
	}

}
