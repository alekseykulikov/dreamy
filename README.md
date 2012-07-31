<pre>
  (  \/  )( \/ )  (  _ \(  _ \( ___)  /__\  (  \/  )/ __)
   )    (  \  /    )(_) ))   / )__)  /(__)\  )    ( \__ \
  (_/\/\_) (__)   (____/(_)\_)(____)(__)(__)(_/\/\_)(___/
</pre>

Mydreams is a super simple web-application which allows to write your dreams. You can check it by url [mydreams.herokuapp.com](http://mydreams.herokuapp.com/).
This app was developed as an example of usage [backbone.offline](https://github.com/Ask11/backbone.offline) library. 

### Interesting features

* Full offline HTML5 app;
* Full keyboard support;
* Asynchronous event driven application; 
* Yet another Rails 3.2/Backbone.js/CoffeeScript example;
* [Zurb foundation](http://foundation.zurb.com/docs/index.php) for design;
* Example of usage [HTML5 Cache Manifest](http://www.whatwg.org/specs/web-apps/current-work/multipage/offline.html) in Rails.

### Backbone.offline requirements

1. Add one line to initialize method to [dreams.coffee](https://github.com/Ask11/mydreams/blob/master/app/assets/javascripts/collections/dreams.coffee);
2. Default backbone REST API on server to [dreams_controller.rb](https://github.com/Ask11/mydreams/blob/master/app/controllers/api/dreams_controller.rb);
3. Model should have `updated_at` field [schema.rb](https://github.com/Ask11/mydreams/blob/master/db/schema.rb).

You can get more information in [how to use](https://github.com/Ask11/backbone.offline#how-to-use) section.

### License

Licensed under MIT license. © 2012 Aleksey Kulikov, [All Rights Reserved](https://github.com/Ask11/mydreams/blob/master/LICENSE).
