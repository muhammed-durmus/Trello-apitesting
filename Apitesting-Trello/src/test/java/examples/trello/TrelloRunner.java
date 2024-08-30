package examples.trello;

import com.intuit.karate.junit5.Karate;

class TrelloRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("trello").relativeTo(getClass());
    }    

}
