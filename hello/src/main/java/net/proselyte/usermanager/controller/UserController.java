package net.proselyte.usermanager.controller;

import net.proselyte.usermanager.model.User;
import net.proselyte.usermanager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {

    private UserService userService;
    private int pageSize = 5;

    @Autowired
    @Qualifier(value = "userService")
    public void setBookService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public ModelAndView listUsers(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("users");

        List<User> users = userService.listUsers();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(pageSize);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())
            page=1;

        modelAndView.addObject("page", page);

        if(page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }

        modelAndView.addObject("user", new User());

        return modelAndView;
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) {
        if (user.getId() == 0)
            this.userService.addUser(user);
        else
            this.userService.updateUser(user);
        return "redirect:/users";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editUser(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView("users");

        List<User> users = userService.listUsers();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(pageSize);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        User user = this.userService.getUserById(id);
        modelAndView.addObject("user", user);

        modelAndView.addObject("page", 0);

        pagedListHolder.setPage(0);
        modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        return modelAndView;
    }

    @RequestMapping(value = "userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userdata";
    }

    @RequestMapping("searchUser")
    public String searchUser(@ModelAttribute("searchName") String searchName, Model model) {
        model.addAttribute("listUsers", this.userService.listUsers(searchName));
        return "search";
    }
}
