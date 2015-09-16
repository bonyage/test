package com.toptier.admin.mvc.controller;

import com.toptier.core.model.User;
import com.toptier.core.model.UserRole;
import com.toptier.dto.UserDto;
import com.toptier.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
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

    @RequestMapping(value = { "/user/{username}" }, method = RequestMethod.GET)
    public ModelAndView users(ModelMap model, @PathVariable("username") String username) {
        User user = userService.findByUsername(username);
        ModelAndView mav = new ModelAndView("administration.editUser");
        mav.addObject("user",userToDtoTranslator(user));
        return mav;
    }

    private UserDto userToDtoTranslator(User user) {
        UserDto dto = new UserDto();
        dto.setUsername(user.getUserName());
        dto.setName(user.getName());
        dto.setEmail(user.getEmail());
        dto.setActive(user.isActive());
        dto.setPhone(user.getMobile());
        List<String> roles = new ArrayList<String>();
        for (UserRole userRole : user.getUserRole()) {
            roles.add(userRole.getRole());
        }
        dto.setRoles(roles.toArray(new String[roles.size()]));
        return dto;
    }

    @RequestMapping(value = { "/user/new" }, method = RequestMethod.GET)
    public ModelAndView addUser(ModelMap model) {
        ModelAndView mav = new ModelAndView("administration.addUser");
        mav.addObject("user", new UserDto());
        return mav;
    }

    @RequestMapping(value = { "/user/new" }, method = RequestMethod.POST)
    public ModelAndView saveUser(@ModelAttribute("user") UserDto user) {
        userService.prepareUserRoles(user.getUsername());
        userService.saveUser(user);
        ModelAndView mav = new ModelAndView("redirect:/administration/users");
        return mav;
    }

}
