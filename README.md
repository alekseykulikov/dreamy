<pre>
 ____________   ___________         _____\    \     _____                ___________   ______   _____  
 \           \  \          \       /    / |    |  /      |_             /           \ |\     \ |     | 
  \           \  \    /\    \     /    /  /___/| /         \           /    _   _    \\ \     \|     | 
   |    /\     |  |   \_\    |   |    |__ |___|/|     /\    \         /    //   \\    \\ \           | 
   |   |  |    |  |      ___/    |       \      |    |  |    \       /    //     \\    \\ \____      | 
   |    \/     |  |      \  ____ |     __/ __   |     \/      \     /     \\_____//     \\|___/     /| 
  /           /| /     /\ \/    \|\    \  /  \  |\      /\     \   /       \ ___ /       \   /     / | 
 /___________/ |/_____/ |\______|| \____\/    | | \_____\ \_____\ /________/|   |\________\ /_____/  / 
|           | / |     | | |     || |    |____/| | |     | |     ||        | |   | |        ||     | /  
|___________|/  |_____|/ \|_____| \|____|   | |  \|_____|\|_____||________|/     \|________||_____|/   
                                          |___|/
</pre>

Dreamy is a super simple web-application which allows to write your dreams. You can check it by url [dreamyapp.herokuapp.com](http://dreamyapp.herokuapp.com/).
This app was developed as an example of usage [backbone.offline](https://github.com/Ask11/backbone.offline) library. 

### Interesting features

* Full offline HTML5 app;
* Full keyboard support;
* Asynchronous event driven application; 
* Yet another Rails 3.2/Backbone.js/CoffeeScript example;
* [Zurb foundation](http://foundation.zurb.com/docs/index.php) for design;
* Example of usage [HTML5 Cache Manifest](http://www.whatwg.org/specs/web-apps/current-work/multipage/offline.html) in Rails.

### Backbone.offline requirements

1. Add one line to initialize method to [dreams.coffee](https://github.com/Ask11/dreamy/blob/master/app/assets/javascripts/collections/dreams.module.coffee);
2. Default backbone REST API on server to [dreams_controller.rb](https://github.com/Ask11/dreamy/blob/master/app/controllers/api/dreams_controller.rb);
3. Model should have `updated_at` field [schema.rb](https://github.com/Ask11/dreamy/blob/master/db/schema.rb).

You can get more information about backbone.offline in [how to use](https://github.com/Ask11/backbone.offline#how-to-use) section.

### License

Licensed under MIT license. © 2012 Aleksey Kulikov, [All Rights Reserved](https://github.com/Ask11/dreamy/blob/master/LICENSE).
