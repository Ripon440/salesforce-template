public class Helper {
    /*
     * field permission check and set the value
     */
    public static Id setIdValue(SObject obj, String fieldName) {
        return obj.isSet(fieldName) ? (Id) obj.get(fieldName) : null;
    }

    /*
     * Salesforce Valid Id check
     */
    public static Boolean isValidId(String idParam) {
        String id = String.escapeSingleQuotes(idParam);
        return ((id.length() == 15 || id.length() == 18) && Pattern.matches('^[a-zA-Z0-9]*$', id));
    }
}
