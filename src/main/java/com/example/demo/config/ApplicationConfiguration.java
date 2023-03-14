package com.example.demo.config;

import org.modelmapper.AbstractConverter;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.modelmapper.ModelMapper;

@Configuration
public class ApplicationConfiguration {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
        modelMapper.addConverter(new AbstractConverter<String, String>() {
            @Override
            protected String convert(String source) {
                return source == null ? null : source.trim();
            }
        });
        return modelMapper;
    }
}
