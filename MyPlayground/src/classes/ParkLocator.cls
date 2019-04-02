public class ParkLocator {
	public static String[] Country(string countr) {
         ParkService.ParksImplPort park = 
            new ParkService.ParksImplPort();
        return park.byCountry(countr);
    }
    
}