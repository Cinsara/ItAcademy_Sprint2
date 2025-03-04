use('restaurants');

// 1. Escriu una consulta per mostrar tots els documents en la col·lecció Restaurants.

db.restaurants.find();

// 2. Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine per tots els documents en la col·lecció Restaurants.

db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, cuisine:1});

// 3. Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine, però exclou el camp _id per tots els documents en la col·lecció Restaurants.

db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, cuisine:1, _id:0});

// 4. Escriu una consulta per mostrar restaurant_id, name, borough i zip code, però exclou el camp _id per tots els documents en la col·lecció Restaurants.

db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, "address.zipcode":1, _id:0});

// 5. Escriu una consulta per mostrar tots els restaurants que estan en el Bronx.

db.restaurants.find({borough:"Bronx"});

// 6. Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx.

db.restaurants.find({borough:"Bronx"}).limit(5);

// 7. Escriu una consulta per mostrar el pròxim 5 restaurants després de saltar els primers 5 del Bronx.

db.restaurants.find({borough:"Bronx"}).skip(5).limit(5);

// 8. Escriu una consulta per trobar els restaurants que tenen un score de més de 90.

db.restaurants.find({"grades.score": {$gt:90}});

// 9. Escriu una consulta per trobar els restaurants que tenen un score de més de 80 però menys que 100.

db.restaurants.find({"grades.score": {$gt:90, $lt:100}});

// 10. Escriu una consulta per trobar els restaurants que es localitzen en valor de latitud menys de -95.754168.

db.restaurants.find({"address.coord.0": {$lt:-95.754168}});

// 11. Escriu una consulta de MongoDB per a trobar els restaurants que no preparen cap cuisine de 'American' i la seva qualificació és superior a 70 i longitud inferior a -65.754168.

db.restaurants.find({$and: [{cuisine: {$ne:"American"}}, {"grades.score": {$gt:70}}, {"address.coord.0": {$lt:-65.754168}}]});

// 12. Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van aconseguir un marcador més de 70 i localitzat en la longitud menys que -65.754168. Nota: Fes aquesta consulta sense utilitzar $and operador.

db.restaurants.find({cuisine: {$ne:"American"}, "grades.score": {$gt:70}, "address.coord.0": {$lt:-65.754168}});

// 13. Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van obtenir un punt de grau 'A' no pertany a Brooklyn. S'ha de mostrar el document segons la cuisine en ordre descendent.

db.restaurants.find({cuisine: {$ne:"American"}, "grades.grade": "A", borough: {$ne: "Brooklyn"}}).sort({cuisine: -1});

// 14. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Wil' com les tres primeres lletres en el seu nom.

db.restaurants.find({name: {$regex: '^Wil', $options: "i"}}, {name:1, restaurant_id:1, borough:1, cuisine:1, _id:0});

// 15. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'ces' com les últimes tres lletres en el seu nom.

db.restaurants.find({name: {$regex: 'ces$', $options: "i"}}, {name:1, restaurant_id:1, borough:1, cuisine:1, _id:0});

// 16. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Reg' com tres lletres en algun lloc en el seu nom.

db.restaurants.find({name: {$regex: 'Reg', $options: "i"}}, {name:1, restaurant_id:1, borough:1, cuisine:1, _id:0});

// 17. Escriu una consulta per trobar els restaurants que pertanyen al Bronx i van preparar qualsevol plat americà o xinès.

db.restaurants.find({cuisine: {$regex: 'American|Chinese', $options: "i"}}, {name:1, restaurant_id:1, borough:1, cuisine:1, _id:0});
db.restaurants.find({borough:"Bronx", $or:[{cuisine:"American"},{cuisine:"Chinese"}]});
