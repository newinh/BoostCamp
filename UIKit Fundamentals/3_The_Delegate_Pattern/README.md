# The Delegate Pattern

이번 강좌에서는 *Delegate Pattern*에 대해 배우게 된다. 많은 UIView들이 이 디자인 패턴을 사용한다ㅇㅇ  
*Delegate*는 Model, View, Controller 사이에서 중요한 연결을 생성하는데 사용된다.

## Reuse with Customization
 *Delegate Pattern*은 같은 뷰 클래스가 다른 기능을 제공할 수 있게 해준다. (어떻게?)  
`view`는 있는 그대로 놔두고, `controller`와 `model`을 통해 자유롭게 커스터마이징하는거지.

> Delegate?  
an object that executes a group of methods on behalf of another object

다른 객체들을 대신, 메소드들을 실행하는 객체.

## Introducing to Protocols

**View**에서 일어난 변화에 대해 **Controller**가 대신 대응할 것이다. *Delegate Pattern*에 대한 핵심은 **View**가 *답변해야 할 질문*을 설정하고 *Protocol*에 적절한 답변들을 넣어 놓는것이다. 그 *Protocol*을 수행하는 모든 객체는 **Delegate(대리인)**이 될 수 있다.  

![Ptotocol1](./Ptotocol1.png)


## Diagramming the Text Field App

왼쪽에 있는 3개의 클래스는 모두 UITextfieldDelegate 프로토콜을 conform하고 있다.  
3번째 TextField의 Delegate를 viewController로 해준 까닭은 뷰의 레이블을 조작해야하기 때문!  
![Diagramming the Text Field App] (./Diagramming the Text Field App.png)

아래는 viewController.swfit ...
![Diagramming the Text Field App2](./Diagramming the Text Field App2.png)


# Challenge Apps
예제 3-1 App을 아래조건이 만족하도록 해보자!

Here is a breakdown of the requirements for the Challenge App:

- Zip code field. A text field that allows only digits, and a maximum of five characters.  
- Cash text field. A dollar sign field that begins with the text $0.00, and then fills in the dollar figure as digits are added. For example, typing 4-2-7-5 would produce $0.00, $0.04, $0.42, $4.27, $42.75.  
- Lockable text field. This is composed of a text field and a switch. When the switch is on, the text field can be edited. When the switch is off, the text field cannot be edited.  






