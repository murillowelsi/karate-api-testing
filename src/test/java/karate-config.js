function fn() {
  var env = karate.env;

  if (!env) {
    env = 'dev';
  }
  var config = karate.read('classpath:config.yml');

  var baseUrl = config.env[env];

  if (baseUrl) {
    config.baseUrl = baseUrl;
  }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  config.faker = Java.type('com.github.javafaker.Faker');

  karate.log('karate.env system property was:', env);

  return config;
}
