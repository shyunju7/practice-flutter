## Dart Variable
`var`, `타입 변수명 형식`, `dynamic`, `late`, `final`, `const` 키워드를 사용해 변수를 선언할 수 있다.

<br/>

### `var`키워드
```dart
void main() {
  var name = "현주";
  name = "hyunju";
  print(name);
  name = false; // 타입 변경은 불가능
}
```

- 관습적으로 함수나 메서드 내부에 지역 변수를 선언할 때 사용한다.
- 컴파일러가 이미 타입을 추론하고 있기 때문에 모든 변수의 타입을 지정하지 않아도 된다.(dart 스타일 권장 방식)
- 할당한 변수의 타입 변경은 불가능하다.
- dart언어에서 var는 가능한 많이 사용하는 것을 권장한다고 한다.

<br/>

### 타입 변수명 형식
```dart
void main() {
  String name = "현주";
  bool isName = true;
  int level = 3;
  double xp = 2500.99;
}
```
- class의 property 작성시 사용하는 것을 권장한다.
- `String`, `bool`, `int`, `double` 등이 있다.
  - `num`타입은 integer, double을 포함한 숫자 자료형이다.

<br/>

### `dynamic` 키워드
```dart
void main() {
  var foo; // dynamic 키워드를 명시하지 않았지만, 값을 할당하지 않으면 자동으로 dynamic타입이 된다.
  dynamic name;
  name = "현주";
  name = 12;
  name = true; 
}
```

- 여러가지 타입을 가질 수 있는 변수를 쓸 때 사용하는 키워드이다.
- 정말로 필요한 경우에만 사용해야한다.


<br/>

### Nullable Variables
```dart

void main(){
  String fisrtName = "HyunJu";
  firstName = null; // error : null을 참조할 수 없음

  String? lastName = "Song"; // String이거나 null이거나
  lastName = null;

  // 아래 if문을 한 줄로 표현할 수 있음
  lastName?.isNotEmpty;
}

```

- null을 가질 수 있는 타입을 말한다.
- 코드에서 null 값을 참조할 수 없도록 한다. null 값을 참조하면 런타임 에러가 발생한다.
- 컴파일 전에 해당 에러를 잡아내는 것이 null safety가 하는 일이다.


<br/>

### `final` 키워드

```dart
void main() {
  // 수정할 수 있는 변수
  var name = "현주";
  String myName = "현주";

  // 수정 불가한 변수
  final yourName = "주현";
  yourName = "주현주현";  // Error
}
```

- 수정 불가능하다.
- `typescript`, `javascript`의 `const`와 비슷한 개념이다.


<br/>

### `late` 키워드
```dart
void main() {
  late final String name;
  name = "api Result";
}
```
- 초기 데이터 없이 변수 선언을 할 수 있게 한다.
- 값을 넣기 전에 접근하려고 하면 막아준다.
- flutter에서 data fetching 할 때 유용하게 사용한다.




<br />

### Constant Variables
```dart
void main() {
  // const api = fetchApi(); // error

  // 컴파일 시점에서 바뀌는 값은 final로
  final api = fetchApi(); // good
}
```
- `typescript`와 `javascript`의 `const`와 다른 개념이다.
- dart언어에서는 compile-time-constant를 만들어준다.
- 값을 할당 후에는 수정할 수 없다.
- API 결과나 사용자가 입력한 값은 final이나 var 키워드를 사용한다.
- const는 상수와 같은 변수에 사용한다.





