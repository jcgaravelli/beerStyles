
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



  Parse.Promise.when(stylePromises.concat(glassPromises)).then(function(){
    var relationPromises = [];

    relationPromises.push(relate('American Pale Ale',['Pint','Mug']));

    Parse.Promise.when(relationPromises).then(function(){
      status.success('UHUUUUL');
    });
  });

  console.log('All beers created');
});
