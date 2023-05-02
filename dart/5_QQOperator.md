## Dart QQ Operator
`QQ Operator`가 무엇인지 정리한다.

<br />

### QQ Operator
객체가 null일 경우, 오류를 방지하고 다른 값을 할당시키는 연산자이다.

아래와 같이 `name` 파라미터를 받아 `name`이 null이 아니라면 대문자 형태로, null이라면 "ANON"을 반환하는 함수가 있다.

```dart
String capitalizeName(String? name) => name != null ? name.toUpperCase() : "ANON";
```

해당 함수를 `QQ Operator`로 표현하여 더 간결하게 처리할 수 있다. 기본 문법 형태는 `A ?? B`이며 A가 null이라면 B를 반환한다.

```dart
String capitalizeName(String? name) => name?.toUpperCase() ?? "ANON";
```

아래 코드를 실행하면 다음과 같은 결과를 얻을 수 있다.

```dart
void main() {
  capitalizeName("hyunju"); // output: HYUNJU
  capitalizeName(null); // output: ANON
}
```

또한, `??=`를 이용하여 값이 null인경우 값을 할당할 수 있다.
```dart
String? name;
name ?? = "hyunju";
print(name); // output: hyunju
```
