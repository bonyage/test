package com.toptier.admin.mvc.controller;

import com.toptier.core.model.User;
import com.toptier.dto.UserDto;
import com.toptier.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
/**
 * Created by hng on 8/18/15.
 */
@Controller
@RequestMapping("/administration")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = { "/users" }, method = RequestMethod.GET)
    public ModelAndView users(ModelMap model) {
        List<User> users = userService.loadAllUsers();
        ModelAndView mav = new ModelAndView("administration.users");
        mav.addObject("users",users);
        return mav;
    }

    @RequestMapping(value = { "/addUser" }, method = RequestMethod.GET)
    public ModelAndView addUser(ModelMap model) {
        ModelAndView mav = new ModelAndView("administration.addUser");
        mav.addObject("userForm", new UserDto());
        return mav;
    }

    @RequestMapping(value = { "/addUser" }, method = RequestMethod.POST)
    public ModelAndView saveUser(@ModelAttribute("userForm") UserDto user) {
        userService.saveUser(user);
        ModelAndView mav = new ModelAndView("redirect:users");
        return mav;
    }

}
