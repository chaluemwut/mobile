package rmuti.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import rmuti.api.model.bean.APIResponse;
import rmuti.api.model.service.UserProfileRepository;
import rmuti.api.model.table.UserProfile;

@RestController
@RequestMapping("/user")
public class UserProfileController {

    @Autowired
    private UserProfileRepository userProfileRepository;

    @PostMapping("/login")
    public Object login(@RequestParam String userName, @RequestParam String passWord) {
        APIResponse res = new APIResponse();
        UserProfile userProfile = userProfileRepository.findByUserNameAndPassWord(userName, passWord);
        if (userProfile != null) {
            res.setStatus(0);
        } else {
            res.setStatus(1);
        }
        return res;
    }

    @PostMapping("/registor")
    public Object registor(UserProfile userProfile) {
        APIResponse res = new APIResponse();
        UserProfile userProfileDb = userProfileRepository.findByUserName(userProfile.getUserName());
        if (userProfileDb == null) {
            userProfile = userProfileRepository.save(userProfile);
            res.setData(userProfile);
            res.setStatus(0);
        } else {
            res.setStatus(1);
        }
        return res;
    }
}
