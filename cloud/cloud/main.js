var Glass = Parse.Object.extend("Glass");
var Style = Parse.Object.extend("Style");
var FatherStyle = Parse.Object.extend("FatherStyle");

///// STYLES ///////////////////////////////////////////////////////////////////

var createStyleJSON = function (json) {
  var s = new Style();

  var keys = Object.keys(json);
  keys.forEach(function(key){
    var value = json[key];
    if (value !== '' && key != "glasses" && key != "fatherStyle") {
      s.set(key,json[key]);
    }
  });

  return s.save();
};

var createStyles = function (list) {
  var promises = [];

  if (list) {
    list.forEach(function(style){
      var p = createStyleJSON(style);
      p.then(function(){
        console.log('sucesso')
      },function(error){
        console.log(error);
      });
      promises.push(p);
    });
  }

  return Parse.Promise.when(promises);
};

///// GLASSES //////////////////////////////////////////////////////////////////

var createGlassJSON = function (json) {
  var g = new Glass();

  var keys = Object.keys(json);
  keys.forEach(function(key){
    var value = json[key];
    if (value !== '') {
      g.set(key,json[key]);
    }
  });

  return g.save();
};

var createGlasses = function (list) {
  var promises = [];

  if (list) {
    list.forEach(function(glass){
      promises.push(createGlassJSON(glass));
    });
  }

  return Parse.Promise.when(promises);
};

///// RELATIONSHIPS S2 /////////////////////////////////////////////////////////

var relate = function(styleName,glassNames) {
	var styleQuery = new Parse.Query(Style);
	styleQuery.equalTo('name',styleName);

  return styleQuery.first().then(function(style) {
    console.log('Achou o estilo');

    if (style) {
      var glassQuery = new Parse.Query(Glass);
      glassQuery.containedIn('name',glassNames);

      return glassQuery.find().then(function(glasses){
        if (glasses) {
          console.log('Achou o copo');
          var relation = style.relation('glasses');
          relation.add(glasses);
          style.save();
        } else {
          return Parse.Promise.as(glasses);
        }
      });
    } else {
      return Parse.Promise.as(style);
    }
  });
};

var relateStylesGlasses = function (styleList) {
  var promises = [];

  if (styleList) {
    styleList.forEach(function(json){
      promises.push(relate(json.name,json.glasses));
    });
  }

  return Parse.Promise.when(promises);
};

///// POINTERS /////////////////////////////////////////////////////////////////

var pointFather = function (styleName, fatherStyleName) {
  var styleQuery = new Parse.Query(Style);
  styleQuery.equalTo('name',styleName);

  return styleQuery.first().then(function(style) {
    console.log('Achou o estilo');

    if (style) {
      var fatherQuery = new Parse.Query(FatherStyle);
      fatherQuery.equalTo('name',fatherStyleName);

      return fatherQuery.first().then(function(fatherStyle){
        if (fatherStyle) {
          console.log('Achou o estilo-pai');
          style.set('fatherStyle',fatherStyle);
          var p = style.save();
          return p.then(function(){
            console.log('Setou o estilo-pai');
          }, function(error) {
            console.log(error);
          });
        } else {
          return Parse.Promise.as(glasses);
        }
      });
    } else {
      return Parse.Promise.as(style);
    }
  });
};

var pointFatherList = function (styleList) {
  var promises = [];

  styleList.forEach(function(style){
    if (style.fatherStyle && style.fatherStyle != '') {
      promises.push(pointFather(style.name,style.fatherStyle));
    }
  });

  return Parse.Promise.when(promises);
};

///// JOBS /////////////////////////////////////////////////////////////////////

Parse.Cloud.job("AddFromJSON", function(request,status) {
  console.log('Reading JSON...');

  var json = request.params;

  var p1 = createStyles(json.Style);
  var p2 = createGlasses(json.Glass);

  var p3 = Parse.Promise.when([p1,p2]).then(function(){
    var p31 = pointFatherList(json.Style);
    var p32 = relateStylesGlasses(json.Style);
    return Parse.Promise.when([p31,p32]);
  });

  p3.then(function(){
    status.success('Tudo beleza, hora da cerveja.');
  },function() {
    status.error('Fudeu o server.');
  });
});

// Parse.Cloud.job("recreateAll", function(request,status) {
//   console.log('Creating all beers');
//
//   var glassPromises = [];
//
//   glassPromises.push(createGlass('Snifter'));
//   glassPromises.push(createGlass('Pint'));
//   glassPromises.push(createGlass('Tulip'));
//   glassPromises.push(createGlass('Flute'));
//   glassPromises.push(createGlass('Mug'));
//   glassPromises.push(createGlass('Goblet'));
//   glassPromises.push(createGlass('Pilsner'));
//   glassPromises.push(createGlass('Stange'));
//   glassPromises.push(createGlass('Weizen'));
//   glassPromises.push(createGlass('Oversized Wine'));
//
//
//   var stylePromises = [];
//
//   stylePromises.push(createStyle('American Pale Ale'));
//   stylePromises.push(createStyle('American Amber Ale'));
//   stylePromises.push(createStyle('American Brown Ale'));
//   stylePromises.push(createStyle('Ordinary Bitter'));
//   stylePromises.push(createStyle('Best Bitter'));
//   stylePromises.push(createStyle('Strong Bitter'));
//   stylePromises.push(createStyle('British Golden Ale'));
//   stylePromises.push(createStyle('Autralian Sparkling Ale'));
//   stylePromises.push(createStyle('English Porter'));
//   stylePromises.push(createStyle('Baltic Porter'));
//   stylePromises.push(createStyle('Irish Stout'));
//   stylePromises.push(createStyle('English IPA'));
//   stylePromises.push(createStyle('American IPA'));
//   stylePromises.push(createStyle('Double IPA'));
//   stylePromises.push(createStyle('Dark Mild'));
//   stylePromises.push(createStyle('English Brown Ale'));
//   stylePromises.push(createStyle('Old Ale'));
//   stylePromises.push(createStyle('American Barleywine'));
//   stylePromises.push(createStyle('Witbier'));
//   stylePromises.push(createStyle('Belgian Pale Ale'));
//   stylePromises.push(createStyle('Saison'));
//   stylePromises.push(createStyle('Bière de Garde'));
//   stylePromises.push(createStyle('Irish Red Ale'));
//   stylePromises.push(createStyle('Scottish Light'));
//   stylePromises.push(createStyle('Scottish Heavy'));
//   stylePromises.push(createStyle('Scottish Export'));
//   stylePromises.push(createStyle('Scottish Wee Heavy'));
//   stylePromises.push(createStyle('Belgian Blond Ale'));
//   stylePromises.push(createStyle('Belgian Golden Strong Ale'));
//   stylePromises.push(createStyle('Belgian Dark Strong Ale'));
//   stylePromises.push(createStyle('Belgian Dubbel'));
//   stylePromises.push(createStyle('Belgian Tripel'));
//   stylePromises.push(createStyle('Weissbier'));
//   stylePromises.push(createStyle('Dunkles Weissbier'));
//   stylePromises.push(createStyle('Weizenbock'));
//
//
//
//   Parse.Promise.when(stylePromises.concat(glassPromises)).then(function(){
//     var relationPromises = [];
//
//     relationPromises.push(relate('American Pale Ale',['Pint','Mug']));
//     relationPromises.push(relate('Old Ale',['Snifter','Oversized Wine']));
//     relationPromises.push(relate('Saison',['Tulip','Oversized Wine']));
//     relationPromises.push(relate('Bière de Garde',['Tulip','Oversized Wine']));
//     relationPromises.push(relate('Belgian Dark Strong Ale',['Snifter', 'Tulip', 'Goblet']));
//     relationPromises.push(relate('Scottish Wee Heavy',['Snifter','Tulip']));
//     relationPromises.push(relate('Belgian Dubbel',['Goblet']));
//     relationPromises.push(relate('Belgian Tripel',['Snifter', 'Goblet']));
//     relationPromises.push(relate('Weizenbock',['Flute', 'Weizen']));
//
//
//
//
//
//
//
//
//
//
//
//     Parse.Promise.when(relationPromises).then(function(){
//       status.success('UHUUUUL');
//     });
//   });
//
//   console.log('All beers created');
// });
