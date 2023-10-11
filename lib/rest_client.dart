import 'package:dio/dio.dart';
import 'package:learning_demo/models/person.dart';

class RestClient{

  late Dio _dio;//PUTTING _ MAKES THE VARIABLE PRIVATE
  static final RestClient _singleton = RestClient._initDio();

  //This line defines a factory constructor for the RestClient class. Factory constructors are used to control the instantiation of objects.
  //In this case, it returns the _singleton instance created earlier. Factory constructors allow you to ensure that only a single
  //instance of a class is created during the application's lifetime.
  factory RestClient(){
    return _singleton;
  }

  /*
  In Dart, if you declare a named constructor within a class using the syntax ClassName.constructorName {},
  you're not creating a new constructor, but rather defining a named constructor for that class.
  Named constructors allow you to create alternative ways to construct objects of that class, in addition to the default constructor.

    class MyClass {
    int value;

    MyClass(this.value); // Default constructor

    MyClass.namedConstructor() {
      value = 42;
    }
  }
  void main() {
    MyClass instance1 = MyClass(10); // Using the default constructor
    MyClass instance2 = MyClass.namedConstructor(); // Using the named constructor
  }
   */
  RestClient._initDio() {
    init();
  }

  void init() async{
    _dio = Dio();
    _dio.options.baseUrl = "https://randomuser.me/api/";
    _dio.options.validateStatus = (status) => status! < 300 && status >= 200; //! so its non-null - checks if the return status is 200-299 aka ok status
  }

  //.map<Person> is mapping the data onto the Person class
  //the (jI -> P.fJ) is specifying how to map the data
  Future<List<Person>> getPeople(int number) async{
    try{
      Response response = await _dio.get("", queryParameters: {"results": number}); //https://randomuser.me/api/?results=[number]
      return response.data["results"].map<Person>((jsonItem) => Person.fromJson(jsonItem)).toList();
    } on DioError catch (e) {
      throw e;
    }
  }

}
