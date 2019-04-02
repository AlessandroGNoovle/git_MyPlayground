public class AnimalLocator {
    
    public static String getAnimalNameById (integer x) {
        
        Http http = new Http();       
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + x);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');
        system.debug('request :'+request);
        system.debug('response :'+response.getBody());
        system.debug('results :'+results);
        system.debug('animal :'+animal);
        
        return (String)animal.get('name');
        
    }
    
}