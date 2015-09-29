module.exports = function(grunt) {
  "use strict";
  grunt.initConfig({
    tv4: {
      options: {
        root: grunt.file.readJSON("schema.json"),
        banUnknownProperties: true
      },
      myTarget: {
        src: ["data/*.json"]
      }
    },
    jshint: {
      dev: [
        "Gruntfile.js",
        "schema.json",
        "data/*.json"
      ],
      options: {
        jshintrc: true
      }
    }
  });
  grunt.loadNpmTasks("grunt-tv4");
  grunt.loadNpmTasks("grunt-contrib-jshint");
  grunt.registerTask("default", ["jshint:dev", "tv4"]);
  grunt.registerTask("lint", ["jshint:dev"]);
};
