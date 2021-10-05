package edu.TiendaVirtual.TiendaVirtual;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TiendaVirtualApplication {

	public static void main(String[] args) {
		System.setProperty("server.servlet.context-path", "/TiendaVirtualApp");
		SpringApplication.run(TiendaVirtualApplication.class, args);
	}

}
