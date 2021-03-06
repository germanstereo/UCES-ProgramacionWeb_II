package edu.uces.ar.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.uces.ar.service.LoginService;
import edu.uces.ar.service.LogoutService;
import edu.uces.ar.service.UserService;

@Controller
public class LoginController {
	
	LoginService loginService;
	UserService userService;
	
	public LoginController(LoginService loginService, UserService userService) {
		super();
		this.loginService = loginService;
		this.userService = userService;
	}

	@GetMapping({"/"})
    public String showIndex(Model model) {
        return "index";
    }
	
	@GetMapping({"/showLogin"})
    public String showLogin(Model model, HttpServletRequest req) {
		
		if (!loginService.isLogged(req.getSession())) {
			model.addAttribute("showRecoveryLink", "true");
			return "Login";
		} else {
			return "UsuarioValido";
		}
    }
	
	@PostMapping({"/login"})
    public String login(Model model, HttpServletRequest req, HttpServletResponse resp,
    		@RequestParam(value="name", required=true) String name, 
    		@RequestParam(value="pass", required=true) String pass) {
		
        model.addAttribute("name", name);
        
        if (loginService.validateLogin(name, pass)) {
			Cookie userCookie = loginService.login(req.getSession(false), name);
			resp.addCookie(userCookie);
			return "UsuarioValido";
			
		} else {
			model.addAttribute("usuarioMal", true);
			return "Login";
		}
    }
    
	@GetMapping({"/logout"})
    public String logout(Model model, HttpServletRequest req) {
		
		LogoutService.logout(req.getSession(false));
		return "Login";
    }
	
}
