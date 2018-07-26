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
      },function(error){
        console.log(error);
      });
      promises.push(p);
    });
  }
  console.log('Finished creating new styles');
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
  console.log('Finished creating new glasses');
  return Parse.Promise.when(promises);
};

///// RELATIONSHIPS S2 /////////////////////////////////////////////////////////

var relate = function(styleName,glassNames) {
	var styleQuery = new Parse.Query(Style);
	styleQuery.equalTo('name',styleName);

  return styleQuery.first().then(function(style) {

    if (style) {
      var glassQuery = new Parse.Query(Glass);
      glassQuery.containedIn('name',glassNames);

      return glassQuery.find().then(function(glasses){
        if (glasses) {
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
  console.log('Finished relating styles to glasses');
  return Parse.Promise.when(promises);
};

///// POINTERS /////////////////////////////////////////////////////////////////

var pointFather = function (styleName, fatherStyleName) {
  var styleQuery = new Parse.Query(Style);
  styleQuery.equalTo('name',styleName);

  return styleQuery.first().then(function(style) {

    if (style) {
      var fatherQuery = new Parse.Query(FatherStyle);
      fatherQuery.equalTo('name',fatherStyleName);

      return fatherQuery.first().then(function(fatherStyle){
        if (fatherStyle) {
          style.set('fatherStyle',fatherStyle);
          var p = style.save();
          return p.then(function(){
            return fatherStyle;
          }, function(error) {
            console.log(error);
            return fatherStyle;
          });
        } else {
          return Parse.Promise.as(fatherStyle);
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

  console.log('Finished connecting styles to their fathers.');
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
    console.log('Finished job');
    status.success('Happy hour xD');
  },function() {
    status.error('Oops, shit is up.');
  });
});

Parse.Cloud.job("deleteAllStyles", function(request,status) {
  var query = new Parse.Query(Style);
  query.limit(1000);
  query.find().then(function(styles){
    Parse.Object.destroyAll(styles).then(function(){
      status.success("Deleted up to 1000 items successfuly.");
    },function(error){
      status.success(error);
    });
  },function(error){
    status.error(error);
  });
});

Parse.Cloud.beforeSave("Style", function(request, response) {
  var obj = request.object;
  obj.set("lowercaseName",obj.get('name').toLowerCase());
    response.success();
});
