module.exports = function(grunt) {
  "use strict";
  grunt.initConfig({
    jsonschema: {
      options: {
        strictKeywords: true
      },
      schema: {
        files: [{
          src: 'schema.json',
        }],
      },
      tests: {
        files: {
          'schema.json': 'data/*.json',
        },
      },
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
  grunt.loadNpmTasks('grunt-jsonschema-ajv');
  grunt.loadNpmTasks("grunt-contrib-jshint");
  grunt.registerTask("default", ["jshint:dev", "jsonschema"]);
  grunt.registerTask("lint", ["jshint:dev"]);
};
