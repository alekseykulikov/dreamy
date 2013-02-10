// Backbone.position is plugin for Backbone.js to manage ordered lists
// https://github.com/Ask11/backbone.position
//
// (c) 2012-2013, Aleksey Kulikov
// May be freely distributed according to MIT license.

;(function(exports) {
  'use strict';

  // Generates unique float between 2 different float-values
  // Default value for prev is 0
  // If next is empty prev value round and increases to 1
  // So default value for first element will 1
  //
  // Examples:
  //
  //   between(0, 1)        # => 0.5
  //   between(0.0625, 1)   # => 0.53125
  //   between(10.5)        # => 12
  //   between()            # => 1
  //   between(null, 0.125) # => 0.0625
  //   between(2.25, 2.25)  # => 2.25 - the same value
  //   between(3, 2)        # throws Error, imposible situation for backbone.position
  //
  // Returns mean between prev and next
  function between(prev, next) {
    if (prev > next) throw new Error('Previous value greater than next value');
    if (!prev) prev = 0;
    if (!next)
      return Math.ceil(prev) + 1;
    else
      return (next - prev) / 2 + prev;
  }

  // Returns unique position value
  // based on selected position in collection
  function getPosition(position, collection) {
    var prev = collection.at(position - 1)
      , next = collection.at(position);

    if (prev) prev = prev.get('position');
    if (next) next = next.get('position');

    var betweenVal = between(prev, next);
    // For value close to 0 or too close with next
    // like prev = 1.9999999999999998 & next = 2 betweenVal will equal 2
    // changes next value before to get current position
    if (betweenVal === next || betweenVal === 0)
      return shiftNext(position, collection);
    else
      return betweenVal;
  }

  function getLastPosition(collection) {
    return between(collection.length > 0 ? collection.last().get('position') : 0);
  }

  function shiftNext(position, collection) {
    var next = collection.at(position);
    collection.saveTo(position + 1, next, { force: true });
    return getPosition(position, collection);
  }

  exports.Position = {
    between: between,

    comparator: function(model) {
      return model.get('position');
    },

    // Creates new model with selected position
    // Works similar to Backbone.Collection.prototype.create
    // But uses first parameter to set position field
    //
    // Examples:
    //
    //   var library = new Library([
    //     {id: 1, title: 'The Rough Riders', position: 1},
    //     {id: 2, title: 'War and Peace', position: 2},
    //     {id: 3, title: 'Moby Dick', position: 3}
    //   ]);
    //   var book = library.createTo(1, {title: 'Javascript. The Good Parts'});
    //   book.get('position');
    //   => 1.5 - used generator(1, 2)
    //
    // Returns result of Backbone.Collection.prototype.create
    createTo: function(position, model, options) {
      model = this._prepareModel(model, options);
      model.set({ position: getPosition(position, this, model) }, { silent: true });
      return this.create(model, options);
    },

    // Easy way to update model's position in collection
    // And force re-sorting. It does not forse save for new model.
    //
    // Examples:
    //
    //   var book = library.get(3);
    //   library.saveTo(0, book);
    //   => saves book to first position and forces re-sorting
    //
    // Returns updated and re-sorted collection
    saveTo: function(position, model, options) {
      if (!options) options = {};
      if (!options.force && (this.length === 1 || this.indexOf(model) === position))
        return this;

      if (position === this.length - 1) {
        model.set({ position: getLastPosition(this) });
      } else {
        model.set({ position: getLastPosition(this)}, { silent: true });
        this.sort({ silent: true });
        model.set({ position: getPosition(position, this, model) });
      }
      if (!model.isNew()) model.save(options);
      return this.sort();
    },

    // Adds model to collection on selected position
    // For new model it sets position, for existing model calls save
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
    addTo: function(position, model, options) {
      model.set({ position: getLastPosition(this) }, { silent: true });
      this.add(model, options);
      return this.saveTo(position, model, options);
    }
  };
}).call(this, (function() {
  return typeof Backbone !== 'undefined' ? Backbone : exports;
})());
