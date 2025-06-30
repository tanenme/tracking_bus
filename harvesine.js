/**
 * Calculates the distance between two points on the Earth's surface using the Haversine formula.
 * 
 * @param {number} lat1 - Latitude of first point in decimal degrees
 * @param {number} lon1 - Longitude of first point in decimal degrees
 * @param {number} lat2 - Latitude of second point in decimal degrees
 * @param {number} lon2 - Longitude of second point in decimal degrees
 * @returns {number} Distance between the two points in kilometers
 */
export const haversineDistance = (lat1, lon1, lat2, lon2) => {
  // Convert latitude and longitude from degrees to radians
  const toRadian = (degree) => degree * (Math.PI / 180);
  
  const radLat1 = toRadian(lat1);
  const radLon1 = toRadian(lon1);
  const radLat2 = toRadian(lat2);
  const radLon2 = toRadian(lon2);
  
  // Radius of the Earth in kilometers
  const earthRadius = 6371;
  
  // Haversine formula
  const dLat = radLat2 - radLat1;
  const dLon = radLon2 - radLon1;
  
  const a = 
    Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(radLat1) * Math.cos(radLat2) * 
    Math.sin(dLon/2) * Math.sin(dLon/2);
  
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  const distance = earthRadius * c;
  
  return distance;
};