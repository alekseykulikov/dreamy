// Backbone.position is plugin for Backbone.js to manage ordered lists
// https://github.com/Ask11/backbone.position
//
// (c) 2012 - Aleksey Kulikov
// May be freely distributed according to MIT license.

(function(exports) {
  'use strict';

  // Generates unique float between 2 different float-values
  // Default value for prev is 0
  // If next is empty prev value round and increases to 1
  // So default value for first element will 1
  //
  // Examples:
  //
  //   floatGenerator(0, 1)      # => 0.5
  //   floatGenerator(0.0625, 1) # => 0.53125
  //   floatGenerator(10.5)      # => 12
  //   floatGenerator()          # => 1
  //
  // Returns mean between prev and next
  var floatGenerator = function(prev, next) {
    if (prev >= next) throw new Error('Prev value greater than next value');
    if (!prev) prev = 0;
    if (!next) {
      return Math.ceil(prev) + 1;
    } else {
      return (next - prev) / 2 + prev;
    }
  };

  // Returns unique position value
  // based on selected order in collection
  var getPosition = function(order, coll) {
    var prev = coll.at(order - 1);
    var next = coll.at(order);
    if (prev) prev = prev.get('position');
    if (next) next = next.get('position');

    return coll.generator(prev, next);
  };

  exports.Position = {
    generator: floatGenerator,

    comparator: function(model) {
      return model.get('position');
    },

    // Creates new model with selected order
    // Works similar to Backbone.Collection.prototype.create
    // But uses first parameter to set position field
    //
    // Examples:
    //
    //   var library = new Library([
    //     {id: 1, title: 'The Rough Riders', position: 1},
    //     {id: 2, title: 'World and Peace', position: 2},
    //     {id: 3, title: 'Moby Dick', position: 3}
    //   ]);
    //   book = library.createTo(1, {title: 'Javascript. The Good Parts'});
    //   book.get('position');
    //   => 1.5 - used generator(1, 2)
    //
    // Returns result of Backbone.Collection.prototype.create
    createTo: function(order, model, options) {
      model = this._prepareModel(model, options);
      model.set({position: getPosition(order, this)}, {silent: true});
      return this.create(model, options);
    },

    // Easy way to update model's order in collection
    // And force re-sorting
    //
    // Examples:
    //
    //   var book = library.get(3);
    //   library.saveTo(0, book);
    //   => saves book to first position and forces re-sorting
    //
    // Returns updated and re-sorted collection
    saveTo: function(order, model) {
      model.save({position: getPosition(order, this)});
      return this.sort();
    },

    // Adds existing model to current collection
    // updates position and model.collection attribute
    // Used to add model with existing position to another group
    //
    // Examples:
    //
    //   var anotherLibrary = new Library([{id: 11, position: 1}]);
    //   var book = library.get(1);
    //   anotherLibrary.addTo(0, book);
    //   book.get('position');
    //   => 0.5 - because anotherLibrary has one element with position 1
    //
    // Returns updated collection
    addTo: function(order, model) {
      var lastPosition = this.generator(this.length > 0 ? this.last().get('position') : 1);
      model.set({position: lastPosition}, {silent: true});
      this.add(model);
      return this.saveTo(order, model);
    }
  };
}).call(this, (function() {
  return typeof Backbone !== 'undefined' ? Backbone : exports;
})());
