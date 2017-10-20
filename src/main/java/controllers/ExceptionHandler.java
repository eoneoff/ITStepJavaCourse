package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
class ExceptionHandlerClass
{
    @ExceptionHandler(value = Exception.class)
    public ModelAndView errorPage()
    {
       return new ModelAndView("404/404");
    }
}
