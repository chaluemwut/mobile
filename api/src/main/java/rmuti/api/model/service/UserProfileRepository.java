package rmuti.api.model.service;

import org.springframework.data.jpa.repository.JpaRepository;
import rmuti.api.model.table.UserProfile;

public interface UserProfileRepository extends JpaRepository<UserProfile, Integer> {

    UserProfile findByUserNameAndPassWord(String userName, String passWord);

    UserProfile findByUserName(String userName);

}
