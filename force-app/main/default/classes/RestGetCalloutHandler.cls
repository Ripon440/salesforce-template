public with sharing class RestGetCalloutHandler {
    public static ResponseWrapper getData(){
        HttpResponse response = RestGetCallout.get();
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200){
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

            AnimalClass result = (AnimalClass)JSON.deserialize(response.getBody(), AnimalClass.class);

            System.debug('response.getBody() -> ' + response.getBody());
            System.debug('result --> ' + result);

            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(String animal: result.animals) {
                System.debug(animal);
            }
            return new ResponseWrapper(true, result);
        }else{
            return new ResponseWrapper(false, response.getStatus());
        }
    }
}