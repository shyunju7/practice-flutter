## Dart Collection
`List`, `Map`, `Set`과 같은 타입이 존재한다.


<br/>

### `List` 타입
```dart
void main() {
   var giveMeFive = true;
   List<int> nums = [1, 2, 3, 4, 5];

   // collection if 
   List<int> numbers = [
     1,
     2,
     3,
     4,
     if (giveMeFive) 5,
   ];
   
   print(numbers);

   // collection for
   var oldFriends = ["nico", "lynn"];
   var newFriends = [
     'lewis',
     'ralph',
     'darren',
     for(var friend in oldFriends) "❤ $friend"
   ];

   print(newFriends);
}


```

<br/>

### `Map` 타입
```dart
void main() {
   // Map<String, Object>
   // typescript로 따지면 Object는 any로 보면 됨
   // key-value형태의 Object를 만들 때 Map보다는
   // class사용하는 것 추천
   var player1 = {
     'name' : "hj",
     "xp" : 19.99,
     "superpower" : false,
     };

    // Map<String, String>
    var player2 = {
     'name' : "hj",
     "xp" : "19.99",
     "superpower" : "false",
     };

   // 빈 Map객체 생성
   Map<int, bool> player3 = {};
   }
```

<br/>

### `Set` 타입

```ㅇㅁㄳ

```
