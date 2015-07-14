
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

var Glass = Parse.Object.extend("Glass");
var Style = Parse.Object.extend("Style");

var createGlass = function(name,description) {
	var g = new Glass();
	g.set('name',name);
	g.set('description',description);
	return g.save();
};

var createStyle = function(name,country,description,characteristics,abvMin,abvMax,tempMin,tempMax,food) {
	var s = new Style();
	s.set('name',name);
	return s.save();
};

var relate = function(styleName,glassNames) {
	var glassQuery = new Parse.Query(Glass);
	glassQuery.containedIn('name',glassNames);

	var styleQuery = new Parse.Query(Style);
	styleQuery.equalTo('name',styleName);

  console.log('Querying...');

  return styleQuery.first().then(function(style) {
    console.log('Achou o estilo');
    return glassQuery.find().then(function(glasses){
      console.log('Achou o copo');
      var relation = style.relation('glasses');
      relation.add(glasses);
      style.save();
    });
  });

};

Parse.Cloud.job("recreateAll", function(request,status) {
  console.log('Creating all beers');

  var glassPromises = [];

  glassPromises.push(createGlass('Snifter'));
  glassPromises.push(createGlass('Pint'));
  glassPromises.push(createGlass('Tulip'));
  glassPromises.push(createGlass('Flute'));
  glassPromises.push(createGlass('Mug'));
  glassPromises.push(createGlass('Goblet'));
  glassPromises.push(createGlass('Pilsner'));
  glassPromises.push(createGlass('Stange'));
  glassPromises.push(createGlass('Weizen'));
  glassPromises.push(createGlass('Oversized Wine'));











  var stylePromises = [];

  stylePromises.push(createStyle('American Pale Ale'));
  stylePromises.push(createStyle('American Amber Ale'));
  stylePromises.push(createStyle('American Brown Ale'));
  stylePromises.push(createStyle('Ordinary Bitter'));
  stylePromises.push(createStyle('Best Bitter'));
  stylePromises.push(createStyle('Strong Bitter'));
  stylePromises.push(createStyle('British Golden Ale'));
  stylePromises.push(createStyle('Autralian Sparkling Ale'));
  stylePromises.push(createStyle('English Porter'));
  stylePromises.push(createStyle('Baltic Porter'));
  stylePromises.push(createStyle('Irish Stout'));
  stylePromises.push(createStyle('English IPA'));
  stylePromises.push(createStyle('American IPA'));
  stylePromises.push(createStyle('Double IPA'));
  stylePromises.push(createStyle('Dark Mild'));
  stylePromises.push(createStyle('English Brown Ale'));
  stylePromises.push(createStyle('Old Ale'));
  stylePromises.push(createStyle('American Barleywine'));
  stylePromises.push(createStyle('Witbier'));
  stylePromises.push(createStyle('Belgian Pale Ale'));
  stylePromises.push(createStyle('Saison'));
  stylePromises.push(createStyle('Bière de Garde'));
  stylePromises.push(createStyle('Irish Red Ale'));
  stylePromises.push(createStyle('Scottish Light'));
  stylePromises.push(createStyle('Scottish Heavy'));
  stylePromises.push(createStyle('Scottish Export'));
  stylePromises.push(createStyle('Scottish Wee Heavy'));
  stylePromises.push(createStyle('Belgian Blond Ale'));
  stylePromises.push(createStyle('Belgian Golden Strong Ale'));
  stylePromises.push(createStyle('Belgian Dark Strong Ale'));
  stylePromises.push(createStyle('Belgian Dubbel'));
  stylePromises.push(createStyle('Belgian Tripel'));
  stylePromises.push(createStyle('Weissbier'));
  stylePromises.push(createStyle('Dunkles Weissbier'));
  stylePromises.push(createStyle('Weizenbock'));



  Parse.Promise.when(stylePromises.concat(glassPromises)).then(function(){
    var relationPromises = [];

    relationPromises.push(relate('American Pale Ale',['Pint','Mug']));
    relationPromises.push(relate('Old Ale',['Snifter','Oversized Wine']));
    relationPromises.push(relate('Saison',['Tulip','Oversized Wine']));
    relationPromises.push(relate('Bière de Garde',['Tulip','Oversized Wine']));
    relationPromises.push(relate('Belgian Dark Strong Ale',['Snifter', 'Tulip', 'Goblet']));
    relationPromises.push(relate('Scottish Wee Heavy',['Snifter','Tulip']));
    relationPromises.push(relate('Belgian Dubbel',['Goblet']));
    relationPromises.push(relate('Belgian Tripel',['Snifter', 'Goblet']));
    relationPromises.push(relate('Weizenbock',['Flute', 'Weizen']));











    Parse.Promise.when(relationPromises).then(function(){
      status.success('UHUUUUL');
    });
  });

  console.log('All beers created');
});
