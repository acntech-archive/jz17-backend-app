package jz17.acntech.devops.demo.backendapp.app;

import jz17.acntech.devops.demo.backendapp.config.RestRepositoryConfiguration;
import jz17.acntech.devops.demo.backendapp.config.SpringScanningConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

@Import({
		SpringScanningConfiguration.class,
		RestRepositoryConfiguration.class
})
@SpringBootApplication
public class TodoListApplication {

	public static void main(String[] args) {
		SpringApplication.run(TodoListApplication.class, args);
	}
}
