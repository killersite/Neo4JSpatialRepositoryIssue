// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ex.web;

import com.ex.domain.Restaurant;
import com.ex.service.RestaurantService;
import com.ex.web.RestaurantController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RestaurantController_Roo_Controller {
    
    @Autowired
    RestaurantService RestaurantController.restaurantService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RestaurantController.create(@Valid Restaurant restaurant, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, restaurant);
            return "restaurants/create";
        }
        uiModel.asMap().clear();
        restaurantService.saveRestaurant(restaurant);
        return "redirect:/restaurants/" + encodeUrlPathSegment(restaurant.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RestaurantController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Restaurant());
        return "restaurants/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RestaurantController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("restaurant", restaurantService.findRestaurant(id));
        uiModel.addAttribute("itemId", id);
        return "restaurants/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RestaurantController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("restaurants", restaurantService.findRestaurantEntries(firstResult, sizeNo));
            float nrOfPages = (float) restaurantService.countAllRestaurants() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("restaurants", restaurantService.findAllRestaurants());
        }
        return "restaurants/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RestaurantController.update(@Valid Restaurant restaurant, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, restaurant);
            return "restaurants/update";
        }
        uiModel.asMap().clear();
        restaurantService.updateRestaurant(restaurant);
        return "redirect:/restaurants/" + encodeUrlPathSegment(restaurant.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RestaurantController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, restaurantService.findRestaurant(id));
        return "restaurants/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RestaurantController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Restaurant restaurant = restaurantService.findRestaurant(id);
        restaurantService.deleteRestaurant(restaurant);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/restaurants";
    }
    
    void RestaurantController.populateEditForm(Model uiModel, Restaurant restaurant) {
        uiModel.addAttribute("restaurant", restaurant);
    }
    
    String RestaurantController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
