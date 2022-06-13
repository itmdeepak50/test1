public class testdemo{
    public class GetGeoResult {
    public List<GetGeoResponse> result;
}

public class GetGeoResponse{
     public Geo GeocodeSuccess;
}
    
  public class Geo {
        public String address;
        public Latlng latlng;
    }

    public class Latlng {
        public Double lat;
        public Double lng;
    }      
}