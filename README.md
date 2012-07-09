<pre>
 ___
(  _`\
| | ) | _ __   __     _ _   ___ ___     __   _ __
| | | )( '__)/'__`\ /'_` )/' _ ` _ `\ /'__`\( '__)
| |_) || |  (  ___/( (_| || ( ) ( ) |(  ___/| |
(____/'(_)  `\____)`\__,_)(_) (_) (_)`\____)(_)
</pre>

Dreamer is a super simple web-application which allows to write your dreams. 
This app was developed as an example of usage [backbone.offline](https://github.com/Ask11/backbone.offline) library. In order to your app works well with [backbone.offline](https://github.com/Ask11/backbone.offline) you should:

1. Add one line to initialize method to [dreams.coffee](https://github.com/Ask11/dreamer/blob/master/app/assets/javascripts/collections/dreams.coffee);
2. Default backbone REST API on server to [dreams_controller.rb](https://github.com/Ask11/dreamer/blob/master/app/controllers/api/dreams_controller.rb);
3. Model should have `updated_at` field.

### Interesting features

* Full offline HTML5 app;
* Full keyboard support;
* Asynchronous event driven application; 
* Yet another Rails 3.2/Backbone.js/CoffeeScript example;
* [Zurb foundation](http://foundation.zurb.com/docs/index.php) for design;
* Example of usage [HTML5 Cache Manifest](http://www.whatwg.org/specs/web-apps/current-work/multipage/offline.html) in Rails.

### License

Licensed under MIT license. © 2012 Aleksey Kulikov, All Rights Reserved
[Full license text](https://github.com/Ask11/dreamer/blob/master/LICENSE)
