public class AnimalClass {
    public List<String> animals;
    public static AnimalClass parse(String json) {
        return (AnimalClass) System.JSON.deserialize(json, AnimalClass.class);
    }
}