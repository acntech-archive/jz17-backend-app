package jz17.acntech.devops.demo.backendapp.config;

import jz17.acntech.devops.demo.backendapp.domain.Todo;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@ComponentScan(basePackageClasses = {
        RestRepositoryConfiguration.class
})
@EntityScan(basePackageClasses = {
        Todo.class
})
public class SpringScanningConfiguration {

}