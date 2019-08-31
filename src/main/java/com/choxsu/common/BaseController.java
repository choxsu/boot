package com.choxsu.common;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Map;

/**
 * @author choxsu
 * @date 2019/8/25
 */
public class BaseController {

    @InitBinder
    protected void initBinder(ServletRequestDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        CustomDateEditor dateEditor = new CustomDateEditor(format, true);
        binder.registerCustomEditor(Date.class, dateEditor);
    }

    public HttpServletRequest getRequest() {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        assert ra != null;
        return ((ServletRequestAttributes) ra).getRequest();
    }

    public HttpServletResponse getResponse() {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        assert ra != null;
        return ((ServletRequestAttributes) ra).getResponse();
    }

    /**
     * @param name a String specifying the name of the parameter
     * @return a String representing the single value of the parameter
     */
    public String getPara(String name) {
        return getRequest().getParameter(name);
    }

    /**
     * @param name         a String specifying the name of the parameter
     * @param defaultValue a String value be returned when the value of parameter is null
     * @return a String representing the single value of the parameter
     */
    public String getPara(String name, String defaultValue) {
        String result = getRequest().getParameter(name);
        return result != null && !"".equals(result) ? result : defaultValue;
    }

    /**
     * @return a Map contains all the parameters name and value
     */
    public Map<String, String[]> getParaMap() {
        return getRequest().getParameterMap();
    }


    /**
     * @return an Enumeration of String objects, each String containing the name of
     * a request parameter; or an empty Enumeration if the request has no parameters
     */
    public Enumeration<String> getParaNames() {
        return getRequest().getParameterNames();
    }

    /**
     * @param name a String containing the name of the parameter whose value is requested
     * @return an array of String objects containing the parameter's values
     */
    public String[] getParaValues(String name) {
        return getRequest().getParameterValues(name);
    }

    /**
     * Returns the value of the specified request header as a String.
     */
    public String getHeader(String name) {
        return getRequest().getHeader(name);
    }

}
