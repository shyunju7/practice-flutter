## Dart Function & Parameter
Dart 여러 function 유형과 파라미터 활용에 대해 정리한다.


<br/>

### `function`

```dart

// 반환값이 없는 경우
void sayHello(String name) {
  print("Hello $name nice to meet you!");
}

// 반환값이 있는 경우
String sayHello(String name) {
   return "Hello $name nice to meet you!";
}
```

<br/>

### `arrow function(화살표 함수)`

```dart
String sayBye(String potato) => "GoodBye $potato";

// num 자료형으로 리턴할 시 integer, double 모두 반환 타입이 된다.
num plus(num a, num b) => a + b;
```

<br/>

### Named Parameters

```dart
String sayHello({String name = "anon", int age = 9999, String country = "wakanda"}) {
   return "Hello $name, you are $age and you come $country";
}

// use
print(sayHello("hyunJu", 27, "Korea"));
```
- default Value를 설정해서 관리
- 파라미터가 3개이상이 되면 관리하기 어려움

<br/>

```dart
String sayHello({required String name, required int age, required String country }) {
   return "Hello $name, you are $age and you come $country";
}

// use
print(sayHello(age: 12, name: "kuna", country: "hoho"));
```
- required 속성을 통해 필수값 설정으로 관리
- 위치와 상고ㅓㅏㄴ없이 이름을 명시하여 사용할 수 있음 

<br/>

### Optional Positional Parameters
```dart
String sayHello(String name, int age, [String? country = "Korea"]) =>
     "Hello $name, you are $age yeares old from $country!";

void main() {
  var result = sayHello("hyunju", 12);
  print(result);
}
```
- 선택적 파라미터인 경우 대괄호로 감싸고 null safety처리 
